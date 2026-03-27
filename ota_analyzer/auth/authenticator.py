"""Header-based authenticator for Motorola CDS servers.

Authentication details extracted from:
  - WaitForResponseTask$InternalResponseReceiver$3.smali
      getHeaders() → returns EMPTY HashMap (no custom headers for check)
  - FileUtils.smali  (X-Moto-Auth-Sign, Secretkey headers – upload only)
  - LibConfigs.smali  (APPIID, APPSECERET credentials)

IMPORTANT: The CDS check/state/resources endpoints do NOT use custom
HTTP headers for authentication.  Volley's JsonObjectRequest sends only
its default headers (Content-Type: application/json).  The X-Moto-Auth-Sign
and Secretkey headers are used ONLY for the file-upload endpoint
(store-ota.svcmot.com).
"""

from __future__ import annotations

from dataclasses import dataclass

from ota_analyzer.config.settings import OTASettings


@dataclass
class OTAAuthenticator:
    """Builds the authentication headers required by Motorola endpoints.

    For CDS check/resources/state requests: no custom headers are needed
    (verified from smali – getHeaders() returns empty HashMap).

    For file-upload requests: X-Moto-Auth-Sign and Secretkey are required.
    """

    settings: OTASettings

    # -- public API --------------------------------------------------------

    def get_check_headers(self, model: str = "", build_id: str = "") -> dict[str, str]:
        """Headers for check / state / resources endpoints.

        From the HAR capture the real app sends:
          Content-Type: application/json; charset=utf-8
          User-Agent: Dalvik/2.1.0 (Linux; U; Android 15; {model} Build/{buildId})
        """
        ua = f"Dalvik/2.1.0 (Linux; U; Android 15; {model} Build/{build_id})"
        return {
            "Content-Type": "application/json; charset=utf-8",
            "User-Agent": ua,
            "Connection": "Keep-Alive",
            "Accept-Encoding": "gzip",
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
