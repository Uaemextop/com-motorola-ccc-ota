# Motorola Full Firmware Download — Analysis Report

**Date**: April 2026  
**Conclusion**: Full firmware requires LSA (Lenovo Smart Assistant) with valid Lenovo account.

---

## Delta vs Full OTA — Where Each Lives

| Source | Type | Auth | Status |
|--------|------|------|--------|
| CDS (moto-cds.appspot.com) | **Delta ONLY** | UA header | ✅ Working |
| EDGECAST (dlmgredg-vz.gtm.svcmot.com) | **Delta ONLY** | None (public) | ✅ 7/9 packages free |
| GCS (storage.googleapis.com) | Delta only | Bearer token from CDS | ⚠️ Token required |
| LSA (lsa.lenovo.com) | **Full firmware** | Lenovo OAuth2 JWT | ⚠️ Login blocked from DC IPs |
| rsddownload-secure.lenovo.com | **Full firmware** | AWS SigV4 presigned URL | ❌ Need LSA API |
| ota-cdn.lenovo.com | **Full firmware** | Direct URL (no auth) | ✅ Works if you know filename |
| Lenovo OTA (ota.lenovo.com) | Lenovo tablets only | None | ❌ Not for Motorola |

---

## CDS: Only Serves Delta OTAs

**Exhaustively tested**:
- ALL 9 chain steps for lamu_g → all `delta-Ota_Version_` prefix
- ALL 14 carriers × 10 GUIDs → always delta
- Different `triggeredBy` values (user/setup/notification/polling/d2d)
- Different contexts (ota/fota/bota/d2d/full/recovery/factory) → only `ota` has content
- Empty/old/fake build info → same delta
- CDS `streamingData` always shows `packageType: "incremental"`

**CDS never produces full OTA filenames.** The `packageID` always starts with `delta-Ota_Version_`.

---

## EDGECAST: Only Has Delta Files

Tested naming patterns:
- `full-Ota_Version_...` → 404
- `Ota_Version_...` → 404  
- `Full_Ota_Version_...` → 404
- `Blur_Version_...` → 404
- All 3 versions × 4 prefixes × 2 increments = 0 results

**EDGECAST only hosts files placed there by CDS pipeline = always delta.**

---

## LSA (lsa.lenovo.com) — THE Path to Full Firmware

### Server Info
- **Platform**: Apache Tomcat 11.0.12
- **Status**: ACTIVE (all endpoints respond)
- **Auth**: JWT token required (`{"code":"403","desc":"Invalid token."}`)

### 29 Active Endpoints Found

| Category | Endpoint | Status |
|----------|----------|--------|
| **Login** | `/Interface/user/lenovoIdLogin.jhtml` | 500 (server error from DC IPs) |
| **Login** | `/Interface/user/guestLogin.jhtml` | 403 Invalid token |
| **Login** | `/Interface/user/login.jhtml` | 403 Invalid token |
| **Login** | `/Interface/user/getToken.jhtml` | 403 Invalid token |
| **OAuth2** | `/Interface/user/oauth2/authorize.jhtml` | 403 Invalid token |
| **OAuth2** | `/Interface/user/oauth2/callback.jhtml` | 405 (GET only) |
| **OAuth2** | `/Interface/user/oauth2/token.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/getDeviceInfo.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/getResourceByImei.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/getResourceBySN.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/getFirmware.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/downloadFirmware.jhtml` | 403 Invalid token |
| **Rescue** | `/Interface/rescue/getDeviceList.jhtml` | 403 Invalid token |
| **Device** | `/Interface/device/getInfo.jhtml` | 403 Invalid token |
| **Device** | `/Interface/device/getFirmware.jhtml` | 403 Invalid token |
| **Device** | `/Interface/device/query.jhtml` | 403 Invalid token |
| **Firmware** | `/Interface/firmware/query.jhtml` | 403 Invalid token |
| **Firmware** | `/Interface/firmware/download.jhtml` | 403 Invalid token |
| **Firmware** | `/Interface/firmware/getResource.jhtml` | 403 Invalid token |
| **Firmware** | `/Interface/firmware/getByModel.jhtml` | 403 Invalid token |
| **Flash** | `/Interface/flash/getResource.jhtml` | 403 Invalid token |
| **Flash** | `/Interface/flash/getFirmware.jhtml` | 403 Invalid token |
| **Flash** | `/Interface/flash/getNewResourceByImei.jhtml` | 403 Invalid token |
| **Flash** | `/Interface/flash/getNewResourceBySN.jhtml` | 403 Invalid token |
| **RescueDevice** | `/Interface/rescueDevice/getNewResourceByImei.jhtml` | 403 Invalid token |
| **RescueDevice** | `/Interface/rescueDevice/getNewResourceBySN.jhtml` | 403 Invalid token |
| **RescueDevice** | `/Interface/rescueDevice/getDeviceInfo.jhtml` | 403 Invalid token |
| **RescueDevice** | `/Interface/rescueDevice/getResourceList.jhtml` | 403 Invalid token |
| **RescueDevice** | `/Interface/rescueDevice/getApiInfo.jhtml` | 403 Invalid token |

