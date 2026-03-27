"""OTA check-response model.

Field mapping extracted from CheckResponseBuilder.smali.
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
    smart_update_bitmap: int = -1
    settings: Optional[dict[str, Any]] = None
    upload_failure_logs: bool = False
    status_code: int = 0
    raw: Optional[dict[str, Any]] = None

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "CheckResponse":
        """Build a response from the JSON returned by the CDS server.

        Handles both the outer wrapper (statusCode/payload) and the inner
        response object parsed in CheckResponseBuilder.smali.
        """
        status_code = data.get("statusCode", 0)
        payload = data.get("payload", data)

        return cls(
            proceed=payload.get("proceed", False),
            context=payload.get("context", ""),
            context_key=payload.get("contextKey", ""),
            content_timestamp=payload.get("contentTimestamp", 0),
            reporting_tags=payload.get("reportingTags", ""),
            tracking_id=payload.get("trackingId", "unknown"),
            poll_after_seconds=payload.get("pollAfterSeconds", 0),
            content=payload.get("content"),
            smart_update_bitmap=payload.get("smartUpdateBitmap", -1),
            settings=payload.get("settings"),
            upload_failure_logs=payload.get("uploadFailureLogs", False),
            status_code=status_code,
            raw=data,
        )

    @property
    def has_update(self) -> bool:
        return self.proceed and self.content is not None
