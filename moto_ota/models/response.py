"""Parse CDS server responses.

A successful response looks like::

    {
      "proceed": true,
      "context": "ota",
      "contextKey": "<target GUID>",
      "content": { ... update metadata ... },
      "contentResources": [ { "url": "...", "tags": [...], ... } ],
      "trackingId": "...",
      "reportingTags": "TRIGGER-USER",
      "pollAfterSeconds": 86400,
      "smartUpdateBitmap": 7,
      "uploadFailureLogs": false
    }

When no update is available: ``proceed=false``, ``content=null``.

``content`` metadata keys (from full dump, April 2026):

- **Versioning**: ``displayVersion``, ``sourceDisplayVersion``, ``version``,
  ``flavour``, ``minVersion``, ``model``
- **Identity**: ``otaSourceSha1``, ``otaTargetSha1``, ``packageID``,
  ``md5_checksum``, ``size``
- **Timestamps**: ``sourceBuildTimestamp``, ``targetBuildTimestamp``
- **Install**: ``abInstallType`` (``streamingOnAb``), ``rebootRequired``,
  ``forced``, ``wifionly``, ``oemConfigUpdate``
- **Streaming A/B**: ``streamingData`` → ``header`` (FILE_HASH, FILE_SIZE,
  METADATA_HASH, METADATA_SIZE) + ``additionalInfo`` (payload.bin offset/size)
- **Deployment**: ``deploymentPlanPhase`` (``Open`` / ``Default``),
  ``deploymentPhaseForAdvancedNotice``, ``severityType``
- **Whitelisting**: ``serialNoListType``, ``imeiListType``, ``emailListType``,
  ``mccListType``, ``mccmncListType`` (values: ``NA`` / ``Inclusive``)
- **UI**: ``uiWorkflowControl`` (per-trigger settings), ``featureEnableBitmap``,
  ``showPreDownloadDialog``, ``showDownloadProgress``, etc.
- **Content**: ``releaseNotes`` (HTML), ``preInstallNotes``,
  ``postInstallNotes``, ``upgradeNotification``
- **Timing**: ``annoy``, ``installReminder``, ``forceUpgradeTime``,
  ``forceDownloadTime``, ``forceInstallTime``
- **Tracking**: ``trackingId``, ``reportingTags`` (``"TRIGGER-USER"``)
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
    reporting_tags: str = ""

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
            reporting_tags=payload.get("reportingTags", ""),
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
    def cdn_tags(self) -> list[list[str]]:
        """Extract CDN tags (e.g. ``[['WIFI','DLMGR_AGENT'], ...]``)."""
        if not self.content_resources:
            return []
        return [r.get("tags", []) for r in self.content_resources]

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

    @property
    def release_notes(self) -> str:
        """HTML release notes (security patch level + changelog)."""
        if self.content:
            return self.content.get("releaseNotes", "")
        return ""

    @property
    def model(self) -> str:
        if self.content:
            return self.content.get("model", "")
        return ""

    @property
    def deployment_phase(self) -> str:
        """Rollout phase: ``Open``, ``Default``, etc."""
        if self.content:
            return self.content.get("deploymentPlanPhase", "")
        return ""

    @property
    def ab_install_type(self) -> str:
        """A/B install type: ``streamingOnAb``, etc."""
        if self.content:
            return self.content.get("abInstallType", "")
        return ""

    @property
    def streaming_data(self) -> Optional[dict[str, Any]]:
        """Streaming A/B OTA metadata (payload offsets, hashes)."""
        if self.content:
            return self.content.get("streamingData")
        return None

    @property
    def feature_enable_bitmap(self) -> int:
        """Per-content feature bitmap (different from smartUpdateBitmap)."""
        if self.content:
            return int(self.content.get("featureEnableBitmap", 0))
        return 0

    @property
    def is_forced(self) -> bool:
        if self.content:
            return bool(self.content.get("forced", False))
        return False

    @property
    def is_wifi_only(self) -> bool:
        if self.content:
            return bool(self.content.get("wifionly", False))
        return False
