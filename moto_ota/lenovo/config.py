"""Configuration constants for the Lenovo LSA / Passport login flow.

All endpoints, headers and payload templates are derived from the
captured HAR file of the Lenovo Smart Assistant (LMSA v7.5.4.2)
Windows client.
"""

from __future__ import annotations

# ── LSA endpoints ────────────────────────────────────────────────────

LSA_BASE = "https://lsa.lenovo.com"
PASSPORT_BASE = "https://passport.lenovo.com"
DOWNLOAD_BASE = "https://rsddownload-secure.lenovo.com"

# Initial endpoints (no auth required)
API_INFO_URL = f"{LSA_BASE}/Interface/dictionary/getApiInfo.jhtml"
MODEL_CONFIG_URL = f"{LSA_BASE}/Interface/rescueDevice/modelReadConfigration.jhtml"

# Auth endpoints
LENOVO_ID_LOGIN_URL = f"{LSA_BASE}/Interface/user/lenovoIdLogin.jhtml"

# Firmware endpoints (require Bearer token)
GET_MODEL_NAMES_URL = f"{LSA_BASE}/Interface/rescueDevice/getModelNames.jhtml"
GET_RESOURCE_URL = f"{LSA_BASE}/Interface/rescueDevice/getResource.jhtml"

# Passport login flow
PASSPORT_PRE_LOGIN = (
    f"{PASSPORT_BASE}/glbwebauthnv6/preLogin"
    "?lenovoid.action=uilogin"
    "&lenovoid.realm=lmsaclient"
    "&lenovoid.cb={callback}"
    "&lenovoid.lang={{lang}}"
)
PASSPORT_USER_EXISTED = f"{PASSPORT_BASE}/glbwebauthnv6/ajaxUserExistedServlet"
PASSPORT_USER_ROAM = f"{PASSPORT_BASE}/glbwebauthnv6/ajaxUserRoam"
PASSPORT_USER_LOGIN = f"{PASSPORT_BASE}/glbwebauthnv6/userLogin"

LENOVO_ID_SUCCESS_CB = f"{LSA_BASE}/Tips/lenovoIdSuccess.html"

# ── Client identity ─────────────────────────────────────────────────

CLIENT_VERSION = "7.5.4.2"

LSA_USER_AGENT = (
    "Mozilla/5.0 (Windows NT 6.3; WOW64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/51.0.2704.79 Safari/537.36"
)

BROWSER_USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0"
)

WINDOWS_INFO = "Microsoft Windows 11 Pro, x64-based PC"

# ── Default request headers (LSA API calls) ─────────────────────────

LSA_HEADERS: dict[str, str] = {
    "User-Agent": LSA_USER_AGENT,
    "Content-Type": "application/json",
    "Request-Tag": "lmsa",
    "clientVersion": CLIENT_VERSION,
    "Cache-Control": "no-store,no-cache",
    "Pragma": "no-cache",
}

# ── Supported categories / countries ────────────────────────────────

SUPPORTED_CATEGORIES: list[str] = ["Phone"]
DEFAULT_LANGUAGE = "en-US"
