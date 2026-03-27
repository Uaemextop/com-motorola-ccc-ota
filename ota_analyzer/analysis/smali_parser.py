"""Smali bytecode parser for extracting OTA-relevant information.

Provides utilities to read decompiled smali files and extract:
  - Constant strings (URLs, keys, field names)
  - Method signatures
  - Class hierarchy information
"""

from __future__ import annotations

import os
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterator


@dataclass
class SmaliString:
    """A constant string found in a smali file."""
    value: str
    file: str
    line_number: int
    register: str


@dataclass
class SmaliMethod:
    """A method declaration found in a smali file."""
    name: str
    access_flags: str
    parameters: str
    return_type: str
    file: str
    line_number: int


class SmaliParser:
    """Parse smali bytecode files to extract OTA-relevant data.

    Usage::

        parser = SmaliParser("/path/to/smali_classes2")
        urls = parser.find_strings(pattern=r"https?://")
        methods = parser.find_methods("checkUpdate")
    """

    _RE_CONST_STRING = re.compile(
        r'const-string(?:/jumbo)?\s+(v\d+|p\d+),\s+"(.+?)"'
    )
    _RE_METHOD = re.compile(
        r"\.method\s+(.*?)\s+(\S+)\((.*?)\)(.*)"
    )
    _RE_CLASS = re.compile(r"\.class\s+.*\s+(L\S+;)")
    _RE_SUPER = re.compile(r"\.super\s+(L\S+;)")

    def __init__(self, smali_root: str | Path) -> None:
        self._root = Path(smali_root)

    # -- public API --------------------------------------------------------

    def find_strings(
        self,
        pattern: str = ".*",
        *,
        path_filter: str = "",
    ) -> list[SmaliString]:
        """Search for constant strings matching *pattern* across smali files.

        Args:
            pattern: Regex applied to the string value.
            path_filter: Only consider files whose path contains this substring.
        """
        regex = re.compile(pattern, re.IGNORECASE)
        results: list[SmaliString] = []
        for smali_file, lineno, register, value in self._iter_const_strings():
            if path_filter and path_filter not in str(smali_file):
                continue
            if regex.search(value):
                results.append(
                    SmaliString(
                        value=value,
                        file=str(smali_file),
                        line_number=lineno,
                        register=register,
                    )
                )
        return results

    def find_methods(
        self,
        name_pattern: str = ".*",
        *,
        path_filter: str = "",
    ) -> list[SmaliMethod]:
        """Search for method declarations matching *name_pattern*."""
        regex = re.compile(name_pattern, re.IGNORECASE)
        results: list[SmaliMethod] = []
        for smali_file in self._iter_smali_files(path_filter):
            for lineno, line in self._lines(smali_file):
                match = self._RE_METHOD.match(line)
                if match and regex.search(match.group(2)):
                    results.append(
                        SmaliMethod(
                            access_flags=match.group(1),
                            name=match.group(2),
                            parameters=match.group(3),
                            return_type=match.group(4),
                            file=str(smali_file),
                            line_number=lineno,
                        )
                    )
        return results

    def extract_class_hierarchy(
        self, path_filter: str = ""
    ) -> dict[str, str]:
        """Map each class to its super class within the filtered scope."""
        hierarchy: dict[str, str] = {}
        for smali_file in self._iter_smali_files(path_filter):
            cls_name = super_name = None
            for _, line in self._lines(smali_file):
                cm = self._RE_CLASS.match(line)
                if cm:
                    cls_name = cm.group(1)
                sm = self._RE_SUPER.match(line)
                if sm:
                    super_name = sm.group(1)
                if cls_name and super_name:
                    hierarchy[cls_name] = super_name
                    break
        return hierarchy

    # -- internal helpers --------------------------------------------------

    def _iter_smali_files(
        self, path_filter: str = ""
    ) -> Iterator[Path]:
        for dirpath, _, filenames in os.walk(self._root):
            for fn in filenames:
                if fn.endswith(".smali"):
                    full = Path(dirpath) / fn
                    if not path_filter or path_filter in str(full):
                        yield full

    def _lines(self, path: Path) -> Iterator[tuple[int, str]]:
        try:
            with open(path, encoding="utf-8", errors="replace") as fh:
                for lineno, line in enumerate(fh, start=1):
                    yield lineno, line.rstrip()
        except OSError:
            pass

    def _iter_const_strings(
        self,
    ) -> Iterator[tuple[Path, int, str, str]]:
        for smali_file in self._iter_smali_files():
            for lineno, line in self._lines(smali_file):
                m = self._RE_CONST_STRING.search(line)
                if m:
                    yield smali_file, lineno, m.group(1), m.group(2)