### Authentication Requirements
- Login (`lenovoIdLogin.jhtml`) returns **500** from datacenter IPs
- Requires `Content-Type: application/json` (415 for form-encoded)
- OAuth2 `client_id`: `127cbff4e99dd5579db0627769509be972a3f38ad0dd11f2f2a7947516c923f0`
- OAuth2 provider: `passport-glb.lenovo.com`
- All tested token formats rejected (guest/anonymous/mock JWT/Base64)

### How to Get Token (from LMSA desktop app)
1. Install Lenovo LMSA (Rescue and Smart Assistant) on Windows/Mac
2. LMSA opens `passport-glb.lenovo.com` OAuth2 login in embedded browser
3. User logs in with Lenovo ID
4. LMSA receives JWT token via OAuth2 callback
5. Token used for all `/Interface/` endpoints
6. Firmware download URL returned by rescue endpoints → presigned S3 URL

---

## ota-cdn.lenovo.com — Full Firmware CDN

| Finding | Details |
|---------|---------|
| Server | AWS CloudFront → S3 (us-west-1) |
| Supports Range | ✅ Yes (HTTP 206) |
| Directory listing | ❌ AccessDenied |
| Known file | `firmware/20246272145210-6026.zip` (4,569 MB, TB320FC) |
| File format | ZIP with payload.bin (A/B OTA) |
| Naming pattern | `firmware/{timestamp}-{id}.zip` |
| Auth required | None (direct URL access) |

**The URLs for this CDN come from the LSA rescue API.** Without known filenames, cannot discover new firmware.

---

## Other Servers Tested

| Server | Result |
|--------|--------|
| `rsddownload-secure.lenovo.com` | ALL files 403 (need presigned URLs) |
| `ota.lenovo.com` | Empty XML for all Motorola models (Lenovo tablets only) |
| `lolinet.com/firmware/motorola/` | No Motorola firmware available |
| `download.motorola.com` | NXDOMAIN |
| `dl.motorola.com` | NXDOMAIN |
| `fota.motorola.com` | NXDOMAIN |
| `mobile-lsa-biz.lenovo.com` | NXDOMAIN |
| `passport-glb.lenovo.com` | DNS blocked from datacenter |
| `d2xbblc68nqw6k.cloudfront.net` | 403 AccessDenied (S3 bucket, needs signed URLs) |

---

## Summary: How to Get Full Firmware

### Method 1: LMSA Desktop Application (Recommended)
1. Download LMSA from `lsa.lenovo.com`
2. Connect Motorola device in fastboot mode
3. LMSA automatically detects device and offers firmware flash
4. Downloads full firmware from `rsddownload-secure.lenovo.com` via presigned URLs
5. No GUID needed — uses IMEI/Serial Number for device identification

### Method 2: Capture LSA Token
1. Run LMSA with network proxy (Fiddler/mitmproxy)
2. Capture the JWT `Authorization` header after OAuth2 login
3. Use token to call LSA rescue endpoints directly:
   ```
   POST https://lsa.lenovo.com/Interface/rescue/getResourceByImei.jhtml
   Headers: Authorization: Bearer {JWT}, Content-Type: application/json
   Body: {"imei": "your_device_imei"}
   ```
4. Response contains presigned download URL for full firmware

### Method 3: Chain Delta OTAs (No full OTA needed)
If you have ANY known version's GUID:
1. CDS chain-walk from that GUID to get all delta steps
2. Download all deltas from EDGECAST (free, no auth)
3. Apply sequentially using update_engine
4. Result: device at latest firmware

---

## Stored Device Data for Future Reference

### lamu_g (moto g15) GUID Chain
| GUID | Version |
|------|---------|
| `0d5cc74421f2e8a` | VVTAS35.51-18-6 |
| `23d670d5d06f351` | VVTA35.51-28-15 |
| `a363e2a67728d8a` | VVTA35.51-65-5 |
| `190325d96009ac5` | VVTA35.51-100 |
| `3501e9086e77dc1` | VVTA35.51-114 |
| `80b99133e0ddb3f` | VVTA35.51-124 |
| `2d94974667acf1d` | VVTA35.51-137 |
| `39c2283287d0945` | VVTAS35.51-137-2 |
| `19cfbaf29ab2e36` | VVTA35.51-137-10 |
| `83436843c200809` | VVTAS35.51-137-10-3 |

### mumba (moto g100s / XT2537-4)
| Property | Value |
|----------|-------|
| GUID | `9f03d42e458cef2` |
| Build | `W1WAA36M.48-23-ST12.4` |
| Carrier | `china` |
| CDS Status | Valid GUID, no OTA available (pre-release) |
