"""LSA endpoint URLs and constants — comprehensive map from deep API probing.

Infrastructure
--------------
- Server: Apache Tomcat/11.0.12 behind AWS ELB (us-east-1)
- DNS: lmsa-web-prd-30521416.us-east-1.elb.amazonaws.com
- TLS: TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256, cert *.lenovo.com (DigiCert)
- Passport: passport.lenovo.com (Akamai edge), passport-glb.lenovo.com (Akamai edge)
- Firmware CDN: rsddownload-secure.lenovo.com (CloudFront → S3 us-east-1)

Authentication flow (OAuth2/PKCE)
---------------------------------
1. ``POST /Interface/dictionary/getApiInfo.jhtml {key: "TIP_URL"}``
   → Returns OAuth2 authorize URL with state, client_id, code_challenge (S256)
2. User visits ``https://passport-glb.lenovo.com/v1.0/utility/lenovoid/oauth2/authorize?...``
   → Passport login → redirects to ``/Tips/lenovoIdSuccess.html?code=X&scope=openid&state=X``
3. Callback page JS calls ``GET /Tips/lmsa/tips/getOauth2Url.jhtml``
   → Returns ``{"msg": "https://lsa.lenovo.com/Interface/user/oauth2/callback.jhtml"}``
4. JS calls ``GET /Interface/user/oauth2/callback.jhtml?code=X&scope=openid&state=X``
   → Exchanges OAuth2 code → Returns ``softwareFix://authcallback?wust=<WUST>``
   → Launches LSA desktop client via custom protocol
5. LSA client ``POST /Interface/user/lenovoIdLogin.jhtml {wust, guid}``
   → Returns rotating Bearer token in ``Authorization`` response header

Legacy flow (WUST cookies)
--------------------------
- The old ``passport.lenovo.com/glbwebauthnv6/preLogin`` flow is still supported.
- LPSWUST cookie from browser session can be used directly as WUST.

IP restriction
--------------
- Login (``lenovoIdLogin``) accepts **any** WUST value and returns a Bearer token.
- However, tokens generated from datacenter IPs (AWS, Azure, etc.) are
  **rejected** with ``403 Invalid token`` on all subsequent API calls.
- The ``vip/card`` GET endpoint is the only exception — it responds regardless.
"""

from __future__ import annotations

# ── Base URL ─────────────────────────────────────────────────────────

LSA_BASE = "https://lsa.lenovo.com"

# ── Auth ─────────────────────────────────────────────────────────────

LOGIN_URL = f"{LSA_BASE}/Interface/user/lenovoIdLogin.jhtml"
"""Exchange a WUST token for a rotating Bearer token."""

OAUTH2_CALLBACK_URL = f"{LSA_BASE}/Interface/user/oauth2/callback.jhtml"
"""OAuth2 code → WUST exchange (GET only, requires code+scope+state params).

Returns ``softwareFix://callback?wust=<TOKEN>`` on success, or
``softwareFix://callback?error=<MSG>`` on failure.
"""

# ── Unauthenticated endpoints ────────────────────────────────────────

GET_API_INFO_URL = f"{LSA_BASE}/Interface/dictionary/getApiInfo.jhtml"
"""Get API dictionary info. Key ``TIP_URL`` returns the OAuth2 authorize URL.
No auth required."""

GET_BROADCAST_URL = f"{LSA_BASE}/Interface/notice/getBroadcast.jhtml"
"""Get broadcast notices. No auth required."""

GET_NEXT_UPDATE_URL = f"{LSA_BASE}/Interface/client/getNextUpdateClient.jhtml"
"""Check for client updates. No auth required."""

MODEL_READ_CONFIG_URL = f"{LSA_BASE}/Interface/rescueDevice/modelReadConfigration.jhtml"
"""Read rescue-device configuration. No auth required."""

GET_FEEDBACK_ISSUE_INFO_URL = f"{LSA_BASE}/Interface/feedback/getFeedbackIssueInfo.jhtml"
"""Get feedback issue tree. No auth required."""

GET_OAUTH2_URL = f"{LSA_BASE}/Tips/lmsa/tips/getOauth2Url.jhtml"
"""Get the OAuth2 callback URL. No auth required. Returns
``{"msg": "https://lsa.lenovo.com/Interface/user/oauth2/callback.jhtml"}``."""

MULTILINGUAL_URL = f"{LSA_BASE}/Tips/lmsa/multilingual/lenovoIdSuccess.jhtml"
"""Get multilingual translations for the callback page. No auth required.
Returns 18 languages with translations."""

APK_DOWNLOAD_URL = f"{LSA_BASE}/Interface/apk/download.jhtml"
"""APK download endpoint. No auth required but currently returns 'APK not exist'."""

# ── Rescue / Firmware (require auth) ─────────────────────────────────

