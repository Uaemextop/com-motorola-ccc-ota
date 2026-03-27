"""Download OTA files with :mod:`rich` progress bars.

Files are saved to a user-chosen directory.  Each download shows a
live progress bar with speed and ETA.  When *console* is provided the
progress display stays inside the penumbra full-screen alternate buffer.
"""

from __future__ import annotations

import hashlib
import re
from pathlib import Path
from typing import Optional

import requests
from rich.console import Console
from rich.progress import (
    BarColumn,
    DownloadColumn,
    Progress,
    TaskID,
    TextColumn,
    TimeRemainingColumn,
    TransferSpeedColumn,
)

from moto_ota.models.response import CheckResponse


def _safe_filename(version: str, carrier: str, step: int) -> str:
    """Build a filesystem-safe filename from version info."""
    safe = re.sub(r"[^a-zA-Z0-9._-]", "_", version)
    return f"step{step:02d}_{safe}_{carrier}.zip"


def download_ota(
    url: str,
    dest: Path,
    *,
    expected_md5: str = "",
    progress: Optional[Progress] = None,
    task_id: Optional[TaskID] = None,
    chunk_size: int = 1024 * 1024,
) -> Path:
    """Download a single OTA file with optional progress tracking.

    Parameters
    ----------
    url:
        Direct download URL (from ``contentResources``).
    dest:
        Destination file path.
    expected_md5:
        If provided, the download is verified against this checksum.
    progress / task_id:
        A :class:`rich.progress.Progress` instance and task for live
        updates.  If *None*, download runs silently.

    Returns
    -------
    Path
        The saved file path.

    Raises
    ------
    ValueError
        If MD5 verification fails.
    """
    dest.parent.mkdir(parents=True, exist_ok=True)
    md5 = hashlib.md5()

    with requests.get(url, stream=True, timeout=600) as resp:
        resp.raise_for_status()
        total = int(resp.headers.get("Content-Length", 0))
        if progress and task_id is not None:
            progress.update(task_id, total=total)

        with open(dest, "wb") as fh:
            for chunk in resp.iter_content(chunk_size=chunk_size):
                fh.write(chunk)
                md5.update(chunk)
                if progress and task_id is not None:
                    progress.advance(task_id, len(chunk))

    if expected_md5 and md5.hexdigest() != expected_md5:
        raise ValueError(
            f"MD5 mismatch: expected {expected_md5}, got {md5.hexdigest()}"
        )

    return dest


def make_progress(console: Optional[Console] = None) -> Progress:
    """Create a :class:`rich.progress.Progress` bar for downloads.

    Parameters
    ----------
    console:
        If provided, the progress bar renders on this console so it
        stays inside the penumbra full-screen alternate buffer.
    """
    return Progress(
        TextColumn("[bold bright_cyan]{task.description}"),
        BarColumn(bar_width=40),
        DownloadColumn(),
        TransferSpeedColumn(),
        TimeRemainingColumn(),
        console=console,
    )


def download_chain(
    chain: list[CheckResponse],
    carrier: str,
    output_dir: Path,
    *,
    verify: bool = True,
    console: Optional[Console] = None,
) -> list[Path]:
    """Download every OTA file in a chain with progress bars.

    Parameters
    ----------
    console:
        If provided the progress display renders on this console,
        keeping everything in the TUI alternate screen buffer.

    Returns the list of saved file paths.
    """
    saved: list[Path] = []
    with make_progress(console) as progress:
        for idx, resp in enumerate(chain, 1):
            urls = resp.download_urls
            if not urls:
                continue
            url = urls[0]  # prefer first (usually WIFI)
            filename = _safe_filename(resp.target_version, carrier, idx)
            dest = output_dir / filename
            task = progress.add_task(
                f"[{idx}/{len(chain)}] {resp.target_version}",
                total=resp.size_bytes or None,
            )
            md5 = resp.md5 if verify else ""
            download_ota(url, dest, expected_md5=md5, progress=progress, task_id=task)
            saved.append(dest)

    return saved
