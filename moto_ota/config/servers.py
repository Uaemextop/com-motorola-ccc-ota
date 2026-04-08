"""CDS server endpoints, CDN hosts, and GAE APIs verified by probing (April 2026).

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
   from the ``/check`` response.  Confirmed: new URL token generated each call.
3. ``/state``     — Reports update status (downloading/downloaded/installing
   /installed/failed/canceled/deferred) back to the server.  All states
   return ``proceed=true`` with full response.

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

GAE Cloud Endpoints (``/_ah/api/``):

All four CDS environments expose three Cloud Endpoints APIs via the
standard GAE discovery service (``/_ah/api/discovery/v1/apis``):

1. **contentcheck:v2** — Two authentication-gated check methods:

   - ``emailauth/check`` (POST) — Requires OAuth2 with
     ``userinfo.email`` scope.  Parameters: context, contextkey, nonce,
     time.  Returns ``ContentEndpointResponse`` {contentResponse, time}.
   - ``proxyauth/check`` (POST) — Same params but requires the request
     to originate from a *different* GAE app (returns "Requests from
     moto-cds not allowed through proxy" when called on moto-cds itself).

   ContentCheckRequest schema adds ``deviceToken``, ``idType``,
   ``identityInfo``, ``reason``, ``status`` to the standard check body.
   ``TriggeredBy`` enum: ``user | setup | notification | polling |
   other | d2d`` (d2d = device-to-device transfer).

2. **adminEndpointAccess:v2** — Internal admin proxy that forwards
   arbitrary HTTP requests.  Single method ``postRequest`` with params:
   ``method``, ``uri``, ``bodyJson``, ``headersJson``.  Returns
   ``Response`` {body, headers, status}.  Requires OAuth2 auth.

3. **discovery:v1** — Standard GAE API discovery.

API Explorer UI at ``/_ah/api/explorer/``.  The ``key`` query parameter
can substitute for OAuth (API key auth).  ``/_ah/warmup`` returns 500;
``/admin`` returns 500.

CDS application versions (from ``/cds/upgrade/{1,2}/versions``):
- Production: ``20260227t153823`` (all 3 servers: global, PRC, SG)
- Staging: ``20260219t144007``
- QA: ``20251204t182430``
- Dev: ``20260217t112859``

CDS API v3+ returns ``UPGRADE_RESOURCE_NOT_FOUND`` (exists but not
populated).  ``/format/json`` and ``/format/proto`` suffixes accepted
but same result.  ``OPTIONS`` / ``PATCH`` on valid CDS paths returns
``UPGRADE_RESOURCE_BUSY``; on invalid sub-paths ``UPGRADE_RESOURCE_NOT_FOUND``.

``contentTimestamp`` behaviour: sending the server's own timestamp
(e.g. ``1735015291000``) means "I already have this version" → returns
``proceed=true`` with **null** content.  Any other value (``0``, future,
earlier) returns normal update with full content + download URLs.

DLMGR download token structure (176 bytes base64-decoded):

- **Bytes 0–15**: random nonce (changes every request)
- **Bytes 16–175**: AES-encrypted payload (160 bytes, **static** across
  all packages within the same session — does NOT contain the package ID
  but likely an expiry + HMAC)
- Nonce is cryptographically bound: replacing it returns HTTP 400
- WIFI and CELL tokens are **identical** (same URL for both networks)
- TTL is 600 s (from ``urlTtlSeconds``)

DLMGR API versions:

- ``/dl/dlws/1/download/{signed_token}`` — returns the actual OTA ZIP
  (HTTP 206 Range supported, ``application/octetstream``)
- ``/dl/dlws/2/download/{packageID}`` — returns JSON
  ``DOWNLOAD_RESOURCE_NOT_FOUND`` (structured error, not files)
- ``/dl/dlws/3/`` also exists (same JSON error structure)

DLMGR ``/dl/`` directory listing:

- ``META-INF/`` (44 B, Jan 29 2025)
- ``WEB-INF/`` (47 B, Jan 29 2025, contents protected — 404)
- ``build.html`` → ``20240411.1929``
- ``crossdomain.xml`` → ``<allow-access-from domain="*"/>``
- ``revision.html`` → ``developer``
- ``status.html`` → ``SUCCESS``

EDGECAST public access:

13 of 17 lamu_g OTA packages are publicly accessible on EDGECAST
(``dlmgredg-vz.gtm.svcmot.com/{packageID}``) with no authentication.
Only the 4 oldest delta packages (steps 1–2 of each carrier chain) are
exclusively available via DLMGR signed tokens (404 on EDGECAST).
Content-Length matches CDS ``size`` field exactly.

svcmot.cn infrastructure (Azure China East):
- ``svcmot.cn`` / ``www.svcmot.cn``: Apache static landing page (139.219.132.123)
- ``api.svcmot.cn``: Jetty 12.0.16, cloud-service framework present
  but **no** services deployed.  With ``.json`` format marker → 403
  ``NO_MATCHING_SERVICE``.  Without → 403 ``URI_MISSING_FORMAT_STRING``.
- ``dlmgr-ec.svcmot.cn``: Apache behind Tencent EdgeOne CDN, 403/404 only
- ``dlmgredg.svcmot.cn``: NXDOMAIN (no DNS record)
- ``motocare.svcmot.cn``: NXDOMAIN
- ``models*.aicore.svcmot.cn``: NXDOMAIN (all 4 subdomains)
- ``cliqr-repo-mmi.svcmot.cn``: NXDOMAIN

svcmot.com infrastructure:
- ``argo.svcmot.com``: Jetty 12.0.16 with ``/cloud-service-1.0`` WAR
  (directory listing shows ``WEB-INF/`` from Oct 2025, 32 bytes).
  ``/ws`` endpoint accepts ``POST, GET, PUT, DELETE`` with CORS ``*``
  and ``Authorization`` header but returns 403/404 for all content types.
- ``api-sg.svcmot.com``: Jetty 12.0.16, ``/cloud-service-1.0/`` paths
  return ``URI_FORMAT_STRING_ERROR``.  Same ``NO_MATCHING_SERVICE`` as
  ``api.svcmot.cn``.
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

    # ── GAE Cloud Endpoints ─────────────────────────────────────────

    def discovery_url(self) -> str:
        """GAE API discovery listing (``contentcheck``, ``adminEndpointAccess``)."""
        return f"{self.base_url}/_ah/api/discovery/v1/apis"

    def emailauth_check_url(
        self,
        guid: str,
        nonce: str,
        time_val: str,
        context: str = "ota",
    ) -> str:
        """Build the ``emailauth/check`` Cloud Endpoint URL.

        Requires ``Authorization: Bearer <google_oauth_token>`` with
        ``userinfo.email`` scope.
        """
        return (
            f"{self.base_url}/_ah/api/contentcheck/v2/emailauth/check"
            f"?context={context}&contextkey={guid}"
            f"&nonce={nonce}&time={time_val}"
        )

    def proxyauth_check_url(
        self,
        guid: str,
        nonce: str,
        time_val: str,
        context: str = "ota",
    ) -> str:
        """Build the ``proxyauth/check`` Cloud Endpoint URL.

        Must originate from a trusted GAE peer app (not from
        ``moto-cds`` itself — returns 403 otherwise).
        """
        return (
            f"{self.base_url}/_ah/api/contentcheck/v2/proxyauth/check"
            f"?context={context}&contextkey={guid}"
            f"&nonce={nonce}&time={time_val}"
        )

    def admin_proxy_url(self) -> str:
        """Build the ``adminEndpointAccess`` proxy URL.

        POST with JSON body ``{method, uri, bodyJson, headersJson}``.
        Requires OAuth2 ``userinfo.email`` scope.
        """
        return (
            f"{self.base_url}/_ah/api/adminEndpointAccess/v2/request/post"
        )


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
            "S3+CloudFront (us-east-1).  DNS chain: ota-cdn.lenovo.com → "
            "skycdn.com.cn → cdn-ota-us.lenovo.com → CloudFront.  "
            "/firmware/ is a real S3 directory object (200, 0 bytes).  "
            "Files at /firmware/{id}.zip are public A/B OTA ZIPs "
            "(payload.bin + metadata.pb).  Supports HTTP 206 Range + "
            "Accept-Ranges: bytes.  POST blocked.  S3 listing blocked.  "
            "ID format: {YYYY}{MDD}{HHMMSS}0-{suffix}.zip (sparse, "
            "unpredictable).  S3 bucket: lenovo-ota (us-west-1).  "
            "/soap/ returns 200/0-bytes (S3 empty-key wildcard)."
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
            "S3+CloudFront (us-east-1) — full factory firmware ZIPs for "
            "Lenovo Rescue / Smart Assistant.  Bucket fully locked down "
            "(April 2026): all files return 403 AccessDenied even with "
            "known filenames.  Requires AWS SigV4 presigned URLs from "
            "the LSA API (lsa.lenovo.com).  S3 bucket name: "
            "moto-rsd-prod-secure (us-east-1).  /soap/ returns "
            "200/0-bytes (S3 empty-key wildcard)."
        ),
        path_prefix="/",
    ),
    "lolinet-mirror": CdnHost(
        host="mirrors.lolinet.com",
        label="Lolinet Firmware Mirror",
        description=(
            "h5ai v0.30.0 directory listing.  60 Motorola device "
            "codenames across 2024 (31), 2025 (27), 2026 (2).  "
            "Firmware naming: fastboot_{codename}_user_{android}_"
            "{version}_{hash}_release-keys.zip.  API: POST to "
            "/_h5ai/public/index.php with JSON {action:'get', "
            "items:{href:'/path/', what:1}}."
        ),
        path_prefix="/firmware/lenomola/",
    ),
}

# ── Lenovo ROW OTA server (com.lenovo.ota APK) ──────────────────────
#
# Extracted from smali analysis of com.lenovo.ota (April 2026):
#
# Endpoints:
#   1. https://ota.lenovo.com/ota-server/firmware/query/for-text-desc
#      POST application/x-www-form-urlencoded
#      Params: action=querynewfirmware, devicemodel, deviceid,
#              curfirmwarever, locale, nationcode, pid, ChecksumType
#      Response: XML <firmwareupdate> with <firmware> children
#        <name>, <object_to_name>, <downloadurl>, <md5>, <sha256>,
#        <size>, <level>, <needbackup>, <desc_en>, <desc_cn>, ...
#
#   2. https://ota.lenovo.com/ota-server/firmware/config/query
#      POST: action=queryconfig + same params
#      Response: JSON with download_mode, update_mode, query_frequency,
#                fuse_precept, event_report_upload, etc.
#
#   3. https://fus.lenovomm.com/firmware/3.1/updateservlet
#      POST: action=queryoptionalparameter|reportsubmit
#      (Times out from datacenter IPs as of April 2026)
#
# No authentication required.  No custom headers.  Default
# Content-Type: application/x-www-form-urlencoded.
#
# Server: AWS ELB (us-east-1).  DNS: ota.lenovo.com → skycdn.com.cn
# → uds-production-alb.us-east-1.elb.amazonaws.com.
#
# Device identity (from ro.* system properties):
#   - devicemodel ← ro.product.ota.model (fallback: Build.MODEL)
#   - deviceid ← ro.odm.lenovo.gsn → lenovosn2 → serial → MAC → UUID
#   - carrier/image code ← ro.odm.lenovo.easyimage.code
#   - region ← ro.odm.lenovo.region (ROW/PRC)
#   - platform ← ro.odm.lenovo.platform (MTK/QUALCOMM)
#
# Valid models (confirmed April 2026): TB320FC, TB-X606F, TB-X606X,
# TB-X705F, TB-X705L, TB-X306F, TB-J706F, TB-J606F, TB-J606L,
# TB-8504X, TB-8705F, TB-8705N.  All currently at latest version.
#
# Download URLs returned in <downloadurl> are complete — no signing
# or construction needed.  Files are on ota-cdn.lenovo.com/firmware/
# and support HTTP 206 Range.

LENOVO_OTA_QUERY_URL = (
    "https://ota.lenovo.com/ota-server/firmware/query/for-text-desc"
)
LENOVO_OTA_CONFIG_URL = (
    "https://ota.lenovo.com/ota-server/firmware/config/query"
)
LENOVO_FUS_URL = "https://fus.lenovomm.com/firmware/3.1/updateservlet"

DEFAULT_SERVER = ServerEnv.PRODUCTION_PRC
