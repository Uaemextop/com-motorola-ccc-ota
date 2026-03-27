"""Device information models derived from CheckRequestBuilder.smali.

Field names and data sources are mapped from the smali bytecode analysis of
BuildPropReader.smali and CheckRequestBuilder.smali.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass
class DeviceInfo:
    """Device hardware/software identifiers.

    Maps to the ``deviceInfo`` JSON object in the CDS check request.
    Source: CheckRequestBuilder.smali lines 411-481.
    """
    manufacturer: str = "motorola"
    model: str = ""          # ro.product.model
    product: str = ""        # ro.build.product
    carrier: str = ""        # telephony carrier name
    is_prc: bool = False     # China region flag
    user_language: str = ""  # Locale.getDefault()

    def to_dict(self) -> dict[str, Any]:
        return {
            "manufacturer": self.manufacturer,
            "model": self.model,
            "product": self.product,
            "carrier": self.carrier,
            "isPRC": self.is_prc,
            "userLanguage": self.user_language,
        }


@dataclass
class ExtraInfo:
    """Extended device metadata.

    Maps to the ``extraInfo`` JSON object in the CDS check request.
    Source: CheckRequestBuilder.smali lines 483-629.
    """
    client_identity: str = "motorola-ota-client-app"
    brand: str = ""            # color ID / variant
    build_device: str = ""     # internal device name
    ota_source_sha1: str = ""  # SHA-1 of current OTA
    build_id: str = ""         # ro.build.version
    version_name: str = ""     # combined build version
    apk_version: str = ""      # OTA app version
    provision_time: str = ""   # last provision timestamp
    current_state: str = ""    # current package state
    security_patch: str = ""   # ro.build.version.security_patch
    build_date_utc: str = ""   # ro.build.date.utc
    hardware_sku: str = ""     # ro.boot.hardware.sku
    ram_size: str = ""         # ro.vendor.hw.ram

    def to_dict(self) -> dict[str, Any]:
        return {
            "clientIdentity": self.client_identity,
            "brand": self.brand,
            "buildDevice": self.build_device,
            "otaSourceSha1": self.ota_source_sha1,
            "buildId": self.build_id,
            "versionName": self.version_name,
            "apkVersion": self.apk_version,
            "provisionTime": self.provision_time,
            "currentState": self.current_state,
            "securityPatch": self.security_patch,
            "buildDateUtc": self.build_date_utc,
            "hardwareSku": self.hardware_sku,
            "ramSize": self.ram_size,
        }


@dataclass
class IdentityInfo:
    """Device identity for server-side tracking.

    Maps to the ``identityInfo`` JSON object in the CDS check request.
    Source: CheckRequestBuilder.smali lines 631-671.
    """
    serial_number: str = ""

    def to_dict(self) -> dict[str, Any]:
        return {"serialNumber": self.serial_number}