GET_MODEL_NAMES_URL = f"{LSA_BASE}/Interface/rescueDevice/getModelNames.jhtml"
"""List models available for firmware download. Requires auth.
Params: ``{country, category}``."""

GET_RESOURCE_URL = f"{LSA_BASE}/Interface/rescueDevice/getResource.jhtml"
"""Get firmware resources (ROM, tool, flashFlow) for a specific model.
Requires auth. Step-by-step: modelName → simCount → country → final."""

GET_COUNTRY_LIST_URL = f"{LSA_BASE}/Interface/rescueDevice/getCountryList.jhtml"
"""List available countries. Requires auth."""

GET_CATEGORY_LIST_URL = f"{LSA_BASE}/Interface/rescueDevice/getCategoryList.jhtml"
"""List device categories. Requires auth."""

GET_CARRIER_LIST_URL = f"{LSA_BASE}/Interface/rescueDevice/getCarrierList.jhtml"
"""List carriers. Requires auth."""

GET_DEVICE_INFO_URL = f"{LSA_BASE}/Interface/rescueDevice/getDeviceInfo.jhtml"
"""Get device info. Requires auth."""

GET_FLASH_FLOW_URL = f"{LSA_BASE}/Interface/rescueDevice/getFlashFlow.jhtml"
"""Get flash flow definition. Requires auth."""

GET_ROM_LIST_URL = f"{LSA_BASE}/Interface/rescueDevice/getRomList.jhtml"
"""Get ROM list. Requires auth."""

GET_TOOL_LIST_URL = f"{LSA_BASE}/Interface/rescueDevice/getToolList.jhtml"
"""Get flash tool list. Requires auth."""

GET_DOWNLOAD_URL = f"{LSA_BASE}/Interface/rescueDevice/getDownloadUrl.jhtml"
"""Get download URL. Requires auth."""

GET_MODEL_INFO_URL = f"{LSA_BASE}/Interface/rescueDevice/getModelInfo.jhtml"
"""Get model info. Requires auth."""

ADD_LOG_URL = f"{LSA_BASE}/Interface/rescueDevice/addLog.jhtml"
"""Submit rescue operation log. Requires auth."""

REPORT_RESULT_URL = f"{LSA_BASE}/Interface/rescueDevice/reportResult.jhtml"
"""Report rescue result. Requires auth."""

# ── User (require auth) ──────────────────────────────────────────────

LOGOUT_URL = f"{LSA_BASE}/Interface/user/logout.jhtml"
GET_USER_INFO_URL = f"{LSA_BASE}/Interface/user/getUserInfo.jhtml"
GET_LOGIN_STATUS_URL = f"{LSA_BASE}/Interface/user/getLoginStatus.jhtml"
REFRESH_TOKEN_URL = f"{LSA_BASE}/Interface/user/refreshToken.jhtml"
OAUTH_LOGIN_URL = f"{LSA_BASE}/Interface/user/oauthLogin.jhtml"
TOKEN_LOGIN_URL = f"{LSA_BASE}/Interface/user/tokenLogin.jhtml"

# ── VIP (partially accessible) ───────────────────────────────────────

VIP_CARD_URL = f"{LSA_BASE}/Interface/vip/card.jhtml"
"""VIP card info. GET works without proper auth (returns geo-gated response).
POST returns 405. Returns ``code=0003`` 'No open permission - <country>'."""

VIP_INFO_URL = f"{LSA_BASE}/Interface/vip/getVipInfo.jhtml"
VIP_PRIVILEGES_URL = f"{LSA_BASE}/Interface/vip/getPrivileges.jhtml"

# ── Other authenticated endpoints ────────────────────────────────────

LANGUAGE_PACK_URL = f"{LSA_BASE}/Interface/client/languagePack.jhtml"
CLIENT_INFO_URL = f"{LSA_BASE}/Interface/client/getClientInfo.jhtml"
VERSION_INFO_URL = f"{LSA_BASE}/Interface/client/getVersionInfo.jhtml"

NOTICE_INFO_URL = f"{LSA_BASE}/Interface/notice/getNoticeInfo.jhtml"
NOTICE_LIST_URL = f"{LSA_BASE}/Interface/notice/getNoticeList.jhtml"
NOTIFICATION_URL = f"{LSA_BASE}/Interface/notice/getNotification.jhtml"

DICTIONARY_URL = f"{LSA_BASE}/Interface/dictionary/getDictionary.jhtml"
CONFIG_URL = f"{LSA_BASE}/Interface/dictionary/getConfig.jhtml"
DICT_VERSION_URL = f"{LSA_BASE}/Interface/dictionary/getVersion.jhtml"

PRIV_INFO_URL = f"{LSA_BASE}/Interface/priv/getPrivInfo.jhtml"
PRIVACY_POLICY_URL = f"{LSA_BASE}/Interface/priv/getPrivacyPolicy.jhtml"

