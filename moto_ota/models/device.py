"""Device information used in OTA check requests.

The CDS server **ignores** most device fields.  Only ``carrier``,
``otaSourceSha1`` (GUID), ``vitalUpdate`` and ``triggeredBy`` affect
routing (verified by exhaustive curl testing, March 2026).

This module keeps the full payload structure for compatibility with the
real device format but provides a *minimal* builder for quick checks.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass
class DevicePayload:
    """All the fields the real MotoOta app sends in a check request.

    Only ``carrier``, ``guid``, ``vital_update`` and ``triggered_by``
    actually matter for routing.  Everything else is cosmetic.
    """

    # ── required for routing ─────────────────────────────────────────
    guid: str = ""
    carrier: str = ""
    vital_update: bool = False
    triggered_by: str = "user"

    # ── cosmetic / informational ─────────────────────────────────────
    serial: str = "SERIAL_NOT_AVAILABLE"
    model: str = ""
    fingerprint: str = ""
    imei: str = "IMEI_NOT_AVAILABLE"
    mccmnc: str = "MCCMNC_NOT_AVAILABLE"
    hardware: str = ""
    bootloader: str = ""
    radio: str = ""
    build_id: str = ""
    os_version: str = "15"
    security_patch: str = ""

    def to_dict(self) -> dict[str, Any]:
        """Serialize to the JSON structure expected by the CDS ``/check``
        endpoint.  Mirrors ``CheckRequestBuilder.smali``.
        """
        return {
            "id": self.serial,
            "contentTimestamp": 0,
            "deviceInfo": {
                "manufacturer": "motorola",
                "hardware": self.hardware,
                "brand": "motorola",
                "model": self.model,
                "product": "",
                "os": "Linux:null:null",
                "osVersion": self.os_version,
                "country": "",
                "region": "US",
                "language": "en",
                "userLanguage": "en_US",
            },
            "extraInfo": {
                "clientIdentity": "motorola-ota-client-app",
                "carrier": self.carrier,
                "bootloaderVersion": self.bootloader,
                "brand": "motorola",
                "model": self.model,
                "fingerprint": self.fingerprint,
                "radioVersion": self.radio,
                "buildTags": "release-keys",
                "buildType": "user",
                "buildDevice": "",
                "buildId": self.build_id,
                "buildDisplayId": self.build_id,
                "buildIncrementalVersion": "",
                "releaseVersion": self.os_version,
                "otaSourceSha1": self.guid,
                "network": "WIFI",
                "apkVersion": 3500094,
                "provisionedTime": 0,
                "incrementalVersion": 0,
                "additionalInfo": "",
                "userLocation": "Non-CN",
                "bootloaderStatus": "not-applicable",
                "deviceRooted": "false",
                "is4GBRam": False,
                "deviceChipset": "Others",
                "imei": self.imei,
                "mccmnc": self.mccmnc,
                "imei2": "IMEI_NOT_AVAILABLE",
                "mccmnc2": "MCCMNC_NOT_AVAILABLE",
                "securityVersion": self.security_patch,
                "ro.virtual_ab.enabled": True,
                "vitalUpdate": self.vital_update,
                "clientState": "IDLE",
                "userTriggerLaunchPoint": "settingsCheckUpdate",
            },
            "identityInfo": {"serialNumber": self.serial},
            "triggeredBy": self.triggered_by,
            "idType": "serialNumber",
        }
