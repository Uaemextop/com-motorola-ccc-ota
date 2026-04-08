"""CDS server endpoints and CDN hosts verified by direct probing (April 2026).

Each Motorola CDS environment runs the same GAE ``moto-cds`` application.
Only the **production** servers carry OTA packages; staging/QA/dev/blurdev
always return ``proceed=false``.

``ota-cn-sdc.blurdev.com`` is an nginx/1.14.1 proxy to
``moto-cds-staging.appspot.com`` (identical ``applicationId`` + version).

CDN hosts serve firmware files (not CDS API).  ``ota-cdn.lenovo.com`` is
an S3+CloudFront CDN (us-east-1) for Lenovo/ZUI device firmware.  Files
are publicly accessible at ``/firmware/{id}.zip`` if you know the exact
filename.  ``dlmgr.gtm.svcmot.com`` serves Motorola OTA delta packages
via the CDS ``contentResources`` URLs.

CDS exposes three POST endpoints (discovered via APK smali analysis):

1. ``/check``     — Returns OTA info + signed download URLs.
2. ``/resources`` — Returns **fresh** download URLs for an already-checked
   update (token refresh without full re-check).  Requires ``trackingId``
   from the ``/check`` response.
3. ``/state``     — Reports update status (downloading/downloaded/installing
   /installed/failed/canceled/deferred) back to the server.

Dual CDN architecture:

- **DLMGR_AGENT** (``dlmgr.gtm.svcmot.com``): Jetty 9.4.8, signed token
  URLs with 600 s TTL.  Token structure: 16-byte random nonce +
  160-byte encrypted payload (package ID + expiry).  Supports HTTP 206
  Range requests.  ``tigo-dlmgr.gtm.svcmot.com`` also serves the same
  signed tokens.
- **EDGECAST_AGENT** (``dlmgredg-vz.gtm.svcmot.com``): nginx/1.14.1
  behind Akamai.  Direct file access by ``packageID`` — **no** signed URL
  required.  Supports HTTP 206 Range.  Public if you know the packageID.
  URL pattern: ``https://dlmgredg-vz.gtm.svcmot.com/{packageID}``.

The CDN backend is **carrier-dependent**: the same GUID may return
DLMGR_AGENT for one carrier and EDGECAST_AGENT for another.

OTA updates form a **tree** (not a linear chain): different carriers
may branch to carrier-specific intermediate versions before converging
back to the main path.

svcmot.cn infrastructure (Azure China East):
- ``svcmot.cn`` / ``www.svcmot.cn``: Apache static landing page (139.219.132.123)
- ``api.svcmot.cn``: Jetty 12.0.16, CORS ``*``, cloud-service framework
  present but **no** services deployed (all ``NO_MATCHING_SERVICE``)
- ``dlmgr-ec.svcmot.cn``: Apache behind Tencent EdgeOne CDN, 403/404 only
- ``argo.svcmot.com``: Jetty 12.0.16 with ``/cloud-service-1.0`` WAR
  deployed (directory listing enabled); ``/ws`` service is registered
- ``api-sg.svcmot.com`` / ``mapi-sg.svcmot.com``: Jetty 12.0.16 on Azure
  Singapore (52.187.127.159), ``/cloud-service-1.0/`` paths return
  ``URI_FORMAT_STRING_ERROR`` (services exist but require ``.json``/``.pb``
  format marker)
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import Enum


class ServerEnv(str, Enum):
    """Available CDS server environments."""

    PRODUCTION_GLOBAL = "production-global"
    PRODUCTION_PRC = "production-prc"
    PRODUCTION_SG = "production-sg"
    STAGING = "staging"
    QA = "qa"
    DEV = "dev"
    BLURDEV = "blurdev"


@dataclass(frozen=True)
class Server:
    """Immutable CDS server definition."""

    host: str
    label: str
    env: ServerEnv
    description: str = ""

    @property
    def base_url(self) -> str:
        return f"https://{self.host}"

    def check_url(self, guid: str, context: str = "ota") -> str:
        """Build the ``/check`` endpoint URL for a given GUID."""
        return (
            f"{self.base_url}/cds/upgrade/1/check"
            f"/ctx/{context}/key/{guid}"
        )

    def resources_url(
        self, guid: str, tracking_id: str, context: str = "ota"
    ) -> str:
        """Build the ``/resources`` endpoint URL (refresh download URLs)."""
        return (
            f"{self.base_url}/cds/upgrade/1/resources"
            f"/t/{tracking_id}/ctx/{context}/key/{guid}"
        )

    def state_url(
        self, guid: str, tracking_id: str, state: str,
        context: str = "ota",
    ) -> str:
        """Build the ``/state`` endpoint URL (report update status)."""
        return (
            f"{self.base_url}/cds/upgrade/1/state"
            f"/t/{tracking_id}/s/{state}/ctx/{context}/key/{guid}"
        )

    def versions_url(self) -> str:
        """Build the ``/versions`` endpoint URL."""
        return f"{self.base_url}/cds/upgrade/1/versions"


@dataclass(frozen=True)
class CdnHost:
    """Known firmware CDN host (not a CDS API server)."""

    host: str
    label: str
    description: str = ""
    path_prefix: str = "/firmware/"

    @property
    def base_url(self) -> str:
        return f"https://{self.host}"

    def firmware_url(self, filename: str) -> str:
        """Build a firmware download URL."""
        return f"{self.base_url}{self.path_prefix}{filename}"


SERVERS: dict[ServerEnv, Server] = {
    ServerEnv.PRODUCTION_GLOBAL: Server(
        host="moto-cds.appspot.com",
        label="Production (Global)",
        env=ServerEnv.PRODUCTION_GLOBAL,
        description="Google Frontend — serves most devices worldwide",
    ),
    ServerEnv.PRODUCTION_PRC: Server(
        host="moto-cds.svcmot.cn",
        label="Production (PRC / LATAM)",
        env=ServerEnv.PRODUCTION_PRC,
        description="nginx/1.14.1 — serves China & Latin-American devices",
    ),
    ServerEnv.PRODUCTION_SG: Server(
        host="moto-cds-sg.svcmot.com",
        label="Production (Singapore)",
        env=ServerEnv.PRODUCTION_SG,
        description=(
            "nginx/1.14.1 — Singapore region; returns identical chains "
            "but always uses DLMGR_AGENT CDN backend"
        ),
    ),
    ServerEnv.STAGING: Server(
        host="moto-cds-staging.appspot.com",
        label="Staging",
        env=ServerEnv.STAGING,
        description="Zero OTA packages, smartUpdateBitmap=7",
    ),
    ServerEnv.QA: Server(
        host="moto-cds-qa.appspot.com",
        label="QA",
        env=ServerEnv.QA,
        description="Zero OTA packages, smartUpdateBitmap=-1",
    ),
    ServerEnv.DEV: Server(
        host="moto-cds-dev.appspot.com",
        label="Development",
        env=ServerEnv.DEV,
        description=(
            "Zero OTA packages, smartUpdateBitmap=11; "
            "version 20260217t112859 (from APK validMasterUrls)"
        ),
    ),
    ServerEnv.BLURDEV: Server(
        host="ota-cn-sdc.blurdev.com",
        label="Blurdev (≡ Staging)",
        env=ServerEnv.BLURDEV,
        description="nginx proxy → moto-cds-staging; v1/check times out",
    ),
}

# ── CDN hosts ────────────────────────────────────────────────────────

CDN_HOSTS: dict[str, CdnHost] = {
    "lenovo-ota": CdnHost(
        host="ota-cdn.lenovo.com",
        label="Lenovo OTA CDN",
        description=(
            "S3+CloudFront (us-east-1) — Lenovo/ZUI firmware ZIPs, "
            "GET only (POST blocked), no Range/resume, no bucket listing"
        ),
        path_prefix="/firmware/",
    ),
    "motorola-dlmgr": CdnHost(
        host="dlmgr.gtm.svcmot.com",
        label="Motorola DLMGR (signed)",
        description=(
            "Jetty 9.4.8 — serves CDS delta OTA packages with signed "
            "token URLs (600 s TTL, 176-byte token = 16 B nonce + "
            "160 B encrypted payload).  Supports HTTP 206 Range.  "
            "tigo-dlmgr.gtm.svcmot.com also serves the same tokens."
        ),
        path_prefix="/dl/dlws/1/download/",
    ),
    "motorola-edgecast": CdnHost(
        host="dlmgredg-vz.gtm.svcmot.com",
        label="Motorola EDGECAST (public)",
        description=(
            "nginx/1.14.1 behind Akamai — serves CDS delta OTA "
            "packages by packageID directly, NO signed URL required.  "
            "Supports HTTP 206 Range.  Public if you know the "
            "packageID (zip_name.md5_hash)."
        ),
        path_prefix="/",
    ),
    "lenovo-rsd": CdnHost(
        host="rsddownload-secure.lenovo.com",
        label="Lenovo RSD (Rescue)",
        description=(
            "S3+CloudFront — full factory firmware ZIPs for Rescue, "
            "public if you know the exact filename"
        ),
        path_prefix="/",
    ),
}

DEFAULT_SERVER = ServerEnv.PRODUCTION_PRC
