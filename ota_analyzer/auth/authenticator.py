"""Header-based authenticator for Motorola CDS servers.

Authentication details extracted from:
  - FileUtils.smali  (X-Moto-Auth-Sign, Secretkey headers)
  - LibConfigs.smali  (APPIID, APPSECERET credentials)
  - WaitForResponseTask$InternalResponseReceiver$3.smali (header map)
"""

from __future__ import annotations

from dataclasses import dataclass

from ota_analyzer.config.settings import OTASettings


@dataclass
class OTAAuthenticator:
    """Builds the authentication headers required by Motorola CDS endpoints.

    The CDS API authenticates requests via custom HTTP headers rather than
    OAuth/Bearer tokens.  The header values are static credentials embedded
    in the original APK (see *FileUtils.smali* and *LibConfigs.smali*).
    """

    settings: OTASettings

    # -- public API --------------------------------------------------------

    def get_check_headers(self) -> dict[str, str]:
        """Headers for check / state / resources endpoints."""
        return {
            "Content-Type": "application/json",
            "X-Moto-Auth-Sign": self.settings.upload_auth_sign,
            "Secretkey": self.settings.upload_secret_key,
        }

    def get_upload_headers(self, filename: str = "") -> dict[str, str]:
        """Headers for the file-upload endpoint (store-ota.svcmot.com)."""
        return {
            "Content-Type": "application/octet-stream",
            "X-Moto-Auth-Sign": self.settings.upload_auth_sign,
            "Secretkey": self.settings.upload_secret_key,
        }

    @property
    def app_credentials(self) -> tuple[str, str]:
        """Return (app_id, app_secret) from LibConfigs."""
        return self.settings.app_id, self.settings.app_secret
