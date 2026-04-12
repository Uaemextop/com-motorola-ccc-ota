# LSA Token Analysis & Full Firmware Discovery

## Date: April 12, 2026

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

### LSA Error Codes Discovered

| Code | Description | Meaning |
|------|-------------|---------|
| `403` | "Invalid token." | Token not recognized / expired / missing |
| `408` | "This token has no permissions." | Token valid but insufficient permissions |
| `1000` | "softwareFix://callback?error=..." | OAuth2 flow error |
| `500` | Internal Server Error | Login broken from datacenter IPs |

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
