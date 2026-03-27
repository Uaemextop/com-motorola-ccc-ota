#!/usr/bin/env python3
"""
capstone_disassemble.py — Disassemble native .so libraries using Capstone.

Scans a directory tree for ELF shared objects (.so files), detects the
target architecture, and disassembles the .text section with Capstone.

Usage:
    python3 capstone_disassemble.py [directory] [--max-instructions N] [--output FILE]

If no directory is given the current working directory is used.
"""

import argparse
import os
import struct
import sys
from pathlib import Path

try:
    import capstone
except ImportError:
    sys.exit(
        "Error: capstone is not installed.\n"
        "Install it with: pip install capstone"
    )

# ── ELF constants ────────────────────────────────────────────────────────────

ELF_MAGIC = b"\x7fELF"
SHT_PROGBITS = 1

# e_machine values → (CS_ARCH, CS_MODE) mapping
ELF_MACHINE_MAP = {
    0x03: (capstone.CS_ARCH_X86, capstone.CS_MODE_32),       # EM_386
    0x3E: (capstone.CS_ARCH_X86, capstone.CS_MODE_64),       # EM_X86_64
    0x28: (capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM),      # EM_ARM
    0xB7: (capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM),    # EM_AARCH64
    0x08: (capstone.CS_ARCH_MIPS, capstone.CS_MODE_MIPS32),  # EM_MIPS
}

# Architecture friendly names
ARCH_NAMES = {
    capstone.CS_ARCH_ARM:   "ARM",
    capstone.CS_ARCH_ARM64: "ARM64 (AArch64)",
    capstone.CS_ARCH_X86:   "x86",
    capstone.CS_ARCH_MIPS:  "MIPS",
    capstone.CS_ARCH_PPC:   "PowerPC",
    capstone.CS_ARCH_SPARC: "SPARC",
    capstone.CS_ARCH_SYSZ:  "SystemZ",
    capstone.CS_ARCH_XCORE: "XCore",
}

MODE_NAMES = {
    capstone.CS_MODE_32:     "32-bit",
    capstone.CS_MODE_64:     "64-bit",
    capstone.CS_MODE_ARM:    "ARM",
    capstone.CS_MODE_THUMB:  "Thumb",
    capstone.CS_MODE_MIPS32: "MIPS32",
    capstone.CS_MODE_MIPS64: "MIPS64",
}


# ── ELF parsing helpers ─────────────────────────────────────────────────────

def _parse_elf_header(data: bytes):
    """Parse ELF header and return a dict with arch/mode/section info, or None."""
    if data[:4] != ELF_MAGIC:
        return None

    ei_class = data[4]   # 1 = 32-bit, 2 = 64-bit
    ei_data  = data[5]   # 1 = LE, 2 = BE

    endian = "<" if ei_data == 1 else ">"
    cs_endian = capstone.CS_MODE_LITTLE_ENDIAN if ei_data == 1 else capstone.CS_MODE_BIG_ENDIAN

    if ei_class == 1:  # 32-bit
        e_machine = struct.unpack_from(endian + "H", data, 18)[0]
        e_entry   = struct.unpack_from(endian + "I", data, 24)[0]
        e_shoff   = struct.unpack_from(endian + "I", data, 32)[0]
        e_shentsize = struct.unpack_from(endian + "H", data, 46)[0]
        e_shnum     = struct.unpack_from(endian + "H", data, 48)[0]
        e_shstrndx  = struct.unpack_from(endian + "H", data, 50)[0]
    elif ei_class == 2:  # 64-bit
        e_machine = struct.unpack_from(endian + "H", data, 18)[0]
        e_entry   = struct.unpack_from(endian + "Q", data, 24)[0]
        e_shoff   = struct.unpack_from(endian + "Q", data, 40)[0]
        e_shentsize = struct.unpack_from(endian + "H", data, 58)[0]
        e_shnum     = struct.unpack_from(endian + "H", data, 60)[0]
        e_shstrndx  = struct.unpack_from(endian + "H", data, 62)[0]
    else:
        return None

    if e_machine not in ELF_MACHINE_MAP:
        return None

    cs_arch, cs_mode = ELF_MACHINE_MAP[e_machine]
    cs_mode |= cs_endian

    return {
        "arch": cs_arch,
        "mode": cs_mode,
        "endian": endian,
        "ei_class": ei_class,
        "entry": e_entry,
        "e_machine": e_machine,
        "e_shoff": e_shoff,
        "e_shentsize": e_shentsize,
        "e_shnum": e_shnum,
        "e_shstrndx": e_shstrndx,
    }


def _find_text_section(data: bytes, hdr: dict):
    """Return (offset, size, vaddr) of .text section, or (0, len(data), 0) if not found."""
    ei_class = hdr["ei_class"]
    endian   = hdr["endian"]
    shoff    = hdr["e_shoff"]
    shentsz  = hdr["e_shentsize"]
    shnum    = hdr["e_shnum"]
    shstrndx = hdr["e_shstrndx"]

    if shoff == 0 or shnum == 0:
        return 0, len(data), 0

    # Read section header string table offset
    if ei_class == 1:
        strtab_off = struct.unpack_from(endian + "I", data, shoff + shstrndx * shentsz + 16)[0]
    else:
        strtab_off = struct.unpack_from(endian + "Q", data, shoff + shstrndx * shentsz + 24)[0]

    for i in range(shnum):
        base = shoff + i * shentsz
        sh_name_idx = struct.unpack_from(endian + "I", data, base)[0]
        sh_type     = struct.unpack_from(endian + "I", data, base + 4)[0]

        if sh_type != SHT_PROGBITS:
            continue

        # Read section name
        name_start = strtab_off + sh_name_idx
        name_end = data.index(b"\x00", name_start)
        name = data[name_start:name_end].decode("ascii", errors="replace")

        if name == ".text":
            if ei_class == 1:
                sh_addr   = struct.unpack_from(endian + "I", data, base + 12)[0]
                sh_offset = struct.unpack_from(endian + "I", data, base + 16)[0]
                sh_size   = struct.unpack_from(endian + "I", data, base + 20)[0]
            else:
                sh_addr   = struct.unpack_from(endian + "Q", data, base + 16)[0]
                sh_offset = struct.unpack_from(endian + "Q", data, base + 24)[0]
                sh_size   = struct.unpack_from(endian + "Q", data, base + 32)[0]
            return sh_offset, sh_size, sh_addr

    # Fallback: disassemble from entry point
    return 0, len(data), 0


