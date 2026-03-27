"""App-level configuration: server, headers, timeouts, region.

Stored at ``~/.config/moto-ota/app.json``.  Every field has a sensible
default so the file is optional.
"""

from __future__ import annotations

from dataclasses import asdict, dataclass, field
from typing import Any

from moto_ota.config.servers import DEFAULT_SERVER, ServerEnv

# Only two real regions exist: Global and China
VALID_REGIONS: list[str] = ["Global", "China"]

# Servers available per region
REGION_SERVERS: dict[str, list[str]] = {
    "Global": [
        ServerEnv.PRODUCTION_GLOBAL.value,
        ServerEnv.STAGING.value,
        ServerEnv.QA.value,
        ServerEnv.DEV.value,
    ],
    "China": [
        ServerEnv.PRODUCTION_PRC.value,
        ServerEnv.BLURDEV.value,
    ],
}


@dataclass
class AppConfig:
    """Application-level settings persisted to ``app.json``."""

    # ── server ───────────────────────────────────────────────────────
    server: str = DEFAULT_SERVER.value
    """CDS server environment (e.g. ``production-prc``)."""

    region: str = "Global"
    """Region — ``Global`` or ``China``.  Determines available servers."""

    # ── HTTP ─────────────────────────────────────────────────────────
    user_agent: str = "com.motorola.ccc.ota"
    """HTTP ``User-Agent`` header sent with every request."""

    content_type: str = "application/json; charset=utf-8"
    """HTTP ``Content-Type`` header."""

    accept_encoding: str = "gzip"
    """HTTP ``Accept-Encoding`` header."""

    connection: str = "Keep-Alive"
    """HTTP ``Connection`` header."""

    # ── behaviour ────────────────────────────────────────────────────
    timeout: int = 30
    """Request timeout in seconds."""

    max_retries: int = 3
    """Maximum retry attempts on connection errors."""

    download_chunk_size: int = 1048576
    """Download chunk size in bytes (default 1 MB)."""

    verify_md5: bool = True
    """Verify MD5 checksums after downloading OTA files."""

    # ── helpers ──────────────────────────────────────────────────────

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> AppConfig:
        known = {f.name for f in cls.__dataclass_fields__.values()}
        return cls(**{k: v for k, v in data.items() if k in known})

    @property
    def server_env(self) -> ServerEnv:
        try:
            return ServerEnv(self.server)
        except ValueError:
            return ServerEnv(DEFAULT_SERVER.value)

    @property
    def headers(self) -> dict[str, str]:
        """Build HTTP headers dict from config."""
        return {
            "Content-Type": self.content_type,
            "User-Agent": self.user_agent,
            "Accept-Encoding": self.accept_encoding,
            "Connection": self.connection,
        }


# ── field metadata for the TUI config menu ───────────────────────────

APP_CONFIG_FIELDS: list[dict[str, Any]] = [
    {
        "key": "region",
        "label": "Region",
        "description": "Region — determines which servers are available",
        "type": "choice",
        "choices": VALID_REGIONS,
    },
    {
        "key": "server",
        "label": "Server",
        "description": "CDS server environment (filtered by region)",
        "type": "choice",
        "choices": [e.value for e in ServerEnv],
    },
    {
        "key": "user_agent",
        "label": "User-Agent",
        "description": "HTTP User-Agent header sent with requests",
        "type": "text",
    },
    {
        "key": "content_type",
        "label": "Content-Type",
        "description": "HTTP Content-Type header",
        "type": "text",
    },
    {
        "key": "accept_encoding",
        "label": "Accept-Encoding",
        "description": "HTTP Accept-Encoding header",
        "type": "text",
    },
    {
        "key": "connection",
        "label": "Connection",
        "description": "HTTP Connection header (Keep-Alive / close)",
        "type": "choice",
        "choices": ["Keep-Alive", "close"],
    },
    {
        "key": "timeout",
        "label": "Timeout",
        "description": "Request timeout in seconds",
        "type": "int",
        "min": 5,
        "max": 300,
    },
    {
        "key": "max_retries",
        "label": "Max Retries",
        "description": "Maximum retry attempts on connection errors",
        "type": "int",
        "min": 0,
        "max": 10,
    },
    {
        "key": "download_chunk_size",
        "label": "Download Chunk Size",
        "description": "Download chunk size in bytes (default 1 MB)",
        "type": "int",
        "min": 65536,
        "max": 10485760,
    },
    {
        "key": "verify_md5",
        "label": "Verify MD5",
        "description": "Verify MD5 checksums after downloading OTA files",
        "type": "bool",
    },
]
