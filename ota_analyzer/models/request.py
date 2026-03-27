"""OTA check-request model.

Structure derived from CheckRequestBuilder.smali JSON construction.
"""

from __future__ import annotations

import time
import uuid
from dataclasses import dataclass, field
from typing import Any

from .device_info import DeviceInfo, ExtraInfo, IdentityInfo


@dataclass
class CheckRequest:
    """Payload sent to ``cds/upgrade/1/check``.

    JSON schema extracted from CheckRequestBuilder.smali.
    """
    device_info: DeviceInfo = field(default_factory=DeviceInfo)
    extra_info: ExtraInfo = field(default_factory=ExtraInfo)
    identity_info: IdentityInfo = field(default_factory=IdentityInfo)
    triggered_by: str = "user"
    id_type: str = "IMEI"
    request_id: str = field(default_factory=lambda: str(uuid.uuid4()))
    content_timestamp: int = 0

    def to_dict(self) -> dict[str, Any]:
        """Serialize to the JSON structure expected by the CDS server."""
        return {
            "id": self.request_id,
            "contentTimestamp": self.content_timestamp,
            "deviceInfo": self.device_info.to_dict(),
            "extraInfo": self.extra_info.to_dict(),
            "identityInfo": self.identity_info.to_dict(),
            "triggeredBy": self.triggered_by,
            "idType": self.id_type,
        }
