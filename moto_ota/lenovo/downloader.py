"""Download firmware files from ``rsddownload-secure.lenovo.com``.

Uses the same progress bar infrastructure as the existing
:mod:`moto_ota.core.downloader` but adapted for the Lenovo S3 URLs.
"""

from __future__ import annotations

import hashlib
import logging
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

from moto_ota.lenovo.config import LSA_HEADERS
from moto_ota.lenovo.models import FileResource

logger = logging.getLogger(__name__)


def _safe_filename(name: str) -> str:
    """Sanitise a filename for the filesystem."""
    return re.sub(r"[^a-zA-Z0-9._-]", "_", name)


def download_firmware(
    resource: FileResource,
    dest_dir: Path,
    *,
    progress: Optional[Progress] = None,
    task_id: Optional[TaskID] = None,
    chunk_size: int = 1024 * 1024,
) -> Path:
    """Download a single firmware file from rsddownload-secure.lenovo.com.

    Parameters
    ----------
    resource:
        The :class:`FileResource` containing the download URL.
    dest_dir:
        Directory to save the file.
    progress / task_id:
        Optional rich Progress for live display.
    chunk_size:
        Download chunk size (default 1 MB).

    Returns
    -------
    Path
        Path to the downloaded file.
    """
    if not resource.uri:
        raise ValueError("Resource has no download URI")

    dest_dir.mkdir(parents=True, exist_ok=True)
    filename = _safe_filename(resource.name or "firmware.zip")
    dest = dest_dir / filename

    headers = {
        "User-Agent": LSA_HEADERS["User-Agent"],
        "Request-Tag": "lmsa",
        "Cache-Control": "no-store,no-cache",
        "Pragma": "no-cache",
    }

    logger.info("Downloading %s...", filename)
    md5 = hashlib.md5()

    with requests.get(
        resource.uri, stream=True, timeout=600, headers=headers
    ) as resp:
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

    # Verify MD5 if provided
    if resource.md5 and md5.hexdigest() != resource.md5:
        raise ValueError(
            f"MD5 mismatch for {filename}: "
            f"expected {resource.md5}, got {md5.hexdigest()}"
        )

    logger.info("Saved %s (%d bytes)", dest, dest.stat().st_size)
    return dest


def make_lenovo_progress(console: Optional[Console] = None) -> Progress:
    """Create a rich Progress bar for Lenovo firmware downloads."""
    return Progress(
        TextColumn("[bold bright_green]{task.description}"),
        BarColumn(bar_width=40),
        DownloadColumn(),
        TransferSpeedColumn(),
        TimeRemainingColumn(),
        console=console,
    )


def download_all_resources(
    resources: list[FileResource],
    dest_dir: Path,
    *,
    console: Optional[Console] = None,
) -> list[Path]:
    """Download all firmware resources with progress bars.

    Parameters
    ----------
    resources:
        List of :class:`FileResource` to download.
    dest_dir:
        Destination directory.
    console:
        Optional :class:`rich.console.Console` for rendering.

    Returns
    -------
    list[Path]
        Paths to all downloaded files.
    """
    saved: list[Path] = []

    with make_lenovo_progress(console) as progress:
        for idx, res in enumerate(resources, 1):
            if not res.uri:
                continue
            task = progress.add_task(
                f"[{idx}/{len(resources)}] {res.name or 'firmware'}",
                total=None,
            )
            path = download_firmware(
                res, dest_dir, progress=progress, task_id=task
            )
            saved.append(path)

    return saved
