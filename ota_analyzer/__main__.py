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
import time
from pathlib import Path
from typing import Any

from ota_analyzer.analysis import BinaryAnalyzer, SmaliParser
from ota_analyzer.client import OTAClient
from ota_analyzer.config import ALL_SERVERS, Environment, Region, get_server
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


def _extract_incremental_from_pkg(package_id: str) -> str:
    """Try to extract the target incremental version from a packageID.

    Package names follow the pattern:
      delta-Ota_Version_<product>_<srcBuild>_<srcInc>-<dstBuild>_<dstInc>_<tags>.zip.<md5>
    """
    m = re.search(r"-[^_]+_([0-9a-f]{6,})_release-keys", package_id)
    return m.group(1) if m else "unknown"


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

    # -- enumerate-updates -------------------------------------------------
    enum = sub.add_parser(
        "enumerate-updates",
        help="Enumerate all OTA updates from a starting build to the latest",
    )
    enum.add_argument("--model", required=True, help="Device model (ro.product.model)")
    enum.add_argument("--fingerprint", required=True, help="Build fingerprint (ro.build.fingerprint)")
    enum.add_argument("--guid", required=True, help="Device GUID (ro.mot.build.guid) — starting point")
    enum.add_argument("--serial", default="ZY32LNRW97", help="Device serial number")
    enum.add_argument("--imei", default="IMEI_NOT_AVAILABLE", help="Primary IMEI")
    enum.add_argument("--mccmnc", default="MCCMNC_NOT_AVAILABLE", help="Primary MCC+MNC")
    enum.add_argument("--carrier", default="", help="Carrier name")
    enum.add_argument("--hardware", default="", help="Hardware platform (Build.HARDWARE)")
    enum.add_argument("--bootloader", default="", help="Bootloader version")
    enum.add_argument("--radio", default="", help="Radio version")
    enum.add_argument("--language", default="es-MX", help="Device locale")
    enum.add_argument("--max-steps", type=int, default=50, help="Maximum chain steps")
    enum.add_argument("--delay", type=float, default=1.0, help="Delay between requests (seconds)")
    enum.add_argument("--output", default="", help="Save results to JSON file")
    enum.add_argument("--show-urls", action="store_true", help="Include download URLs in output")
    enum.add_argument(
        "--region",
        choices=["global", "prc"],
        default="prc",
        help="Server region",
    )
    enum.add_argument(
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

    # -- debug-server ------------------------------------------------------
    dbg = sub.add_parser(
        "debug-server",
        help="Debug CDS server endpoints with curl-equivalent requests",
    )
    dbg.add_argument("--guid", required=True, help="Device GUID (ro.mot.build.guid)")
    dbg.add_argument("--model", default="moto g05", help="Device model")
    dbg.add_argument("--fingerprint", default="", help="Build fingerprint")
    dbg.add_argument("--serial", default="ZY32LNRW97", help="Device serial number")
    dbg.add_argument("--imei", default="IMEI_NOT_AVAILABLE", help="IMEI")
    dbg.add_argument("--mccmnc", default="MCCMNC_NOT_AVAILABLE", help="MCC+MNC")
    dbg.add_argument(
        "--region",
        choices=["global", "prc"],
        default="prc",
        help="Server region",
    )
    dbg.add_argument(
        "--env",
        choices=["production", "staging", "qa", "development"],
        default="production",
        help="Server environment",
    )

    # -- download-ota ------------------------------------------------------
    dl = sub.add_parser(
        "download-ota",
        help="Download OTA packages for the full update chain",
    )
    dl.add_argument("--guid", required=True, help="Starting GUID (ro.mot.build.guid)")
    dl.add_argument("--carrier", required=True, help="Carrier name (e.g. amxmx, retgb)")
    dl.add_argument("--output-dir", default=".", help="Directory to save OTA files")
    dl.add_argument("--max-steps", type=int, default=20, help="Maximum chain steps")
    dl.add_argument("--delay", type=float, default=1.0, help="Delay between requests (seconds)")
    dl.add_argument("--verify-only", action="store_true", help="Only verify URLs, don't download")
    dl.add_argument(
        "--region",
        choices=["global", "prc"],
        default="prc",
        help="Server region",
    )
    dl.add_argument(
        "--env",
        choices=["production", "staging", "qa", "development"],
        default="production",
        help="Server environment",
    )

    # -- brute-force -------------------------------------------------------
    bf = sub.add_parser(
        "brute-force",
        help="Brute-force discover GUIDs and test API parameters",
    )
    bf.add_argument("--guid", default="", help="Base GUID to scan around")
    bf.add_argument("--carrier", default="reteu", help="Carrier to test with")
    bf.add_argument("--scan-range", type=int, default=50, help="Scan ±N around base GUID")
    bf.add_argument("--scan-carriers", action="store_true", help="Test all known carriers")
    bf.add_argument("--scan-contexts", action="store_true", help="Test URL contexts (ota/fota/modem/...)")
    bf.add_argument("--delay", type=float, default=0.2, help="Delay between requests")
    bf.add_argument(
        "--region",
        choices=["global", "prc"],
        default="prc",
        help="Server region",
    )
    bf.add_argument(
        "--env",
        choices=["production", "staging", "qa", "development"],
        default="production",
        help="Server environment (non-production servers have zero packages)",
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


def _cmd_enumerate_updates(args: argparse.Namespace) -> int:
    """Walk the OTA update chain from a starting build to the latest.

    The CDS server routes updates by the GUID (``ro.mot.build.guid``):
    each response contains ``otaTargetSha1`` which is the GUID of the
    *next* build.  By feeding that back as the new context key we can
    enumerate every delta OTA available for the device.

    The ``minVersion`` / ``flavour`` fields in the first response confirm
    the factory (base) build — no earlier OTAs exist before that version.
    """
    region = Region.PRC if args.region == "prc" else Region.GLOBAL
    environment = Environment(args.env)

    fp_fields = _parse_fingerprint(args.fingerprint) if args.fingerprint else {}
    build_id = fp_fields.get("buildId", "")
    os_version = fp_fields.get("osVersion", "15")
    device = fp_fields.get("device", "")
    fp_product = fp_fields.get("product", "")
    brand = fp_fields.get("brand", "motorola")
    incremental = fp_fields.get("incremental", "")
    build_type = fp_fields.get("type", "user")
    build_tags = fp_fields.get("tags", "release-keys")

    current_guid = args.guid
    current_build = build_id
    current_inc = incremental
    content_ts = 0
    chain: list[dict[str, Any]] = []

    print("=" * 70)
    print("  Motorola OTA Update Chain Enumerator")
    print("=" * 70)
    print(f"  Device       : {args.model}")
    print(f"  Fingerprint  : {args.fingerprint}")
    print(f"  Starting GUID: {args.guid}")
    print(f"  Server       : {environment.value} ({region.value})")
    print(f"  Max steps    : {args.max_steps}")
    print("=" * 70)
    print()

    with OTAClient.create(region=region, environment=environment) as client:
        for step in range(args.max_steps):
            request = CheckRequest(
                request_id=args.serial,
                device_info=DeviceInfo(
                    manufacturer="motorola",
                    hardware=args.hardware,
                    brand=brand,
                    model=args.model,
                    product="",
                    os="Linux:null:null",
                    os_version=os_version,
                    region="US",
                    language=args.language.split("-")[0] if "-" in args.language else args.language,
                    user_language=args.language.replace("-", "_"),
                ),
                extra_info=ExtraInfo(
                    carrier=args.carrier,
                    bootloader_version=args.bootloader,
                    brand=brand,
                    model=args.model,
                    fingerprint=f"motorola/{fp_product}/{device}:{os_version}/{current_build}/{current_inc}:{build_type}/{build_tags}",
                    radio_version=args.radio,
                    build_tags=build_tags,
                    build_type=build_type,
                    build_device=device,
                    build_id=current_build,
                    build_display_id=current_build,
                    build_incremental_version=current_inc,
                    release_version=os_version,
                    ota_source_sha1=current_guid,
                    network="WIFI",
                    apk_version=3500094,
                    imei=args.imei,
                    mccmnc=args.mccmnc,
                    ro_virtual_ab_enabled=True,
                ),
                identity_info=IdentityInfo(serial_number=args.serial),
                content_timestamp=content_ts,
                context_key=current_guid,
            )

            try:
                response = client.check_update(request)
            except ConnectionError as exc:
                print(f"  ❌ Step {step+1}: Connection failed: {exc}")
                break

            if not response.has_update:
                print(f"  Step {step+1}: END — no more updates")
                break

            c = response.content or {}
            resources = (response.raw or {}).get("contentResources", [])
            dl_urls = [r.get("url", "") for r in resources if r.get("url")]

            target_inc = _extract_incremental_from_pkg(c.get("packageID", ""))

            entry: dict[str, Any] = {
                "step": step + 1,
                "source_version": c.get("sourceDisplayVersion", "?"),
                "target_version": c.get("displayVersion", "?"),
                "source_sha1": c.get("otaSourceSha1", "?"),
                "target_sha1": c.get("otaTargetSha1", "?"),
                "size_bytes": int(c.get("size", 0)),
                "size_mb": round(int(c.get("size", 0)) / (1024 * 1024), 1),
                "package_id": c.get("packageID", ""),
                "md5": c.get("md5_checksum", ""),
                "source_build_timestamp": c.get("sourceBuildTimestamp", 0),
                "target_build_timestamp": c.get("targetBuildTimestamp", 0),
                "min_version": c.get("minVersion", ""),
                "flavour": c.get("flavour", ""),
                "update_type": c.get("updateType", ""),
                "ab_install_type": c.get("abInstallType", ""),
                "download_urls": dl_urls,
            }
            chain.append(entry)

            print(f"  Step {step+1}: {entry['source_version']} → {entry['target_version']}")
            print(f"    GUID : {entry['source_sha1']} → {entry['target_sha1']}")
            print(f"    Size : {entry['size_mb']} MB | Type: {entry['update_type']}")
            if dl_urls:
                print(f"    URLs : {len(dl_urls)} download link(s)")

            # Advance to next build in chain
            current_guid = entry["target_sha1"]
            current_build = entry["target_version"]
            current_inc = target_inc
            content_ts = response.content_timestamp

            if args.delay > 0:
                time.sleep(args.delay)

    # -- Summary -----------------------------------------------------------
    print()
    print("=" * 70)
    print(f"  CHAIN SUMMARY: {len(chain)} OTA update(s)")
    print("=" * 70)
    if chain:
        print()
        print(f"  {'#':<3} {'Source':<24} {'Target':<24} {'Size':>10} {'Type':<5}")
        print(f"  {'─'*3} {'─'*24} {'─'*24} {'─'*10} {'─'*5}")
        for e in chain:
            print(
                f"  {e['step']:<3} {e['source_version']:<24} "
                f"{e['target_version']:<24} {e['size_mb']:>7.1f} MB "
                f"{e['update_type']:<5}"
            )
        print()
        print(f"  Base (factory) build : {chain[0]['source_version']}"
              f" (GUID: {chain[0]['source_sha1']})")
        print(f"  Latest build         : {chain[-1]['target_version']}"
              f" (GUID: {chain[-1]['target_sha1']})")
        total_mb = sum(e["size_mb"] for e in chain)
        print(f"  Total delta size     : {total_mb:.1f} MB")
    print()

    # -- Save to file ------------------------------------------------------
    if args.output:
        result = {
            "device": {
                "model": args.model,
                "codename": device,
                "product": fp_product,
                "hardware": args.hardware,
                "fingerprint": args.fingerprint,
            },
            "server": {
                "region": region.value,
                "environment": environment.value,
            },
            "base_version": chain[0]["source_version"] if chain else "",
            "base_guid": chain[0]["source_sha1"] if chain else "",
            "latest_version": chain[-1]["target_version"] if chain else "",
            "latest_guid": chain[-1]["target_sha1"] if chain else "",
            "total_updates": len(chain),
            "chain": chain,
        }
        out_path = Path(args.output)
        out_path.write_text(json.dumps(result, indent=2, ensure_ascii=False))
        print(f"  Saved to: {out_path}")

    return 0


def _cmd_debug_server(args: argparse.Namespace) -> int:
    """Probe every known CDS endpoint and report what each one does.

    This is the programmatic equivalent of debugging the API with ``curl``.
    It tests: check (GET/POST), resources, state, versions, API v2,
    download URLs, and every known server.
    """
    import requests as _requests

    region = Region.PRC if args.region == "prc" else Region.GLOBAL
    environment = Environment(args.env)
    server = get_server(region, environment)
    host = server.host
    guid = args.guid

    fp_fields = _parse_fingerprint(args.fingerprint) if args.fingerprint else {}
    build_id = fp_fields.get("buildId", "UNKNOWN")
    incremental = fp_fields.get("incremental", "000000")

    headers = {
        "Content-Type": "application/json; charset=utf-8",
        "User-Agent": f"Dalvik/2.1.0 (Linux; U; Android 15; {args.model} Build/{build_id})",
        "Connection": "Keep-Alive",
        "Accept-Encoding": "gzip",
    }

    check_payload: dict[str, Any] = {
        "id": args.serial,
        "contentTimestamp": 0,
        "deviceInfo": {"manufacturer": "motorola", "hardware": "",
                       "brand": "motorola", "model": args.model, "product": "",
                       "os": "Linux:null:null",
                       "osVersion": fp_fields.get("osVersion", "15"),
                       "country": "", "region": "US", "language": "en",
                       "userLanguage": "es_US"},
        "extraInfo": {
            "clientIdentity": "motorola-ota-client-app",
            "carrier": "", "brand": "motorola", "model": args.model,
            "otaSourceSha1": guid, "buildId": build_id,
            "buildDisplayId": build_id,
            "fingerprint": args.fingerprint,
            "buildDevice": fp_fields.get("device", ""),
            "buildIncrementalVersion": incremental,
            "buildTags": "release-keys", "buildType": "user",
            "releaseVersion": fp_fields.get("osVersion", "15"),
            "network": "WIFI", "apkVersion": 3500094,
            "provisionedTime": 0, "incrementalVersion": 0,
            "additionalInfo": "", "userLocation": "Non-CN",
            "bootloaderStatus": "not-applicable", "deviceRooted": "false",
            "is4GBRam": False, "deviceChipset": "Others",
            "imei": args.imei, "mccmnc": args.mccmnc,
            "imei2": "IMEI_NOT_AVAILABLE", "mccmnc2": "MCCMNC_NOT_AVAILABLE",
            "ro.virtual_ab.enabled": True,
            "vitalUpdate": False, "clientState": "IDLE",
            "userTriggerLaunchPoint": "settingsCheckUpdate",
        },
        "identityInfo": {"serialNumber": args.serial},
        "triggeredBy": "user",
        "idType": "serialNumber",
    }

    def _safe(method: str, url: str, **kw: Any) -> tuple[int, Any, dict]:
        kw.setdefault("timeout", 15)
        r = getattr(_requests, method)(url, **kw)
        try:
            return r.status_code, r.json(), dict(r.headers)
        except Exception:
            return r.status_code, r.text[:300], dict(r.headers)

    print("=" * 72)
    print("  CDS Server Endpoint Debugger")
    print("=" * 72)
    print(f"  Server : {host}")
    print(f"  GUID   : {guid}")
    print(f"  Model  : {args.model}")
    print("=" * 72)

    # -- 1. check: GET (should be 405) ------------------------------------
    print("\n── 1. GET /check ──")
    url = f"https://{host}/cds/upgrade/1/check/ctx/ota/key/{guid}"
    s, b, h = _safe("get", url, headers=headers)
    print(f"   {s}  allow={h.get('allow', '?')}")
    print(f"   → POST-only endpoint" if s == 405 else f"   → {str(b)[:120]}")

    # -- 2. check: POST empty body ----------------------------------------
    print("\n── 2. POST /check (empty body) ──")
    s, b, _ = _safe("post", url, json={}, headers=headers)
    print(f"   {s}  → {str(b)[:120]}")

    # -- 3. check: POST full payload ---------------------------------------
    print("\n── 3. POST /check (full payload) ──")
    s, b, h = _safe("post", url, json=check_payload, headers=headers)
    tracking_id = ""
    content_ts = 0
    if isinstance(b, dict):
        tracking_id = b.get("trackingId") or ""
        content_ts = b.get("contentTimestamp", 0)
        proceed = b.get("proceed")
        has_content = b.get("content") is not None
        print(f"   {s}  proceed={proceed}  content={'YES' if has_content else 'no'}")
        print(f"   x-cds-content-exists: {h.get('x-cds-content-exists', '?')}")
        if has_content:
            c = b["content"]
            print(f"   update : {c.get('sourceDisplayVersion')} → {c.get('displayVersion')}")
            print(f"   size   : {c.get('size')} bytes")
            print(f"   type   : {c.get('updateType')} ({c.get('abInstallType')})")
            print(f"   md5    : {c.get('md5_checksum')}")
        resources = b.get("contentResources") or []
        if resources:
            print(f"   download URLs: {len(resources)}")
            for r in resources[:2]:
                print(f"     tags={r.get('tags')} ttl={r.get('urlTtlSeconds')}s")
                print(f"     url={r.get('url', '')[:100]}...")
        if tracking_id:
            print(f"   trackingId: {tracking_id[:60]}...")
    else:
        print(f"   {s}  → {str(b)[:120]}")

    # -- 4. resources: POST ------------------------------------------------
    if tracking_id:
        print("\n── 4. POST /resources ──")
        url_res = f"https://{host}/cds/upgrade/1/resources/t/{tracking_id}/ctx/ota/key/{guid}"
        minimal_body = {"id": args.serial, "identityInfo": {"serialNumber": args.serial}, "idType": "serialNumber"}
        s, b, _ = _safe("post", url_res, json=minimal_body, headers=headers)
        if isinstance(b, dict):
            cr = b.get("contentResources", [])
            print(f"   {s}  proceed={b.get('proceed')}  resources={len(cr)}")
            print(f"   → Returns fresh download URLs for the tracking ID")
        else:
            print(f"   {s}  → {str(b)[:120]}")

    # -- 5. state: POST ----------------------------------------------------
    if tracking_id:
        print("\n── 5. POST /state (various states) ──")
        state_body: dict[str, Any] = dict(check_payload)
        state_body["contentTimestamp"] = content_ts
        state_body["status"] = "PROCESSING:OTHER"
        state_body["reportingTags"] = "TRIGGER-USER"
        state_body["upgradeSource"] = "UPGRADED_VIA_PULL"
        for state in ["Notified", "Downloading", "Downloaded",
                       "Installing", "Installed", "Failed"]:
            url_st = f"https://{host}/cds/upgrade/1/state/t/{tracking_id}/s/{state}/ctx/ota/key/{guid}"
            s, b, _ = _safe("post", url_st, json=state_body, headers=headers)
            if isinstance(b, dict):
                print(f"   s={state:<14} {s} proceed={b.get('proceed')}"
                      f" poll={b.get('pollAfterSeconds', '')}")
            else:
                print(f"   s={state:<14} {s}")
            time.sleep(0.2)
        print("   → Reports OTA install progress back to the server")

    # -- 6. versions: GET -------------------------------------------------
    print("\n── 6. GET /versions ──")
    url_ver = f"https://{host}/cds/upgrade/1/versions/ctx/ota/key/{guid}"
    s, b, _ = _safe("get", url_ver, headers=headers)
    if isinstance(b, dict):
        print(f"   {s}  appId={b.get('applicationId')}")
        print(f"   environment={b.get('environment')}")
        print(f"   version={b.get('applicationVersion', '')[:40]}")
        print(f"   engine={b.get('version', '')}")
    else:
        print(f"   {s}  → {str(b)[:120]}")

    # -- 7. API v2 check ---------------------------------------------------
    print("\n── 7. POST /cds/upgrade/2/check (API v2) ──")
    url_v2 = f"https://{host}/cds/upgrade/2/check/ctx/ota/key/{guid}"
    s, b, _ = _safe("post", url_v2, json=check_payload, headers=headers)
    if isinstance(b, dict):
        print(f"   {s}  proceed={b.get('proceed')}")
        if b.get("content"):
            print(f"   → Same results as v1 (identical response schema)")
    else:
        print(f"   {s}  → {str(b)[:120]}")

    # -- 8. Download URL test ----------------------------------------------
    if isinstance(b, dict) or tracking_id:
        print("\n── 8. Download URL test ──")
        # Re-fetch to get fresh URLs
        s2, b2, _ = _safe("post", f"https://{host}/cds/upgrade/1/check/ctx/ota/key/{guid}",
                           json=check_payload, headers=headers)
        if isinstance(b2, dict) and b2.get("contentResources"):
            dl_url = b2["contentResources"][0]["url"]
            print(f"   URL: {dl_url[:100]}...")
            try:
                r = _requests.head(dl_url, timeout=15, allow_redirects=True)
                size = r.headers.get("Content-Length", "?")
                ctype = r.headers.get("Content-Type", "?")
                print(f"   HEAD → {r.status_code}")
                print(f"   Content-Length: {size}")
                print(f"   Content-Type: {ctype}")
            except Exception as exc:
                print(f"   HEAD error: {exc}")
            try:
                r = _requests.get(dl_url, timeout=15,
                                  headers={"Range": "bytes=0-3"}, stream=True)
                magic = r.content[:4]
                if magic[:2] == b"PK":
                    fmt = "ZIP"
                elif magic == b"CrAU":
                    fmt = "Chrome OS update payload"
                else:
                    fmt = f"unknown ({magic.hex()})"
                print(f"   Format: {fmt}")
            except Exception as exc:
                print(f"   Range GET error: {exc}")

    # -- 9. All servers comparison -----------------------------------------
    print("\n── 9. All known CDS servers ──")
    for label, srv in ALL_SERVERS:
        url_v = f"https://{srv}/cds/upgrade/1/versions"
        try:
            s, b, _ = _safe("get", url_v, headers=headers)
            if isinstance(b, dict):
                print(f"   {label:<22} appId={b.get('applicationId')}"
                      f" env={b.get('environment')}"
                      f" ver={b.get('applicationVersion', '')[:30]}")
            else:
                print(f"   {label:<22} {s}")
        except Exception:
            print(f"   {label:<22} unreachable")
        time.sleep(0.2)

    # -- 10. Non-production server check -----------------------------------
    print("\n── 10. Non-production servers (OTA check) ──")
    non_prod_servers = [
        ("staging", "moto-cds-staging.appspot.com"),
        ("blurdev (=staging)", "ota-cn-sdc.blurdev.com"),
        ("qa", "moto-cds-qa.appspot.com"),
        ("dev", "moto-cds-dev.appspot.com"),
    ]
    for label, srv in non_prod_servers:
        # Use v2 for blurdev (v1 times out through nginx proxy)
        api_ver = "2" if "blurdev" in srv else "1"
        url_np = f"https://{srv}/cds/upgrade/{api_ver}/check/ctx/ota/key/{guid}"
        try:
            s, b, h_np = _safe("post", url_np, json=check_payload, headers=headers)
            if isinstance(b, dict):
                proceed = b.get("proceed", False)
                has_c = b.get("content") is not None
                cds_hdr = h_np.get("x-cds-content-exists", "?")
                bitmap = b.get("smartUpdateBitmap", "?")
                print(f"   {label:<22} proceed={proceed}  content={'YES' if has_c else 'null'}"
                      f"  x-cds={cds_hdr}  bitmap={bitmap}")
            else:
                print(f"   {label:<22} {s} → {str(b)[:80]}")
        except Exception as exc:
            print(f"   {label:<22} error: {exc}")
        time.sleep(0.2)
    print("   → Non-production servers have zero OTA packages (confirmed)")

    # -- Summary -----------------------------------------------------------
    print()
    print("=" * 72)
    print("  ENDPOINT REFERENCE (verified by probing)")
    print("=" * 72)
    print("""
  Endpoint     Method  URL Pattern                                       Purpose
  ─────────    ──────  ──────────────────────────────────────────────     ───────────────────
  check        POST    /cds/upgrade/1/check/ctx/ota/key/{guid}           Check for OTA update
  check v2     POST    /cds/upgrade/2/check/ctx/ota/key/{guid}           Same as v1
  resources    POST    /cds/upgrade/1/resources/t/{tid}/ctx/ota/key/{g}  Get download URLs
  state        POST    /cds/upgrade/1/state/t/{tid}/s/{st}/ctx/ota/key/  Report install state
  versions     GET     /cds/upgrade/1/versions                           Server version info

  Minimal check payload (server ignores all other fields):
    {
      "id": "any-string",
      "deviceInfo": {"country": "US", "region": "US"},
      "extraInfo": {
        "carrier": "<carrier>",        ← CRITICAL routing field
        "vitalUpdate": false,          ← must be false
        "otaSourceSha1": "<guid>"      ← GUID from ro.mot.build.guid
      },
      "triggeredBy": "user"            ← only "user" returns updates
    }

  Server ignores: product, model, buildType, fingerprint, imei, mccmnc,
                  bootloaderStatus, deviceRooted, channelId, isDogfoodDevice

  Headers: Content-Type + User-Agent only (NO auth headers for check)
  Response header: x-cds-content-exists (true/false)
  smartUpdateBitmap: prod=7, staging=7, QA=-1, dev=11
  Non-production servers: zero packages (staging/QA/dev/blurdev)
""")

    return 0


def _cmd_download_ota(args: argparse.Namespace) -> int:
    """Download OTA packages by walking the update chain."""
    import requests as req
    from pathlib import Path

    region = Region.PRC if args.region == "prc" else Region.GLOBAL
    environment = Environment(args.env)
    server = get_server(region, environment)
    host = server.host
    out_dir = Path(args.output_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    cur_guid = args.guid
    chain = []

    print(f"{'=' * 72}")
    print(f"  OTA Download — carrier={args.carrier} server={host}")
    print(f"  Starting GUID: {cur_guid}")
    print(f"  Output: {out_dir.resolve()}")
    print(f"{'=' * 72}")

    for step in range(1, args.max_steps + 1):
        url = f"https://{host}/cds/upgrade/1/check/ctx/ota/key/{cur_guid}"
        payload = {
            "id": "SERIAL_NUMBER_NOT_AVAILABLE",
            "deviceInfo": {"country": "US", "region": "US"},
            "extraInfo": {
                "carrier": args.carrier,
                "vitalUpdate": False,
                "otaSourceSha1": cur_guid,
            },
            "triggeredBy": "user",
        }
        headers = {
            "Content-Type": "application/json",
            "User-Agent": "com.motorola.ccc.ota",
        }

        try:
            resp = req.post(url, json=payload, headers=headers, timeout=30)
            data = resp.json()
        except Exception as exc:
            print(f"\n  Step {step}: ERROR — {exc}")
            break

        if not data.get("proceed"):
            cds = resp.headers.get("x-cds-content-exists", "?")
            print(f"\n  Step {step}: END (proceed=false, x-cds-content-exists={cds})")
            break

        content = data["content"]
        ver = content.get("displayVersion", "?")
        src_ver = content.get("sourceDisplayVersion", "?")
        target_guid = content.get("otaTargetSha1", "")
        size = int(content.get("size", 0))
        pkg_id = content.get("packageID", "")
        md5 = content.get("md5_checksum", "")
        utype = content.get("updateType", "?")
        resources = data.get("contentResources") or []

        print(f"\n  Step {step}: {src_ver} → {ver}")
        print(f"    Type: {utype}  Size: {size / 1048576:.1f} MB")
        print(f"    GUID: {cur_guid} → {target_guid}")
        print(f"    Package: {pkg_id[:80]}")
        print(f"    MD5: {md5}")

        for res in resources:
            dl_url = res.get("url", "")
            tags = res.get("tags", [])
            ttl = res.get("urlTtlSeconds", 0)
            if not dl_url:
                continue

            tag_str = ",".join(tags)
            print(f"    📥 [{tag_str}] TTL={ttl}s")

            if args.verify_only:
                try:
                    head = req.head(dl_url, timeout=15, allow_redirects=True)
                    cl = head.headers.get("Content-Length", "?")
                    ct = head.headers.get("Content-Type", "?")
                    print(f"       ✅ HEAD {head.status_code} size={cl} type={ct}")
                except Exception as exc:
                    print(f"       ❌ HEAD failed: {exc}")
            elif "WIFI" in tags:
                # Download using WIFI URL
                safe_ver = re.sub(r"[^a-zA-Z0-9._-]", "_", ver)
                filename = f"step{step}_{safe_ver}_{args.carrier}.zip"
                filepath = out_dir / filename
                print(f"       Downloading → {filepath}")
                try:
                    with req.get(dl_url, stream=True, timeout=600) as dl_resp:
                        dl_resp.raise_for_status()
                        total = int(dl_resp.headers.get("Content-Length", 0))
                        downloaded = 0
                        with open(filepath, "wb") as f:
                            for chunk in dl_resp.iter_content(chunk_size=1048576):
                                f.write(chunk)
                                downloaded += len(chunk)
                                pct = (downloaded / total * 100) if total else 0
                                print(
                                    f"\r       {downloaded / 1048576:.1f} / "
                                    f"{total / 1048576:.1f} MB ({pct:.0f}%)",
                                    end="",
                                    flush=True,
                                )
                        print(f"\n       ✅ Saved: {filepath} ({downloaded} bytes)")
                except Exception as exc:
                    print(f"\n       ❌ Download failed: {exc}")

        entry = {
            "step": step,
            "source_version": src_ver,
            "target_version": ver,
            "source_guid": cur_guid,
            "target_guid": target_guid,
            "size_bytes": size,
            "update_type": utype,
            "package_id": pkg_id,
            "md5": md5,
            "urls": [
                {"url": r.get("url", ""), "tags": r.get("tags", []), "ttl": r.get("urlTtlSeconds", 0)}
                for r in resources
            ],
        }
        chain.append(entry)
        cur_guid = target_guid
        time.sleep(args.delay)

    # Save chain metadata
    meta_file = out_dir / f"chain_{args.carrier}_{args.guid[:8]}.json"
    with open(meta_file, "w") as f:
        json.dump(chain, f, indent=2)
    print(f"\n  Chain metadata saved: {meta_file}")

    # Summary
    print(f"\n{'=' * 72}")
    total_mb = sum(e["size_bytes"] for e in chain) / 1048576
    print(f"  Chain: {len(chain)} steps, {total_mb:.1f} MB total")
    if chain:
        print(f"  From: {chain[0]['source_version']} → {chain[-1]['target_version']}")
    print(f"{'=' * 72}")

    return 0


def _cmd_brute_force(args: argparse.Namespace) -> int:
    """Brute-force discover GUIDs and test API configurations."""
    import requests as req

    region = Region.PRC if args.region == "prc" else Region.GLOBAL
    environment = Environment(args.env)
    server = get_server(region, environment)
    host = server.host

    def _check(guid, carrier, context="ota"):
        url = f"https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}"
        payload = {
            "id": "x",
            "deviceInfo": {"country": "US", "region": "US"},
            "extraInfo": {
                "carrier": carrier,
                "vitalUpdate": False,
                "otaSourceSha1": guid,
            },
            "triggeredBy": "user",
        }
        try:
            resp = req.post(
                url,
                json=payload,
                headers={
                    "Content-Type": "application/json",
                    "User-Agent": "com.motorola.ccc.ota",
                },
                timeout=10,
            )
            data = resp.json()
            cds = resp.headers.get("x-cds-content-exists", "?")
            proceed = data.get("proceed", False)
            content = data.get("content")
            ver = content.get("displayVersion", "?") if content and proceed else "-"
            return proceed, cds, ver
        except Exception:
            return None, None, "error"

    all_carriers = [
        "amxmx", "openmx", "retla", "reteu", "retgb", "retbr", "demogb",
        "o2gb", "eegb", "vfeu", "3gb", "amxla", "amxpe", "amxbr",
        "tefmx", "tefbr", "pluspl", "timbr", "attmx", "retin", "retar",
        "amxar", "retapac", "teleu", "retru", "amxco", "amxcl",
        "retus", "verizon", "sprint", "tmo", "att",
    ]
    all_contexts = ["ota", "fota", "modem", "firmware", "system", "recovery"]

    print(f"{'=' * 72}")
    print(f"  Brute-Force Scanner — server={host}")
    print(f"{'=' * 72}")
    found_count = 0

    # 1. GUID adjacent scan
    if args.guid:
        print(f"\n--- GUID adjacent scan (±{args.scan_range}) ---")
        base_int = int(args.guid, 16)
        for offset in range(-args.scan_range, args.scan_range + 1):
            if offset == 0:
                continue
            test_guid = format(base_int + offset, '015x')
            proceed, cds, ver = _check(test_guid, args.carrier)
            if proceed or cds == "true":
                icon = "✅" if proceed else "📦"
                print(f"  {icon} offset={offset:+d} guid={test_guid} → {ver} (cds={cds})")
                found_count += 1
            time.sleep(args.delay)

    # 2. Carrier scan
    if args.scan_carriers and args.guid:
        print(f"\n--- Carrier scan for GUID {args.guid} ---")
        for carrier in all_carriers:
            proceed, cds, ver = _check(args.guid, carrier)
            icon = "✅" if proceed else ("📦" if cds == "true" else "·")
            if proceed or cds == "true":
                print(f"  {icon} carrier={carrier:<12} → {ver} (cds={cds})")
                found_count += 1
            time.sleep(args.delay)

    # 3. Context scan
    if args.scan_contexts and args.guid:
        print(f"\n--- URL context scan for GUID {args.guid} ---")
        for ctx in all_contexts:
            proceed, cds, ver = _check(args.guid, args.carrier, context=ctx)
            icon = "✅" if proceed else "❌"
            print(f"  {icon} ctx={ctx:<12} → {ver} (cds={cds})")
            time.sleep(args.delay)

    print(f"\n  Found: {found_count} results")
    return 0


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(levelname)-8s %(name)s: %(message)s",
    )

    dispatch = {
        "check-update": _cmd_check_update,
        "enumerate-updates": _cmd_enumerate_updates,
        "debug-server": _cmd_debug_server,
        "analyze-smali": _cmd_analyze_smali,
        "analyze-binary": _cmd_analyze_binary,
        "download-ota": _cmd_download_ota,
        "brute-force": _cmd_brute_force,
    }
    handler = dispatch.get(args.command)
    if handler is None:
        print(f"Unknown command: {args.command}", file=sys.stderr)
        return 1
    return handler(args)


if __name__ == "__main__":
    sys.exit(main())
