# Motorola CDS Server Probing Results — All Servers

**Date**: April 2026
**OTA APK Version**: v36.00.035 (com.motorola.ccc.ota)

---

## Server Selection Logic (from smali)

```
isDogfoodDevice() = ro.product.is_production == "false"
isProductionDevice() = ro.product.is_production == "true"  
isSecure() = Build.FINGERPRINT contains "release-keys"

Server selection (getMasterCloud):
  China + Production → moto-cds.svcmot.cn
  China + Dogfood   → ota-cn-sdc.blurdev.com  (= moto-cds-staging identity)
  ROW + Production   → moto-cds.appspot.com
  ROW + Dogfood      → moto-cds-staging.appspot.com
```

---

## All 7 CDS Servers — Status

| Server | Label | Status | OTA Content | Version | App ID |
|--------|-------|--------|-------------|---------|--------|
| moto-cds.appspot.com | Production ROW | ✅ 200 | ✅ YES (full chain) | 20260227t153823 | moto-cds |
| moto-cds.svcmot.cn | Production China | ✅ 200 | ✅ YES (full chain) | 20260227t153823 | moto-cds |
| moto-cds-sg.svcmot.com | Singapore | ✅ 200 | ✅ YES (full chain) | 20260227t153823 | moto-cds |
| moto-cds-staging.appspot.com | Staging/Dogfood | ✅ 200 | ❌ No content | 20260219t144007 | moto-cds-staging |
| moto-cds-qa.appspot.com | QA | ✅ 200 | ❌ No content | 20251204t182430 | moto-cds-qa |
| moto-cds-dev.appspot.com | Dev | ⚠️ 503 | ❌ Timeout/503 | 20260217t112859 | moto-cds-dev |
| ota-cn-sdc.blurdev.com | China Dogfood | ✅ 200 | ❌ No content | 20260219t144007 | moto-cds-staging |

### Key Findings:
- **3 production servers** (appspot, svcmot.cn, sg) share IDENTICAL version and ALL return OTA content
- **Staging and China Dogfood are the SAME backend** (moto-cds-staging, same version)
- **QA is 3 months older** (Dec 2025 vs Feb 2026)
- **Dev is broken** (returns 503 upstream errors)

---

## Why Staging/QA/Dev Return No OTA

### Tested Variables (all combinations):
- ❌ Dogfood fingerprints (userdebug/test-keys, eng/dev-keys)
- ❌ Different buildTypes (user, userdebug, eng)
- ❌ Different buildTags (release-keys, test-keys, dev-keys)
- ❌ All 11 carriers (retgb, retla, retbr, reteu, retru, retin, retcn, cmcc, ctcn, att, vzw)
- ❌ All known GUIDs + test GUIDs (0, test, dogfood, staging)
- ❌ 14 different contexts (ota, fota, beta, soak, dogfood, test, dev, staging, prerelease, etc.)
- ❌ 10 different triggeredBy values (user, setup, notification, polling, d2d, test, dogfood, etc.)
- ❌ Various serialNumbers and device IDs
- ❌ 7 different User-Agent strings
- ❌ CDS v0, v2, v3, v4 API versions
- ❌ 7 different device models (moto g15, razr 50, edge 50, g84, ThinkPhone, etc.)

### Conclusion: 
**Staging/QA/Dev servers have NO OTA packages deployed.** They are structurally identical to production (same API, same response format) but their package databases are empty. These servers are only populated during Motorola's internal release process and packages are removed after promotion to production.

---

## GAE API Discovery

All 4 server environments expose identical GAE APIs:

### 1. contentcheck:v2
- `emailauth/check` — POST, requires OAuth userinfo.email scope
  - Returns 401 "Authorization required, no email" without valid Google OAuth token
- `proxyauth/check` — POST, requires OAuth userinfo.email scope  
  - Staging/QA: Returns 503 NullPointerException (broken)
  - Production: Returns 403 "Requests from moto-cds not allowed through proxy"

**Schema (ContentCheckRequest):**
```json
{
  "id": "string",
  "contentTimestamp": "long",
  "deviceToken": "string",
  "idType": "string",
  "triggeredBy": "enum(user/setup/notification/polling/other/d2d)",
  "reason": "string",
  "status": "string",
  "deviceInfo": "JsonMap",
  "extraInfo": "JsonMap",
  "identityInfo": "JsonMap"
}
```

