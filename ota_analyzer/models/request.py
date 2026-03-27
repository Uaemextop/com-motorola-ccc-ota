"""OTA check-request model.

Structure derived from CheckRequestBuilder.smali JSON construction.

Critical fields verified from smali bytecode:
  - id      → BuildPropertyUtils.getId(Context) = device serial number
  - idType  → hardcoded "serialNumber" (NOT "IMEI")
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

from .device_info import DeviceInfo, ExtraInfo, IdentityInfo


@dataclass
class CheckRequest:
    """Payload sent to ``cds/upgrade/1/check``.

    JSON schema extracted from CheckRequestBuilder.smali.

    The ``context_key`` is ``ro.mot.build.guid`` and is used only in the URL
    (not in the JSON body).  If unknown, the build fingerprint or build ID
    can be used as fallback.
    """
    device_info: DeviceInfo = field(default_factory=DeviceInfo)
    extra_info: ExtraInfo = field(default_factory=ExtraInfo)
    identity_info: IdentityInfo = field(default_factory=IdentityInfo)
    triggered_by: str = "user"
    id_type: str = "serialNumber"  # hardcoded in smali
    request_id: str = "SERIAL_NUMBER_NOT_AVAILABLE"  # BuildPropertyUtils.getId()
    content_timestamp: int = 0
    context_key: str = ""  # ro.mot.build.guid — used in URL only

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
