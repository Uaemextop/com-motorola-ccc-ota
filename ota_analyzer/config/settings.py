"""Application-level settings extracted from LibConfigs.smali.

Credentials default to the values embedded in the original APK but can be
overridden via environment variables for security.
"""

import os
from dataclasses import dataclass, field


@dataclass
class OTASettings:
    """Settings derived from the LibConfigs enum in the decompiled APK.

    Each field maps to a configuration key found in
    smali_classes2/com/motorola/ccc/ota/otalib/main/Settings/LibConfigs.smali

    Sensitive values can be overridden with environment variables:
      - ``OTA_APP_ID``
      - ``OTA_APP_SECRET``
      - ``OTA_AUTH_SIGN``
      - ``OTA_SECRET_KEY``
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

    # Application credentials (LibConfigs APPIID / APPSECERET [sic])
    app_id: str = field(
        default_factory=lambda: os.environ.get(
            "OTA_APP_ID", "MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ"
        )
    )
    app_secret: str = field(
        default_factory=lambda: os.environ.get(
            "OTA_APP_SECRET", "zdG4h4k2NOm6MSh"
        )
    )

    # Upload authentication (FileUtils.smali)
    upload_auth_sign: str = field(
        default_factory=lambda: os.environ.get(
            "OTA_AUTH_SIGN", "d928bee85b45cffe7b0f21084dd3d20e"
        )
    )
    upload_secret_key: str = field(
        default_factory=lambda: os.environ.get(
            "OTA_SECRET_KEY", "SecretMOTOKey321"
        )
    )