### 2. adminEndpointAccess:v2
- Base: `/_ah/api/adminEndpointAccess/v2/request/`
- Method: `post` at path `post` → `/_ah/api/adminEndpointAccess/v2/request/post`
- Requires OAuth userinfo.email scope
- Returns 401 on ALL servers (requires Motorola @google.com OAuth)
- **Schema (Request):** method, uri, bodyJson, headersJson
- **Schema (Response):** body, headers, status
- This is an admin proxy that forwards arbitrary requests to the CDS backend

### 3. discovery:v1
- Standard Google APIs discovery service

---

## CDN Servers — Status

| Server | Type | Status | Access |
|--------|------|--------|--------|
| dlmgr.gtm.svcmot.com | DLMGR (Jetty 9.4.8) | ✅ Active | Signed token URLs, 600s TTL |
| dlmgredg-vz.gtm.svcmot.com | EDGECAST (Akamai) | ✅ Active | **Public by packageID** (no auth!) |
| tigo-dlmgr.gtm.svcmot.com | TIGO DLMGR (Jetty) | ✅ Active (404 root) | Signed token URLs |
| dlmgr.svcmot.cn | China DLMGR (Jetty) | ✅ Active (404 root) | Signed token URLs |
| dlmgr-ec.svcmot.cn | China EdgeOne (Tencent) | ⚠️ 403/404 | Not serving packages |
| store-ota.svcmot.com | Upload endpoint | ❌ Connection reset | File upload only |

### DLMGR Internal Paths:
```
/dl/                  → Directory listing (Jetty)
/dl/status.html       → "SUCCESS"
/dl/build.html        → "20240411.1929"
/dl/revision.html     → "developer"
/dl/crossdomain.xml   → allows domain=*
/dl/dlws/1/           → DOWNLOAD_RESOURCE_NOT_FOUND (JSON)
/dl/dlws/2/           → DOWNLOAD_RESOURCE_NOT_FOUND (v2 API exists but non-functional)
```

---

## Complete OTA Chain — lamu_g (moto g15) retgb

9 delta OTAs from VVTA35.51-18-6 → VVTAS35.51-137-10-3:

| Step | Source → Target | Size | CDN | GUID | MD5 |
|------|----------------|------|-----|------|-----|
| 1 | 18-6 → 28-15 | 105.9 MB | DLMGR | 0d5cc74421f2e8a | cf6b67da... |
| 2 | 28-15 → 65-5 | 338.5 MB | DLMGR | 23d670d5d06f351 | e779db4c... |
| 3 | 65-5 → 100 | 134.1 MB | DLMGR | a363e2a67728d8a | b3cfce34... |
| 4 | 100 → 114 | 883.3 MB | DLMGR | 190325d96009ac5 | 6774dc67... |
| 5 | 114 → 124 | 68.4 MB | DLMGR | 3501e9086e77dc1 | 9b767d6a... |
| 6 | 124 → 137 | 75.9 MB | EDGECAST | 80b99133e0ddb3f | 8e7880c5... |
| 7 | 137 → 137-2 | 22.2 MB | DLMGR | 2d94974667acf1d | 64c46602... |
| 8 | 137-2 → 137-10 | 27.3 MB | DLMGR | 39c2283287d0945 | c795dc27... |
| 9 | 137-10 → 137-10-3 | 18.5 MB | DLMGR | 19cfbaf29ab2e36 | ea4aff8e... |

**Total: 1,674.2 MB (1.63 GB)**

### Download Verified ✅
- DLMGR: 206 Partial Content, ZIP with PK header, MD5 matches
- EDGECAST: Public access (4 of 9 packages), 206 Range supported, MD5 matches

### EDGECAST Public URLs (no auth needed):
```
https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-124_777ecb-VVTA35.51-137_7eabca_release-keys.zip.8e7880c5ce01092d8ac52cad892c96ed
https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-137_7eabca-VVTAS35.51-137-2_f1c510_release-keys.zip.64c466021026a4634a6857e43b2db8db
https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTAS35.51-137-2_f1c510-VVTA35.51-137-10_cabf9d_release-keys.zip.c795dc27c2b74379c3593f0f5d48eff2
https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-137-10_cabf9d-VVTAS35.51-137-10-3_4ee65d_release-keys.zip.ea4aff8e44adc8aed2ff5207566f018b
```

### Carriers Tested:
| Carrier | OTA | Notes |
|---------|-----|-------|
| retgb | ✅ Full 9-step chain | UK |
| retla | ✅ Same first step | Latin America |
| retbr | ✅ Same first step | Brazil |
| reteu | ✅ Same first step | Europe |
| retru | ✅ Same first step | Russia |
| retin | ⚠️ Empty response | India (different chain?) |
| retau | ❌ No content | Australia |
| retcn | ❌ No content | China (use svcmot.cn) |
