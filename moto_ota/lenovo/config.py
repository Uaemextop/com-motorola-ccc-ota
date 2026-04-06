"""LSA endpoint URLs and constants extracted from HAR analysis.

The LSA desktop client (``Lenovo Smart Assistant``) talks to
``lsa.lenovo.com`` over a simple JSON-over-HTTP protocol.  The login
is delegated to ``passport.lenovo.com`` which, upon success, redirects
back to ``lsa.lenovo.com/Tips/lenovoIdSuccess.html?lenovoid.wust=<TOKEN>``.

The WUST token is then POSTed to ``/Interface/user/lenovoIdLogin.jhtml``
which returns the first rotating Bearer token as a response header.
"""

from __future__ import annotations

# ── Base URL ─────────────────────────────────────────────────────────

LSA_BASE = "https://lsa.lenovo.com"

# ── Auth ─────────────────────────────────────────────────────────────

LOGIN_URL = f"{LSA_BASE}/Interface/user/lenovoIdLogin.jhtml"
"""Exchange a WUST token for a rotating Bearer token."""

# ── Rescue / Firmware ────────────────────────────────────────────────

GET_MODEL_NAMES_URL = f"{LSA_BASE}/Interface/rescueDevice/getModelNames.jhtml"
"""List models available for firmware download (requires auth)."""

GET_RESOURCE_URL = f"{LSA_BASE}/Interface/rescueDevice/getResource.jhtml"
"""Get firmware resources (ROM, tool, flashFlow) for a specific model (requires auth)."""

MODEL_READ_CONFIG_URL = f"{LSA_BASE}/Interface/rescueDevice/modelReadConfigration.jhtml"
"""Read rescue-device configuration (no auth required)."""

# ── Misc (no auth) ───────────────────────────────────────────────────

GET_API_INFO_URL = f"{LSA_BASE}/Interface/dictionary/getApiInfo.jhtml"
"""Get API dictionary info (e.g. login/token URLs). No auth required."""

GET_BROADCAST_URL = f"{LSA_BASE}/Interface/notice/getBroadcast.jhtml"
"""Get broadcast notices. No auth required."""

GET_NEXT_UPDATE_URL = f"{LSA_BASE}/Interface/client/getNextUpdateClient.jhtml"
"""Check for client updates. No auth required."""

# ── Passport ─────────────────────────────────────────────────────────

PASSPORT_LOGIN_URL = (
    "https://passport.lenovo.com/glbwebauthnv6/preLogin"
    "?lenovoid.action=uilogin"
    "&lenovoid.realm=lmsaclient"
    "&lenovoid.cb=https://lsa.lenovo.com/Tips/lenovoIdSuccess.html"
)
"""Legacy URL the LSA desktop client opens in a browser for interactive login."""

PASSPORT_OAUTH2_URL = (
    "https://passport-glb.lenovo.com/v1.0/utility/lenovoid/oauth2/authorize"
)
"""Current OAuth2/PKCE login endpoint returned by the LSA API (getApiInfo)."""

# ── Default request envelope ─────────────────────────────────────────

CLIENT_VERSION = "7.5.4.2"
"""LSA desktop client version mimicked by this module."""

WINDOWS_INFO = "Microsoft Windows 11 Pro, x64-based PC"
"""OS info sent in the request envelope."""

DEFAULT_LANGUAGE = "en-US"
"""Language code for API requests."""

USER_AGENT = (
    "Mozilla/5.0 (Windows NT 6.3; WOW64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/51.0.2704.79 Safari/537.36"
)
"""User-Agent header used by the LSA desktop client."""
