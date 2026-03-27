"""Application-level settings extracted from LibConfigs.smali."""

from dataclasses import dataclass, field


@dataclass
class OTASettings:
    """Settings derived from the LibConfigs enum in the decompiled APK.

    Each field maps to a configuration key found in
    smali_classes2/com/motorola/ccc/ota/otalib/main/Settings/LibConfigs.smali
    """

    # API paths (LibConfigs enum values)
    check_url: str = "cds/upgrade/1/check"
    resources_url: str = "cds/upgrade/1/resources"
    state_url: str = "cds/upgrade/1/state"

    # OTA context
    ota_context: str = "ota"

    # HTTP settings
    http_method: str = "post"
    secure: bool = True

    # Retry / back-off
    max_retries: int = 3
    backoff_values: list[int] = field(
        default_factory=lambda: [5000, 15000, 30000]
    )

    # Application credentials (from LibConfigs APPIID / APPSECERET)
    app_id: str = "MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ"
    app_secret: str = "zdG4h4k2NOm6MSh"

    # Upload authentication (from FileUtils.smali)
    upload_auth_sign: str = "d928bee85b45cffe7b0f21084dd3d20e"
    upload_secret_key: str = "SecretMOTOKey321"