ADD_MODELS_URL = f"{LSA_BASE}/Interface/registeredModel/addModels.jhtml"
GET_MODELS_URL = f"{LSA_BASE}/Interface/registeredModel/getModels.jhtml"

ADD_BEHAVIOR_URL = f"{LSA_BASE}/Interface/dataCollection/addUserBehavior.jhtml"
DATA_REPORT_URL = f"{LSA_BASE}/Interface/dataCollection/report.jhtml"

SURVEY_TRIGGER_URL = f"{LSA_BASE}/Interface/survey/getIsNeedTriggerSurvey.jhtml"
SUBMIT_SURVEY_URL = f"{LSA_BASE}/Interface/survey/submitSurvey.jhtml"

FEEDBACK_LIST_URL = f"{LSA_BASE}/Interface/feedback/getFeedbackList.jhtml"
ADD_FEEDBACK_URL = f"{LSA_BASE}/Interface/feedback/addFeedback.jhtml"
SUBMIT_FEEDBACK_URL = f"{LSA_BASE}/Interface/feedback/submitFeedback.jhtml"

DIAGNOSTIC_MODELS_URL = f"{LSA_BASE}/Interface/diagnostic/getModelList.jhtml"
DIAGNOSTIC_INFO_URL = f"{LSA_BASE}/Interface/diagnostic/getDiagnosticInfo.jhtml"
START_DIAGNOSE_URL = f"{LSA_BASE}/Interface/diagnostic/startDiagnose.jhtml"
DIAGNOSTIC_RESULT_URL = f"{LSA_BASE}/Interface/diagnostic/getResult.jhtml"

SMART_INFO_URL = f"{LSA_BASE}/Interface/smart/getSmartInfo.jhtml"
DRIVER_LIST_URL = f"{LSA_BASE}/Interface/smart/getDriverList.jhtml"
SCAN_DEVICE_URL = f"{LSA_BASE}/Interface/smart/scanDevice.jhtml"
HARDWARE_INFO_URL = f"{LSA_BASE}/Interface/smart/getHardwareInfo.jhtml"

BACKUP_INFO_URL = f"{LSA_BASE}/Interface/backup/getBackupInfo.jhtml"
START_BACKUP_URL = f"{LSA_BASE}/Interface/backup/startBackup.jhtml"
RESTORE_LIST_URL = f"{LSA_BASE}/Interface/backup/getRestoreList.jhtml"

SERVER_TIME_URL = f"{LSA_BASE}/Interface/system/getServerTime.jhtml"
HEALTH_CHECK_URL = f"{LSA_BASE}/Interface/system/healthCheck.jhtml"
SYSTEM_VERSION_URL = f"{LSA_BASE}/Interface/system/getVersion.jhtml"
SYSTEM_STATUS_URL = f"{LSA_BASE}/Interface/system/getStatus.jhtml"

FIRMWARE_LIST_URL = f"{LSA_BASE}/Interface/firmware/getList.jhtml"
FIRMWARE_DOWNLOAD_URL = f"{LSA_BASE}/Interface/firmware/download.jhtml"
DEVICE_INFO_URL = f"{LSA_BASE}/Interface/device/getInfo.jhtml"
DEVICE_REGISTER_URL = f"{LSA_BASE}/Interface/device/register.jhtml"
UPDATE_CHECK_URL = f"{LSA_BASE}/Interface/update/check.jhtml"
UPDATE_LIST_URL = f"{LSA_BASE}/Interface/update/getList.jhtml"

APK_VERSION_URL = f"{LSA_BASE}/Interface/apk/getVersion.jhtml"
APK_LATEST_URL = f"{LSA_BASE}/Interface/apk/getLatest.jhtml"

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

OAUTH2_CLIENT_ID = "127cbff4e99dd5579db0627769509be972a3f38ad0dd11f2f2a7947516c923f0"
"""OAuth2 client_id (fixed, same across all calls)."""

OAUTH2_REDIRECT_URI = "https://lsa.lenovo.com/Tips/lenovoIdSuccess.html"
"""OAuth2 redirect URI."""

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

# ── Endpoint classification ──────────────────────────────────────────

UNAUTHENTICATED_ENDPOINTS = [
    GET_API_INFO_URL,
    GET_BROADCAST_URL,
    GET_NEXT_UPDATE_URL,
    MODEL_READ_CONFIG_URL,
    GET_FEEDBACK_ISSUE_INFO_URL,
    GET_OAUTH2_URL,
    MULTILINGUAL_URL,
    APK_DOWNLOAD_URL,
    VIP_CARD_URL,  # GET only, geo-gated
]
"""Endpoints that respond without authentication."""

TOTAL_ENDPOINTS_DISCOVERED = 75
"""Total Interface endpoints discovered via deep probing (April 2026)."""
