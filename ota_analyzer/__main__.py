"""CLI entry point for the Motorola OTA Analyzer.

Run with::

    python -m ota_analyzer --help
"""

from __future__ import annotations

import argparse
import json
import logging
import re
import sys
from pathlib import Path

from ota_analyzer.analysis import BinaryAnalyzer, SmaliParser
from ota_analyzer.client import OTAClient
from ota_analyzer.config import Environment, Region
from ota_analyzer.models import CheckRequest, DeviceInfo, ExtraInfo, IdentityInfo


def _parse_fingerprint(fp: str) -> dict[str, str]:
    """Extract fields from a build fingerprint string.

    Format: ``brand/product/device:osVersion/buildId/incremental:type/tags``

    Example::

        motorola/lamul_g/lamul:15/VVTA35.51-18-6/1e9f09:user/release-keys
    """
    m = re.match(
        r"(?P<brand>[^/]+)/(?P<product>[^/]+)/(?P<device>[^:]+):"
        r"(?P<osVersion>[^/]+)/(?P<buildId>[^/]+)/(?P<incremental>[^:]+):"
        r"(?P<type>[^/]+)/(?P<tags>.+)",
        fp,
    )
    if not m:
        return {}
    return m.groupdict()


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        prog="ota_analyzer",
        description="Motorola OTA update analyzer – derived from smali analysis",
    )
    sub = parser.add_subparsers(dest="command", required=True)

    # -- check-update ------------------------------------------------------
    chk = sub.add_parser("check-update", help="Check for OTA updates")
    chk.add_argument("--model", required=True, help="Device model (ro.product.model)")
    chk.add_argument("--product", default="", help="Product name (ro.vendor.product.display)")
    chk.add_argument("--build-id", default="", help="Current build ID / number")
    chk.add_argument("--serial", default="", help="Device serial number (Build.getSerial)")
    chk.add_argument("--carrier", default="", help="Carrier name")
    chk.add_argument("--language", default="es-MX", help="Device locale (e.g. es-MX)")
    chk.add_argument("--country", default="", help="Country code (ro.product.locale.region)")
    chk.add_argument("--imei", default="", help="Primary IMEI")
    chk.add_argument("--imei2", default="", help="Secondary IMEI (dual-SIM)")
    chk.add_argument("--mccmnc", default="", help="Primary MCC+MNC")
    chk.add_argument("--mccmnc2", default="", help="Secondary MCC+MNC")
    chk.add_argument("--guid", default="", help="Device GUID (ro.mot.build.guid) – used as URL context key")
    chk.add_argument("--fingerprint", default="", help="Build fingerprint (ro.build.fingerprint). Auto-fills brand, product, device, osVersion, buildId, tags, type.")
    chk.add_argument("--sku", default="", help="Hardware SKU (ro.boot.hardware.sku)")
    chk.add_argument("--security-patch", default="", help="Security patch date (ro.build.version.security_patch)")
    chk.add_argument("--build-date-utc", default="", help="Build date UTC (ro.build.date.utc)")
    chk.add_argument("--os-version", default="", help="Android version (Build.VERSION.RELEASE)")
    chk.add_argument("--os-string", default="Linux:null:null", help="OS string (from HAR: Linux:null:null)")
    chk.add_argument("--hardware", default="", help="Hardware platform (Build.HARDWARE, e.g. mt6768)")
    chk.add_argument("--bootloader", default="", help="Bootloader version (Build.BOOTLOADER)")
    chk.add_argument("--radio", default="", help="Radio version (Build.getRadioVersion)")
    chk.add_argument("--dev-region", default="US", help="Device region (ro.product.locale region part)")
    chk.add_argument("--provisioned-time", type=int, default=0, help="Provisioned time (long timestamp)")
    chk.add_argument("--additional-info", default="", help="Additional info JSON string (battery/memory/network)")
    chk.add_argument("--product-wave", default="unknown", help="Product wave (ro.mot.product_wave)")
    chk.add_argument("--build-product-increment", default="unknown", help="Build product increment (ro.mot.build.product.increment)")
    chk.add_argument("--veritymode", default="unknown", help="Verity mode (ro.boot.veritymode)")
    chk.add_argument("--system-verified", default="unknown", help="System verified (partition.system.verified)")
    chk.add_argument(
        "--region",
        choices=["global", "prc"],
        default="prc",
        help="Server region (HAR shows moto-cds.svcmot.cn works)",
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

    # Auto-fill fields from fingerprint when provided
    # Format: brand/product/device:osVersion/buildId/incremental:type/tags
    fp_fields = _parse_fingerprint(args.fingerprint) if args.fingerprint else {}
    build_id = args.build_id or fp_fields.get("buildId", "")
    os_version = args.os_version or fp_fields.get("osVersion", "")
    # HAR shows deviceInfo.product is empty ("") — NOT from fingerprint
    product = args.product
    device = fp_fields.get("device", args.product)
    brand = fp_fields.get("brand", "motorola")
    incremental = fp_fields.get("incremental", "")
    build_type = fp_fields.get("type", "user")
    build_tags = fp_fields.get("tags", "release-keys")
    serial = args.serial or "SERIAL_NUMBER_NOT_AVAILABLE"

    request = CheckRequest(
        request_id=serial,  # id = BuildPropertyUtils.getId() = serial
        device_info=DeviceInfo(
            manufacturer="motorola",
            hardware=args.hardware,
            brand=brand,
            model=args.model,
            product=product,  # HAR: empty string
            os=args.os_string,  # HAR: "Linux:null:null"
            os_version=os_version,
            country=args.country,
            region=args.dev_region,
            language=args.language.split("-")[0] if "-" in args.language else args.language,
            user_language=args.language.replace("-", "_"),
        ),
        extra_info=ExtraInfo(
            carrier=args.carrier,
            bootloader_version=args.bootloader,
            brand=brand,
            model=args.model,
            fingerprint=args.fingerprint,
            radio_version=args.radio,
            build_tags=build_tags,
            build_type=build_type,
            build_device=device,
            build_id=build_id,
            build_display_id=build_id,
            build_incremental_version=incremental,
            release_version=os_version,
            ota_source_sha1=args.guid,
            network="WIFI",  # HAR: uppercase
            apk_version=3500094,
            provisioned_time=args.provisioned_time,
            incremental_version=0,
            additional_info=args.additional_info,
            user_location="Non-CN",
            bootloader_status="not-applicable",  # HAR value
            device_rooted="false",
            is_4gb_ram=False,
            device_chipset="Others",
            imei=args.imei or "IMEI_NOT_AVAILABLE",
            mccmnc=args.mccmnc or "MCCMNC_NOT_AVAILABLE",
            imei2=args.imei2 or "IMEI_NOT_AVAILABLE",
            mccmnc2=args.mccmnc2 or "MCCMNC_NOT_AVAILABLE",
            security_version=args.security_patch,
            ro_mot_product_wave=args.product_wave,
            ro_mot_build_product_increment=args.build_product_increment,
            ro_boot_veritymode=args.veritymode,
            partition_system_verified=args.system_verified,
            ro_virtual_ab_enabled=True,  # HAR value
        ),
        identity_info=IdentityInfo(serial_number=serial),
        context_key=args.guid,
    )

    print("=" * 60)
    print("  Motorola OTA Update Check")
    print("=" * 60)
    print(f"  Device      : {args.model}")
    print(f"  Product     : {product}")
    print(f"  Build       : {build_id}")
    print(f"  Fingerprint : {args.fingerprint or '(not provided)'}")
    print(f"  GUID        : {args.guid or '(not provided)'}")
    print(f"  IMEI        : {args.imei or '(not provided)'}")
    print(f"  Serial      : {serial}")
    print(f"  Server      : {environment.value} ({region.value})")
    print("=" * 60)
    print()

    try:
        with OTAClient.create(region=region, environment=environment) as client:
            response = client.check_update(request)
    except ConnectionError as exc:
        print(f"❌ Connection failed: {exc}", file=sys.stderr)
        return 1

    print(json.dumps(response.raw or {}, indent=2, ensure_ascii=False))

    if response.has_update:
        print("\n✅ Update available!")
        print(f"   Tracking ID : {response.tracking_id}")
        print(f"   Context     : {response.context}")
        print(f"   Context Key : {response.context_key}")
        if response.content:
            for key in ("title", "description", "size", "version"):
                val = response.content.get(key, "")
                if val:
                    print(f"   {key.title():<12s}: {val}")
    else:
        print("\nℹ️  No update available.")
        print(f"   Poll again in: {response.poll_after_seconds}s "
              f"({response.poll_after_seconds // 3600}h)")

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
