"""OTA check-response model.

Field mapping extracted from CheckResponseBuilder.smali.

Response structure verified by direct probing (March 2026):
  - ``proceed=false`` with ``content=null`` when no packages exist
  - ``contentResources`` contains download URLs with tags (WIFI/CELL)
  - ``x-cds-content-exists`` HTTP header indicates if content is registered
  - ``smartUpdateBitmap`` differs by server: prod=7, staging=7, QA=-1, dev=11
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Optional


@dataclass
class CheckResponse:
    """Parsed response from ``cds/upgrade/1/check``.

    Fields correspond to the JSON keys parsed in CheckResponseBuilder.smali.
    """
    proceed: bool = False
    context: str = ""
    context_key: str = ""
    content_timestamp: int = 0
    reporting_tags: str = ""
    tracking_id: str = "unknown"
    poll_after_seconds: int = 0
    content: Optional[dict[str, Any]] = None
    content_resources: Optional[list[dict[str, Any]]] = None
    smart_update_bitmap: int = -1
    settings: Optional[dict[str, Any]] = None
    upload_failure_logs: bool = False
    status_code: int = 0
    raw: Optional[dict[str, Any]] = None
    # HTTP response header (not in JSON body)
    x_cds_content_exists: Optional[bool] = None

    @classmethod
    def from_dict(
        cls,
        data: dict[str, Any],
        headers: Optional[dict[str, str]] = None,
    ) -> "CheckResponse":
        """Build a response from the JSON returned by the CDS server.

        Handles both the outer wrapper (statusCode/payload) and the inner
        response object parsed in CheckResponseBuilder.smali.

        *headers* is the HTTP response headers dict; when supplied the
        ``x-cds-content-exists`` header is captured.
        """
        status_code = data.get("statusCode", 0)
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
            content_timestamp=payload.get("contentTimestamp", 0),
            reporting_tags=payload.get("reportingTags", ""),
            tracking_id=payload.get("trackingId", "unknown"),
            poll_after_seconds=payload.get("pollAfterSeconds", 0),
            content=payload.get("content"),
            content_resources=payload.get("contentResources"),
            smart_update_bitmap=payload.get("smartUpdateBitmap", -1),
            settings=payload.get("settings"),
            upload_failure_logs=payload.get("uploadFailureLogs", False),
            status_code=status_code,
            raw=data,
            x_cds_content_exists=x_cds,
        )

    @property
    def has_update(self) -> bool:
        return self.proceed and self.content is not None

    @property
    def download_urls(self) -> list[str]:
        """Extract download URLs from content resources."""
        if not self.content_resources:
            return []
        return [r["url"] for r in self.content_resources if r.get("url")]
