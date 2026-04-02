"""Parse CDS server responses.

A successful response looks like::

    {
      "proceed": true,
      "context": "ota",
      "contextKey": "<target GUID>",
      "content": { ... update metadata ... },
      "contentResources": [ { "url": "...", "tags": [...], ... } ],
      "trackingId": "...",
      ...
    }

When no update is available: ``proceed=false``, ``content=null``.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Optional


@dataclass
class CheckResponse:
    """Parsed OTA check response from the CDS server."""

    proceed: bool = False
    context: str = ""
    context_key: str = ""
    tracking_id: str = ""
    content_timestamp: int = 0
    poll_after_seconds: int = 0
    smart_update_bitmap: int = -1
    upload_failure_logs: bool = False

    # Update metadata (``None`` when no update)
    content: Optional[dict[str, Any]] = None
    content_resources: Optional[list[dict[str, Any]]] = None

    # HTTP header (not in JSON body)
    x_cds_content_exists: Optional[bool] = None

    # Keep the full server response for debugging
    raw: Optional[dict[str, Any]] = field(default=None, repr=False)

    # ── factories ────────────────────────────────────────────────────

    @classmethod
    def from_dict(
        cls,
        data: dict[str, Any],
        headers: Optional[dict[str, str]] = None,
    ) -> CheckResponse:
        """Build from the JSON (+ optional HTTP headers)."""
        payload = data.get("payload", data)

        x_cds: Optional[bool] = None
        if headers:
            raw_val = headers.get("x-cds-content-exists")
            if raw_val is not None:
                x_cds = raw_val.lower() == "true"

        return cls(
            proceed=payload.get("proceed", False),
            context=payload.get("context", ""),
            context_key=payload.get("contextKey", ""),
            tracking_id=payload.get("trackingId", ""),
            content_timestamp=payload.get("contentTimestamp", 0),
            poll_after_seconds=payload.get("pollAfterSeconds", 0),
            smart_update_bitmap=payload.get("smartUpdateBitmap", -1),
            upload_failure_logs=payload.get("uploadFailureLogs", False),
            content=payload.get("content"),
            content_resources=payload.get("contentResources"),
            x_cds_content_exists=x_cds,
            raw=data,
        )

    # ── convenience properties ───────────────────────────────────────

    @property
    def has_update(self) -> bool:
        return self.proceed and self.content is not None

    @property
    def download_urls(self) -> list[str]:
        """Extract download URLs from ``contentResources``."""
        if not self.content_resources:
            return []
        return [r["url"] for r in self.content_resources if r.get("url")]

    @property
    def source_version(self) -> str:
        if self.content:
            return self.content.get("sourceDisplayVersion", "?")
        return "?"

    @property
    def target_version(self) -> str:
        if self.content:
            return self.content.get("displayVersion", "?")
        return "?"

    @property
    def target_guid(self) -> str:
        if self.content:
            return self.content.get("otaTargetSha1", "")
        return ""

    @property
    def size_bytes(self) -> int:
        if self.content:
            return int(self.content.get("size", 0))
        return 0

    @property
    def size_mb(self) -> float:
        return round(self.size_bytes / (1024 * 1024), 1)

    @property
    def update_type(self) -> str:
        if self.content:
            return self.content.get("updateType", "?")
        return "?"

    @property
    def package_id(self) -> str:
        if self.content:
            return self.content.get("packageID", "")
        return ""

    @property
    def md5(self) -> str:
        if self.content:
            return self.content.get("md5_checksum", "")
        return ""
