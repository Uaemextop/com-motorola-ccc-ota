"""Native library analyzer using the Capstone disassembly engine.

Capstone is used to disassemble ARM/ARM64 shared libraries (.so) that may
be bundled with the APK.  This module looks for cryptographic routines,
authentication logic, and hardcoded strings inside native code.
"""

from __future__ import annotations

import struct
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator, Optional

try:
    import capstone
except ImportError:
    capstone = None  # type: ignore[assignment]


@dataclass
class DisassemblyResult:
    """A single disassembled instruction."""
    address: int
    mnemonic: str
    operands: str
    size: int


@dataclass
class StringRef:
    """A readable string found in a binary section."""
    offset: int
    value: str


class BinaryAnalyzer:
    """Disassemble and inspect ELF shared objects (.so) with Capstone.

    Supports ARM (32-bit) and ARM64 (AArch64) architectures, which are the
    most common for Android native libraries.

    Usage::

        analyzer = BinaryAnalyzer("/path/to/libnative.so")
        for instr in analyzer.disassemble(offset=0x1000, size=256):
            print(f"0x{instr.address:x}  {instr.mnemonic}  {instr.operands}")
    """

    _ARCH_MAP = {
        "arm": (capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM) if capstone else (0, 0),
        "arm64": (capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM) if capstone else (0, 0),
        "x86": (capstone.CS_ARCH_X86, capstone.CS_MODE_32) if capstone else (0, 0),
        "x86_64": (capstone.CS_ARCH_X86, capstone.CS_MODE_64) if capstone else (0, 0),
    }

    def __init__(self, path: str | Path, arch: str = "arm64") -> None:
        if capstone is None:
            raise RuntimeError(
                "capstone is not installed. Run: pip install capstone"
            )
        self._path = Path(path)
        self._data = self._path.read_bytes()

        arch_id, mode = self._ARCH_MAP.get(arch, self._ARCH_MAP["arm64"])
        self._cs = capstone.Cs(arch_id, mode)
        self._cs.detail = True

    # -- public API --------------------------------------------------------

    def disassemble(
        self,
        offset: int = 0,
        size: Optional[int] = None,
        base_address: int = 0,
    ) -> list[DisassemblyResult]:
        """Disassemble *size* bytes starting at *offset*.

        If *size* is ``None`` the entire file is disassembled (can be slow
        for large binaries).
        """
        end = offset + size if size else len(self._data)
        code = self._data[offset:end]
        results: list[DisassemblyResult] = []
        for insn in self._cs.disasm(code, base_address + offset):
            results.append(
                DisassemblyResult(
                    address=insn.address,
                    mnemonic=insn.mnemonic,
                    operands=insn.op_str,
                    size=insn.size,
                )
            )
        return results

    def extract_strings(self, min_length: int = 4) -> list[StringRef]:
        """Extract printable ASCII strings from the binary.

        This is the equivalent of the Unix ``strings`` command and is useful
        for locating hardcoded URLs, keys, or tokens inside .so files.
        """
        results: list[StringRef] = []
        current: list[int] = []
        start = 0
        for i, byte in enumerate(self._data):
            if 0x20 <= byte < 0x7F:
                if not current:
                    start = i
                current.append(byte)
            else:
                if len(current) >= min_length:
                    results.append(
                        StringRef(
                            offset=start,
                            value=bytes(current).decode("ascii"),
                        )
                    )
                current = []
        if len(current) >= min_length:
            results.append(
                StringRef(offset=start, value=bytes(current).decode("ascii"))
            )
        return results

    def find_auth_patterns(self) -> list[StringRef]:
        """Search for authentication-related strings in the binary.

        Looks for common patterns such as API keys, tokens, URLs, and
        cryptographic constants.
        """
        auth_keywords = (
            "auth", "token", "key", "secret", "sign",
            "certificate", "Bearer", "http", "https",
            "password", "credential", "X-Moto",
        )
        all_strings = self.extract_strings(min_length=6)
        return [
            s for s in all_strings
            if any(kw.lower() in s.value.lower() for kw in auth_keywords)
        ]

    @property
    def file_size(self) -> int:
        return len(self._data)
