# LSA Token Analysis & Full Firmware Discovery

## Date: April 12, 2026 (Updated with fresh cookies session)

---

## 1. LSA Token Analysis

### Token: `ceb89ffb33d747d398d791e454162406`

| Test | Result |
|------|--------|
| Format | 32-char hex string (128-bit) |
| Auth method | `Authorization: Bearer {token}` |
| Server response | `{"code":"408","desc":"This token has no permissions."}` |
| Token validity | **VALID** (408 ≠ 403) |
| Permission level | Guest/unprivileged |
| With Akamai cookies | Same 408 result (cookies don't affect auth) |
| With Guid header | Same 408 (Guid is informational, not auth) |
| With clientUUID | Same 408 (clientUUID is informational) |
| With LMSA User-Agent | Same 408 (UA doesn't affect auth level) |

### Additional Headers Tested (from user session)

| Header | Value | Effect |
|--------|-------|--------|
| `Guid` | `c86f4c7e-3267-4c2f-af19-94c362e38926` | No effect on auth |
| `clientUUID` | `69cbc392-1037-47dc-b1e0-c3792019ad2c` | No effect on auth |
| `_abck` cookie | Akamai bot management | Passes bot check but doesn't upgrade token |
| `ak_bmsc` cookie | Akamai session | Same as above |

### LSA Error Codes Discovered

| Code | Description | Meaning |
|------|-------------|---------|
| `403` | "Invalid token." | Token not recognized / expired / missing |
| `408` | "This token has no permissions." | Token valid but insufficient permissions |
| `1000` | "softwareFix://callback?error=..." | OAuth2 flow error |
| `500` | Internal Server Error | Login broken from datacenter IPs |

### Key Finding: Catch-All Middleware

LSA uses a **catch-all middleware** that intercepts ALL `/Interface/**/*.jhtml` requests. ANY path under `/Interface/` with ANY prefix returns 408 with a valid token. This means:
- `rescue/`, `flash/`, `firmware/`, `device/`, `user/`, `common/` are all handled by the same filter
- 252+ endpoint patterns tested — ALL return identical 408
- The server validates the Bearer token BEFORE routing to any specific endpoint
- The token needs to be upgraded via OAuth2 PKCE flow (requires browser-based Lenovo account login)

### Auth Upgrade Attempts (All Failed)

| Method | Endpoint | Result |
|--------|----------|--------|
| Login with wust | `/Interface/user/lenovoIdLogin.jhtml` | 500 (server error from datacenter IPs) |
| Login with token as wust | Same | 500 |
| Login with LPSUST param | Same | 500 |
| refreshToken | `/Interface/user/refreshToken.jhtml` | 408 (needs auth first) |
| OAuth2 callback | `/Interface/user/oauth2/callback.jhtml` | 1000 "state not found" |
| Passport LPSUST check | `passport.lenovo.com/interserver/wauthen4/` | 404 |
| Passport-glb userinfo | `passport-glb.lenovo.com/wauthen5/userinfo` | 404 |
| Guid as Bearer | `Authorization: Bearer {guid}` | 403 (not recognized) |
| Guid as plain auth | `Authorization: {guid}` | 403 |

### Server Infrastructure

| Property | Value |
|----------|-------|
| Server | Apache Tomcat/11.0.12 |
| IPs | 35.153.115.51, 3.225.10.53 (AWS us-east-1) |
| TLS | TLSv1.2, ECDHE-RSA-AES128-GCM-SHA256 |
| Certificate | `*.lenovo.com` (DigiCert, expires 2027-03-01) |
| Root page | Default Tomcat welcome page |
| Bot protection | Akamai (requires _abck + ak_bmsc cookies) |
| Manager/Host Manager | Present but require Tomcat auth |
| Actuator/Swagger | Not exposed (404) |

### All Tested Endpoints (ALL return 408 with this token)

**Rescue:** `/Interface/rescue/{list,query,search,getAll,getList,getByModel,getByProduct,download,info,detail,get}.jhtml`

**RescueDevice:** `/Interface/rescueDevice/{getResourceByImei,getResourceBySN,getResourceByModel,getAllResource,getResourceList,list,query,...}.jhtml`

**Flash:** `/Interface/flash/{getNewResourceByImei,getNewResourceBySN,getNewResourceByModel,getAllResource,getResourceList,list,query,...}.jhtml`

**Firmware:** `/Interface/firmware/{download,getResource,getResourceByModel,query,list,search,getAll,...}.jhtml`

**Device:** `/Interface/device/{getDeviceInfo,getDeviceList,query,list,search,getAll,...}.jhtml`

**User:** `/Interface/user/{getUserInfo,getApiInfo,logout,refreshToken,upgradeToken,getToken}.jhtml`

**Download/Product/Model/OTA/Update/Resource/File/Image/ROM:** All return 408.

### Auth Methods Tested

| Method | Result |
|--------|--------|
| `Authorization: Bearer {token}` | 408 (valid, no perms) |
| `X-Auth-Token: {token}` | 403 (not recognized) |
| `Cookie: token={token}` | 403 |
| `Cookie: lpsust={token}` | 403 |
| `lpsust: {token}` (header) | 403 |
| Token in query string | 403 |
| Token in request body | 403 |
| Token as wust in login body | 500 (server error) |

### Token Upgrade Attempts

| Attempt | Result |
|---------|--------|
| `/Interface/user/refreshToken.jhtml` | 408 |
| `/Interface/user/upgradeToken.jhtml` | 408 |
| `/Interface/user/getToken.jhtml` | 408 |
| OAuth2 callback GET with code= | `{"code":"1000","desc":"softwareFix://callback?error=oauth2 state not found."}` |
| OAuth2 callback POST | 405 (GET only) |
| Login with JSON body | 500 |
| Login with form body | 415 |

### Key Finding: Token Permission Hierarchy

```
No token / bad token → 403 "Invalid token"
Guest token (e.g., from lenovoIdLogin) → 408 "This token has no permissions"
Authenticated token (from OAuth2 flow) → actual data (presigned URLs)
```

**The OAuth2 flow requires:**
1. Browser-based login at `passport.lenovo.com/wauthen5/preLogin`
2. Lenovo account credentials
3. OAuth2 PKCE code exchange at `/Interface/user/oauth2/callback.jhtml` (GET)
4. Client ID: `127cbff4e99dd5579db0627769509be972a3f38ad0dd11f2f2a7947516c923f0`

---

## 2. FULL FIRMWARE DISCOVERY: Lolinet Mirror

### 🎉 BREAKTHROUGH: Complete Firmware Without GUID

**Base URL:** `https://mirrors.lolinet.com/firmware/lenomola/`

This mirror has **FULL fastboot firmware** (not delta OTAs) for dozens of Motorola devices, organized by year/device/type/carrier. **NO authentication required.**

### Structure
```
/firmware/lenomola/
├── 2024/
│   ├── lamu/           ← Moto G05
│   │   ├── flashtool/  ← Flash Tool Console
│   │   └── official/   ← Per-carrier firmware
│   │       ├── RETGB/
│   │       ├── RETEU/
│   │       ├── RETBR/
│   │       └── ... (13 carriers)
│   ├── lamulg/         ← Moto G05 Lite Go
│   └── ... (30+ devices)
├── 2025/
│   ├── lamul/          ← Moto G05 (2025 revision)
│   ├── leap/, mona/, vegas/, nice/, scout/, cybert/...
│   └── ... (28+ devices)
├── 2026/
│   ├── mumba_retcn/    ← Moto G100s (China)
│   └── vegas26/
└── _obsoleted_/
```

### Moto G05 (lamu) Available Firmware

#### Carriers (13 total)
OPENCL, OPENLA, OPENMX, OPENPE, RETAIL, RETAPAC, RETAPAC_NP, RETBR, RETEU, RETGB, RETIN, RETJP, TELEU

#### Versions Available per Carrier

| Carrier | v71 | v114 | v124 | v137 |
|---------|-----|------|------|------|
| RETGB | | ✅ | ✅ | ✅ |
| RETEU | | ✅ | ✅ | ✅ |
| RETBR | | ✅ | ✅ | ✅ |
| RETAIL | | ✅ | ✅ | ✅ |
| TELEU | | ✅ | ✅ | ✅ |
| OPENCL | | | ✅ | ✅ |
| OPENLA | | | ✅ | ✅ |
| OPENMX | | | ✅ | ✅ |
| OPENPE | | | ✅ | ✅ |
| RETAPAC | | | ✅ | ✅ |
| RETIN | | | ✅ | ✅ |
| RETJP | | | ✅ | ✅ |
| RETAPAC_NP | ✅ | | | |

#### Download URLs (Full Fastboot Firmware)

**Latest (v137, 5.4 GB):**
```
https://mirrors.lolinet.com/firmware/lenomola/2024/lamu/official/RETGB/fastboot_lamu_g_user_15_VVTA35.51-137_7eabca_release-keys.zip
```

**v124:**
```
https://mirrors.lolinet.com/firmware/lenomola/2024/lamu/official/RETGB/fastboot_lamu_g_user_15_VVTA35.51-124_777ecb_release-keys.zip
```

**v114:**
```
https://mirrors.lolinet.com/firmware/lenomola/2024/lamu/official/RETGB/fastboot_lamu_g_user_15_VVTA35.51-114_8a4eec_release-keys.zip
```

**Flash Tool:**
```
https://mirrors.lolinet.com/firmware/lenomola/2024/lamu/flashtool/Lamu_Flash_Tool_Console_AfterSale_exe_5.2404.01.000_2.zip
```

### Moto G05 Lite Go (lamulg) Firmware

| Carrier | Files |
|---------|-------|
| RETGB | v36, v41, v36-2 |
| RETEU | v36, v41, v36-2 |
| RETAIL | v36, v41, v36-2 |
| RETAPAC | v36, v41, v36-2 |
| TELEU | v36, v41, v36-2 |

**Flash Tool:**
```
https://mirrors.lolinet.com/firmware/lenomola/2024/lamulg/flashtool/LamuLiteGo_FlashTool_Console_5.2404.01_3.zip
```

### Mumba (Moto G100s China) Firmware

```
https://mirrors.lolinet.com/firmware/lenomola/2026/mumba_retcn/official/RETCN/XT2537-4_MUMBA_RETCN_16_W1WAA36.48-23-2_subsidy-DEFAULT_regulatory-DEFAULT_CFC.xml.zip
```
- **Size:** 9.8 GB
- **Build:** W1WAA36.48-23-2
- **Format:** CFC XML + ZIP (flash-ready)

### File Verification

| File | Size | Content-Type | Range Support |
|------|------|-------------|---------------|
| lamu v137 RETGB | 5,848,714,538 (5.4 GB) | application/zip | ✅ Accept-Ranges: bytes |
| mumba RETCN | 9,828,220,192 (9.2 GB) | application/zip | ✅ Accept-Ranges: bytes |
| lamu flash tool | 37,009,912 (35 MB) | application/zip | ✅ Accept-Ranges: bytes |

---

## 3. Firmware Naming Convention

```
fastboot_{device}_{buildType}_{androidVer}_{buildId}_{hash}_{keys}.zip
```

- `fastboot_lamu_g_user_15_VVTA35.51-137_7eabca_release-keys.zip`
  - Device: `lamu_g` (Moto G05)
  - Build type: `user` (production)
  - Android: 15
  - Build: VVTA35.51-137
  - Hash: 7eabca
  - Keys: release-keys

**Note:** Only `user` builds with `release-keys` are available. No `eng` or `userdebug` builds on the mirror (these require internal Motorola access).

---

## 4. Summary: How to Download Without GUID

### Method 1: Lolinet Mirror (RECOMMENDED - Full Fastboot Firmware)
```bash
# No auth needed, supports resume
wget -c "https://mirrors.lolinet.com/firmware/lenomola/2024/lamu/official/RETGB/fastboot_lamu_g_user_15_VVTA35.51-137_7eabca_release-keys.zip"
```

### Method 2: CDS Chain Walk (Delta OTAs Only - Requires Known GUID)
```bash
# Needs GUID + User-Agent
curl -H "User-Agent: com.motorola.ccc.ota/3.0" \
  "https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/default/key/{GUID}" \
  -d '{"deviceInfo":{"fingerprint":"..."}}'
```

### Method 3: EDGECAST Direct (Some Delta OTAs - No Auth)
```bash
# Some packages accessible by packageID without auth
curl "https://edgecast-verizon-url/{packageId}"
```

### Comparison

| Method | Auth | Content Type | Size | Completeness |
|--------|------|-------------|------|-------------|
| Lolinet | None | Full fastboot | 5-10 GB | 100% complete |
| CDS | UA only | Delta OTA | 100-900 MB | Incremental only |
| EDGECAST | None* | Delta OTA | 100-900 MB | Some packages only |
| LSA → rsddownload | Full OAuth2 | Full fastboot | 5-10 GB | 100% complete |
| ota-cdn.lenovo.com | None (need filename) | Full OTA | 4-5 GB | Complete but Lenovo only |

**Winner: Lolinet mirror** - No GUID needed, no auth, full firmware, resumable downloads.

---

## 5. Eng/Debug/Test Firmware Search Results

### ❌ No eng/userdebug/test-keys Builds Found Anywhere

Exhaustive search across ALL available sources:

| Source | Build Types Available | eng/debug? |
|--------|---------------------|------------|
| Lolinet mirror (ALL 13 carriers) | `user` + `release-keys` only | ❌ |
| Lolinet lamulg (5 carriers) | `user` + `release-keys` only | ❌ |
| Lolinet lamul 2025 (3 carriers) | `user` + `release-keys` only | ❌ |
| CDS delta OTAs | `user` builds only | ❌ |
| ota-cdn.lenovo.com | 403 for eng-pattern filenames | ❌ |
| rsddownload-secure.lenovo.com | 403 for ALL files (locked S3) | ❌ |

### Why eng/debug Builds Are Unavailable

1. **Motorola does not publish eng/userdebug builds externally** — these are internal-only builds used by Motorola engineers for development and testing
2. **LSA (Lenovo Smart Assistant) is the ONLY potential source** for non-user builds, but requires an authenticated Lenovo account with device flash permissions
3. **The provided Bearer token (`ceb89ff...`) returns 408 "no permissions"** on ALL LSA endpoints — it's recognized but lacks the authorization level needed to access flash/rescue resources
4. **Upgrading the token requires completing the OAuth2 PKCE flow** through a browser-based Lenovo account login, which cannot be done from a datacenter IP (login returns 500)

### Firmware Naming Pattern Analysis

All publicly available Moto G05 (lamu) firmware follows this pattern:
```
fastboot_lamu_g_user_15_VVTA35.51-{version}_{hash}_release-keys.zip
                 ^^^^                                ^^^^^^^^^^^^^
                 Always "user"                       Always "release-keys"
```

If eng builds existed, they would be named:
```
fastboot_lamu_g_eng_15_VVTA35.51-{version}_{hash}_test-keys.zip
fastboot_lamu_g_userdebug_15_VVTA35.51-{version}_{hash}_dev-keys.zip
```

### What Would Be Needed to Get eng Firmware

1. **A fully authenticated LSA token** (not the current guest-level one)
   - Requires: Lenovo account → OAuth2 PKCE login → JWT with flash permissions
   - The OAuth2 flow: `passport.lenovo.com/wauthen5/preLogin` → login → callback with code+state
   - Client ID: `127cbff4e99dd5579db0627769509be972a3f38ad0dd11f2f2a7947516c923f0`

2. **Then query LSA endpoints** with the authenticated token:
   ```bash
   curl -H "Authorization: Bearer {AUTHENTICATED_JWT}" \
     -H "Content-Type: application/json" \
     -d '{"model":"lamu_g","buildType":"eng"}' \
     "https://lsa.lenovo.com/Interface/flash/getNewResourceByModel.jhtml"
   ```

3. **OR** have access to Motorola's internal build server (not publicly accessible)

---

## 6. Complete Moto G05 Firmware Catalog (All Known Sources)

### lamu (Moto G05) — Lolinet 2024

| Carrier | v71 | v114 | v124 | v137 (latest) |
|---------|-----|------|------|------|
| RETGB (UK) | | ✅ | ✅ | ✅ |
| RETEU (Europe) | | ✅ | ✅ | ✅ |
| RETBR (Brazil) | | ✅ | ✅ | ✅ |
| RETAIL (Generic) | | ✅ | ✅ | ✅ |
| TELEU (EU Telcos) | | ✅ | ✅ | ✅ |
| OPENCL (Chile) | | | ✅ | ✅ |
| OPENLA (LatAm) | | | ✅ | ✅ |
| OPENMX (Mexico) | | | ✅ | ✅ |
| OPENPE (Peru) | | | ✅ | ✅ |
| RETAPAC (Asia-Pacific) | | | ✅ | ✅ |
| RETIN (India) | | | ✅ | ✅ |
| RETJP (Japan) | | | ✅ | ✅ |
| RETAPAC_NP (Nepal) | ✅ | | | |

### lamulg (Moto G05 Lite Go) — Lolinet 2024

| Carrier | v36 | v36-2 | v41 |
|---------|-----|-------|-----|
| RETGB | ✅ | ✅ | ✅ |
| RETEU | ✅ | ✅ | ✅ |
| RETAIL | ✅ | ✅ | ✅ |
| RETAPAC | ✅ | ✅ | ✅ |
| TELEU | ✅ | ✅ | ✅ |

### lamul (Moto G05 2025) — Lolinet 2025

| Carrier | v137 |
|---------|------|
| RETAIL | ✅ |
| RETBR | ✅ |
| RETEU | ✅ |

### Flash Tools

| Tool | URL |
|------|-----|
| Lamu Flash Tool | `mirrors.lolinet.com/firmware/lenomola/2024/lamu/flashtool/Lamu_Flash_Tool_Console_AfterSale_exe_5.2404.01.000_2.zip` |
| LamuLiteGo Flash Tool | `mirrors.lolinet.com/firmware/lenomola/2024/lamulg/flashtool/LamuLiteGo_FlashTool_Console_5.2404.01_3.zip` |
