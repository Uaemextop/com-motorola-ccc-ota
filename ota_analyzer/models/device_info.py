"""Device information models derived from CheckRequestBuilder.smali.

Field names and data sources are mapped from the smali bytecode analysis of
BuildPropReader.smali and CheckRequestBuilder.smali.  JSON key names must
match the server expectation exactly (camelCase).

Type mapping (verified from smali bytecode):
  - apkVersion      → Integer (Map.put with Integer.valueOf)
  - provisionedTime → Long    (Map.put with Long.valueOf)
  - incrementalVersion → Integer
  - is4GBRam        → Boolean
  - imei / mccmnc   → String  (NOT JSONArray)
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass
class DeviceInfo:
    """Device hardware/software identifiers.

    Maps to the ``deviceInfo`` JSON object in the CDS check request.
    Source: BuildPropReader.smali getDeviceInfoAsJsonObject() lines 291-401.

    All 11 fields are always included by the original app.
    """
    manufacturer: str = "motorola"          # Build.MANUFACTURER
    hardware: str = ""                      # Build.HARDWARE
    brand: str = "motorola"                 # Build.BRAND
    model: str = ""                         # Build.MODEL
    product: str = ""                       # ro.vendor.product.display
    os: str = ""                            # System.getProperty("os.name"):vm.name:runtime.name
    os_version: str = ""                    # Build.VERSION.RELEASE
    country: str = ""                       # ro.product.locale.region
    region: str = ""                        # parsed from ro.product.locale (before _)
    language: str = ""                      # parsed from ro.product.locale (after _)
    user_language: str = ""                 # Locale.getDefault().toString()

    def to_dict(self) -> dict[str, Any]:
        return {
            "manufacturer": self.manufacturer,
            "hardware": self.hardware,
            "brand": self.brand,
            "model": self.model,
            "product": self.product,
            "os": self.os,
            "osVersion": self.os_version,
            "country": self.country,
            "region": self.region,
            "language": self.language,
            "userLanguage": self.user_language,
        }


@dataclass
class ExtraInfo:
    """Extended device metadata.

    Maps to the ``extraInfo`` JSON object in the CDS check request.
    Source: BuildPropReader.smali getExtraInfoAsJsonObject() lines 671-970+.

    All fields are always included by the original app (even if empty).
    """
    client_identity: str = "motorola-ota-client-app"
    carrier: str = ""                        # getCarrierName()
    bootloader_version: str = ""             # Build.BOOTLOADER
    brand: str = ""                          # Build.BRAND
    model: str = ""                          # Build.MODEL
    fingerprint: str = ""                    # Build.FINGERPRINT
    radio_version: str = ""                  # Build.getRadioVersion()
    build_tags: str = ""                     # Build.TAGS
    build_type: str = ""                     # Build.TYPE
    build_device: str = ""                   # Build.DEVICE
    build_id: str = ""                       # Build.ID
    build_display_id: str = ""               # Build.DISPLAY
    build_incremental_version: str = ""      # Build.VERSION.INCREMENTAL
    release_version: str = ""                # Build.VERSION.RELEASE
    ota_source_sha1: str = ""                # getDeviceSha1() → ro.mot.build.guid
    network: str = "wifi"                    # network type string
    apk_version: int = 3500094               # OTA app versionCode (integer)
    provisioned_time: int = 0                # long – last provision timestamp
    incremental_version: int = 0             # integer – incremental version
    additional_info: str = ""                # extra info string
    user_location: str = "Non-CN"            # "CN" or "Non-CN"
    bootloader_status: str = "locked"        # locked / unlocked / not-applicable
    device_rooted: str = "false"             # false / true / enableVerity / deviceRemounted
    is_4gb_ram: bool = False                 # boolean
    device_chipset: str = "Others"           # "Qualcomm" or "Others"
    imei: str = "IMEI_NOT_AVAILABLE"         # primary IMEI (String, not array)
    mccmnc: str = "MCCMNC_NOT_AVAILABLE"     # primary MCC+MNC (String, not array)
    imei2: str = "IMEI_NOT_AVAILABLE"        # secondary IMEI (dual-SIM)
    mccmnc2: str = "MCCMNC_NOT_AVAILABLE"    # secondary MCC+MNC
    security_version: str = ""               # ro.build.version.security_patch

    # System-property fields (lines 996-1076 in BuildPropReader.smali)
    # All default to "unknown" via getSystemStringProperty(key, "unknown")
    ro_mot_build_device: str = "unknown"             # ro.mot.build.device
    ro_vendor_hw_storage: str = "unknown"             # ro.vendor.hw.storage
    ro_vendor_hw_ram: str = "unknown"                 # ro.vendor.hw.ram
    ro_vendor_hw_esim: str = "unknown"                # ro.vendor.hw.esim
    ro_mot_product_wave: str = "unknown"              # ro.mot.product_wave
    ro_mot_build_oem_product: str = "unknown"         # ro.mot.build.oem.product
    ro_mot_build_system_product: str = "unknown"      # ro.mot.build.system.product
    ro_mot_build_product_increment: str = "unknown"   # ro.mot.build.product.increment
    ro_boot_veritymode: str = "unknown"               # ro.boot.veritymode
    partition_system_verified: str = "unknown"        # partition.system.verified

    # Build & version (lines 1078-1125)
    ro_mot_version: int = -1                 # ro.mot.version (integer, default -1)
    ro_enterpriseedition: bool = False       # isMotoSettingsGlobalEnterpriseEditionFlagSet()
    ro_virtual_ab_enabled: bool = False      # doesDeviceSupportVABUpdate()
    vital_update: bool = False               # BotaSettings FLAG_IS_VITAL_UPDATE

    def to_dict(self) -> dict[str, Any]:
        return {
            "clientIdentity": self.client_identity,
            "carrier": self.carrier,
            "bootloaderVersion": self.bootloader_version,
            "brand": self.brand,
            "model": self.model,
            "fingerprint": self.fingerprint,
            "radioVersion": self.radio_version,
            "buildTags": self.build_tags,
            "buildType": self.build_type,
            "buildDevice": self.build_device,
            "buildId": self.build_id,
            "buildDisplayId": self.build_display_id,
            "buildIncrementalVersion": self.build_incremental_version,
            "releaseVersion": self.release_version,
            "otaSourceSha1": self.ota_source_sha1,
            "network": self.network,
            "apkVersion": self.apk_version,
            "provisionedTime": self.provisioned_time,
            "incrementalVersion": self.incremental_version,
            "additionalInfo": self.additional_info,
            "userLocation": self.user_location,
            "bootloaderStatus": self.bootloader_status,
            "deviceRooted": self.device_rooted,
            "is4GBRam": self.is_4gb_ram,
            "deviceChipset": self.device_chipset,
            "imei": self.imei,
            "mccmnc": self.mccmnc,
            "imei2": self.imei2,
            "mccmnc2": self.mccmnc2,
            "ro.mot.build.device": self.ro_mot_build_device,
            "ro.vendor.hw.storage": self.ro_vendor_hw_storage,
            "ro.vendor.hw.ram": self.ro_vendor_hw_ram,
            "ro.vendor.hw.esim": self.ro_vendor_hw_esim,
            "ro.mot.product_wave": self.ro_mot_product_wave,
            "ro.mot.build.oem.product": self.ro_mot_build_oem_product,
            "ro.mot.build.system.product": self.ro_mot_build_system_product,
            "ro.mot.build.product.increment": self.ro_mot_build_product_increment,
            "ro.boot.veritymode": self.ro_boot_veritymode,
            "partition.system.verified": self.partition_system_verified,
            "ro.mot.version": self.ro_mot_version,
            "securityVersion": self.security_version,
            "ro.enterpriseedition": self.ro_enterpriseedition,
            "ro.virtual_ab.enabled": self.ro_virtual_ab_enabled,
            "vitalUpdate": self.vital_update,
        }


@dataclass
class IdentityInfo:
    """Device identity for server-side tracking.

    Maps to the ``identityInfo`` JSON object in the CDS check request.
    Source: BuildPropReader.smali getIdentityInfoAsJsonObject() lines 1190-1238.
    """
    serial_number: str = "SERIAL_NUMBER_NOT_AVAILABLE"

    def to_dict(self) -> dict[str, Any]:
        return {"serialNumber": self.serial_number}
