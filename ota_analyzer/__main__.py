"""CLI entry point for the Motorola OTA Analyzer.

Run with::

    python -m ota_analyzer --help
"""

from __future__ import annotations

import argparse
import json
import logging
import sys
from pathlib import Path

from ota_analyzer.analysis import BinaryAnalyzer, SmaliParser
from ota_analyzer.client import OTAClient
from ota_analyzer.config import Environment, Region
from ota_analyzer.models import CheckRequest, DeviceInfo, ExtraInfo, IdentityInfo


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        prog="ota_analyzer",
        description="Motorola OTA update analyzer – derived from smali analysis",
    )
    sub = parser.add_subparsers(dest="command", required=True)

    # -- check-update ------------------------------------------------------
    chk = sub.add_parser("check-update", help="Check for OTA updates")
    chk.add_argument("--model", required=True, help="Device model (ro.product.model)")
    chk.add_argument("--product", default="", help="Product name (ro.build.product)")
    chk.add_argument("--build-id", default="", help="Current build ID")
    chk.add_argument("--serial", default="", help="Device serial number")
    chk.add_argument("--carrier", default="", help="Carrier name")
    chk.add_argument("--language", default="en-US", help="Device locale")
    chk.add_argument(
        "--region",
        choices=["global", "prc"],
        default="global",
        help="Server region",
    )
    chk.add_argument(
        "--env",
        choices=["production", "staging", "qa", "development"],
        default="production",
        help="Server environment",
    )

    # -- analyze-smali -----------------------------------------------------
    sml = sub.add_parser("analyze-smali", help="Analyze smali bytecode")
    sml.add_argument("path", help="Path to smali directory")
    sml.add_argument(
        "--search",
        default="",
        help="Regex pattern to search in constant strings",
    )
    sml.add_argument(
        "--methods",
        default="",
        help="Regex pattern to search in method names",
    )
    sml.add_argument(
        "--path-filter",
        default="",
        help="Only consider files whose path contains this substring",
    )

    # -- analyze-binary ----------------------------------------------------
    binp = sub.add_parser(
        "analyze-binary", help="Disassemble a native .so library"
    )
    binp.add_argument("path", help="Path to .so file")
    binp.add_argument(
        "--arch",
        choices=["arm", "arm64", "x86", "x86_64"],
        default="arm64",
        help="CPU architecture",
    )
    binp.add_argument("--offset", type=int, default=0, help="Start offset")
    binp.add_argument("--size", type=int, default=256, help="Bytes to disassemble")
    binp.add_argument(
        "--strings", action="store_true", help="Extract strings instead of disassembling"
    )
    binp.add_argument(
        "--auth-patterns",
        action="store_true",
        help="Search for authentication-related strings",
    )

    # -- common options ----------------------------------------------------
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="Enable debug logging"
    )

    return parser.parse_args(argv)


def _cmd_check_update(args: argparse.Namespace) -> int:
    region = Region.PRC if args.region == "prc" else Region.GLOBAL
    environment = Environment(args.env)

    request = CheckRequest(
        device_info=DeviceInfo(
            model=args.model,
            product=args.product,
            carrier=args.carrier,
            is_prc=(region == Region.PRC),
            user_language=args.language,
        ),
        extra_info=ExtraInfo(build_id=args.build_id),
        identity_info=IdentityInfo(serial_number=args.serial),
    )

    with OTAClient.create(region=region, environment=environment) as client:
        response = client.check_update(request)

    print(json.dumps(response.raw or {}, indent=2, ensure_ascii=False))

    if response.has_update:
        print("\n✅ Update available!")
        print(f"   Tracking ID : {response.tracking_id}")
        print(f"   Context     : {response.context}")
        print(f"   Context Key : {response.context_key}")
    else:
        print("\nℹ️  No update available.")

    return 0


def _cmd_analyze_smali(args: argparse.Namespace) -> int:
    parser = SmaliParser(args.path)

    if args.search:
        strings = parser.find_strings(
            args.search, path_filter=args.path_filter
        )
        print(f"Found {len(strings)} matching strings:\n")
        for s in strings:
            print(f"  {s.file}:{s.line_number}  [{s.register}] \"{s.value}\"")
        return 0

    if args.methods:
        methods = parser.find_methods(
            args.methods, path_filter=args.path_filter
        )
        print(f"Found {len(methods)} matching methods:\n")
        for m in methods:
            print(
                f"  {m.file}:{m.line_number}  "
                f"{m.access_flags} {m.name}({m.parameters}){m.return_type}"
            )
        return 0

    # Default: show class hierarchy
    hierarchy = parser.extract_class_hierarchy(path_filter=args.path_filter)
    print(f"Class hierarchy ({len(hierarchy)} classes):\n")
    for cls, parent in sorted(hierarchy.items()):
        print(f"  {cls} → {parent}")
    return 0


def _cmd_analyze_binary(args: argparse.Namespace) -> int:
    analyzer = BinaryAnalyzer(args.path, arch=args.arch)
    print(f"Binary: {args.path}  ({analyzer.file_size:,} bytes)\n")

    if args.auth_patterns:
        patterns = analyzer.find_auth_patterns()
        print(f"Authentication-related strings ({len(patterns)}):\n")
        for s in patterns:
            print(f"  0x{s.offset:08x}  \"{s.value}\"")
        return 0

    if args.strings:
        strings = analyzer.extract_strings()
        print(f"Extracted strings ({len(strings)}):\n")
        for s in strings:
            print(f"  0x{s.offset:08x}  \"{s.value}\"")
        return 0

    # Default: disassemble
    instructions = analyzer.disassemble(
        offset=args.offset, size=args.size
    )
    print(f"Disassembly at offset 0x{args.offset:x} ({args.size} bytes):\n")
    for instr in instructions:
        print(f"  0x{instr.address:08x}  {instr.mnemonic:<8s}  {instr.operands}")
    return 0


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(levelname)-8s %(name)s: %(message)s",
    )

    dispatch = {
        "check-update": _cmd_check_update,
        "analyze-smali": _cmd_analyze_smali,
        "analyze-binary": _cmd_analyze_binary,
    }
    handler = dispatch.get(args.command)
    if handler is None:
        print(f"Unknown command: {args.command}", file=sys.stderr)
        return 1
    return handler(args)


if __name__ == "__main__":
    sys.exit(main())