# ── Disassembly ──────────────────────────────────────────────────────────────

def disassemble_so(filepath: str, max_instructions: int = 200):
    """Disassemble a .so file and return a result dict."""
    path = Path(filepath)
    data = path.read_bytes()

    result = {
        "file": str(path),
        "size": len(data),
        "is_elf": False,
        "architecture": None,
        "mode": None,
        "instructions": [],
        "error": None,
    }

    hdr = _parse_elf_header(data)
    if hdr is None:
        result["error"] = "Not a valid ELF file or unsupported architecture"
        return result

    result["is_elf"] = True
    result["architecture"] = ARCH_NAMES.get(hdr["arch"], f"unknown({hdr['e_machine']:#x})")
    result["mode"] = MODE_NAMES.get(hdr["mode"] & ~capstone.CS_MODE_BIG_ENDIAN & ~capstone.CS_MODE_LITTLE_ENDIAN, "default")
    result["entry_point"] = hdr["entry"]

    text_off, text_size, text_vaddr = _find_text_section(data, hdr)
    code = data[text_off:text_off + text_size]

    result["text_section"] = {
        "offset": text_off,
        "size": text_size,
        "virtual_address": text_vaddr,
    }

    md = capstone.Cs(hdr["arch"], hdr["mode"])
    md.detail = True
    md.skipdata = True

    count = 0
    for insn in md.disasm(code, text_vaddr if text_vaddr else hdr["entry"]):
        result["instructions"].append({
            "address": f"0x{insn.address:x}",
            "mnemonic": insn.mnemonic,
            "op_str": insn.op_str,
            "bytes": insn.bytes.hex(),
            "size": insn.size,
        })
        count += 1
        if max_instructions and count >= max_instructions:
            break

    result["total_disassembled"] = count
    return result


def scan_directory(directory: str):
    """Find all .so files in a directory tree."""
    so_files = []
    for root, _, files in os.walk(directory):
        for f in files:
            if f.endswith(".so"):
                so_files.append(os.path.join(root, f))
    return sorted(so_files)


def format_result(result: dict) -> str:
    """Format a disassembly result as human-readable text."""
    lines = []
    lines.append(f"\n{'='*80}")
    lines.append(f"File: {result['file']}")
    lines.append(f"Size: {result['size']:,} bytes")
    lines.append(f"Is ELF: {result['is_elf']}")

    if result["error"]:
        lines.append(f"Error: {result['error']}")
        return "\n".join(lines)

    lines.append(f"Architecture: {result['architecture']}")
    lines.append(f"Mode: {result['mode']}")
    lines.append(f"Entry Point: 0x{result.get('entry_point', 0):x}")

    if "text_section" in result:
        ts = result["text_section"]
        lines.append(f".text Section: offset=0x{ts['offset']:x}, "
                      f"size={ts['size']:,} bytes, vaddr=0x{ts['virtual_address']:x}")

    lines.append(f"Instructions disassembled: {result['total_disassembled']}")
    lines.append("-" * 80)

    for insn in result["instructions"]:
        lines.append(f"  {insn['address']:>12s}:  {insn['bytes']:<24s}  {insn['mnemonic']:<10s} {insn['op_str']}")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Disassemble .so (ELF shared object) files using Capstone"
    )
    parser.add_argument(
        "directory",
        nargs="?",
        default=".",
        help="Directory to scan for .so files (default: current directory)",
    )
    parser.add_argument(
        "--max-instructions", "-n",
        type=int,
        default=200,
        help="Maximum instructions to disassemble per file (default: 200, 0=unlimited)",
    )
    parser.add_argument(
        "--output", "-o",
        type=str,
        default=None,
        help="Write output to file instead of stdout",
    )
    args = parser.parse_args()

    print(f"Capstone version: {capstone.cs_version()}")
    print(f"Scanning directory: {os.path.abspath(args.directory)}")

    so_files = scan_directory(args.directory)

    if not so_files:
        msg = (
            f"\nNo .so files found in '{os.path.abspath(args.directory)}'.\n\n"
            "This is expected for a decompiled APK that uses only Java/Kotlin code\n"
            "with no native (C/C++) components. The MotoOta.apk application is a\n"
            "pure Java/Kotlin application — it does not include native libraries.\n\n"
            "To use this script with .so files from another APK:\n"
            "  1. Extract the APK:  unzip MyApp.apk -d extracted/\n"
            "  2. Run this script:  python3 capstone_disassemble.py extracted/lib/\n"
        )
        print(msg)
        if args.output:
            Path(args.output).write_text(msg)
        return

    print(f"Found {len(so_files)} .so file(s):\n")
    for f in so_files:
        print(f"  • {f}")

    output_lines = []
    for so_path in so_files:
        result = disassemble_so(so_path, max_instructions=args.max_instructions or 0)
        formatted = format_result(result)
        print(formatted)
        output_lines.append(formatted)

    if args.output:
        Path(args.output).write_text("\n".join(output_lines))
        print(f"\nOutput written to {args.output}")


if __name__ == "__main__":
    main()
