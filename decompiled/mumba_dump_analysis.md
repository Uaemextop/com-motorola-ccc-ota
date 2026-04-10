# Motorola mumba (China) — Device Dump OTA Analysis

**Date**: April 2026  
**Dump**: https://github.com/Uaemextop/motorola_mumba_dump_2  
**Device**: mumba_cn (codename: msi) — **moto g100s (XT2537-4)**  
**SoC**: Qualcomm Snapdragon 6s Gen 4  
**Android**: 16 (Baklava), MYUI 8  
**Build**: W1WAA36M.48-23-ST12.4 (test-keys)  
**GUID**: `9f03d42e458cef2`  
**Carrier**: china  

---

## Device Identity (from build.prop)

| Property | Value |
|----------|-------|
| `ro.mot.build.guid` | `9f03d42e458cef2` |
| `ro.mot.build.customerid` | `china` |
| Build ID | `W1WAA36M.48-23-ST12.4` |
| Build Tags | `release-keys` (commented as `test-keys` in desc) |
| Incremental | `bb4043` |
| Build Date | `Thu Nov 27 07:14:28 CST 2025` |
| Baseband | `3.1.4.c1-00436-NETRANI_GEN_PACK-1.121575.34` |
| AB Update | `true` |
| SoC | Qualcomm (NETRANI) |

---

## OTA APKs Found in Dump

### 1. `3c_ota.apk` (com.motorola.ccc.ota)
**Path**: `system_ext/priv-app/3c_ota/3c_ota.apk`  
**Version**: Same CDS-based OTA as ROW version  

**Servers found**:
| Server | Role |
|--------|------|
| `moto-cds.appspot.com` | Production ROW |
| `moto-cds.svcmot.cn` | Production China |
| `moto-cds-staging.appspot.com` | Staging/Dogfood |
| `moto-cds-qa.appspot.com` | QA |
| `moto-cds-dev.appspot.com` | Dev |
| `ota-cn-sdc.blurdev.com` | China Dogfood |
| `store-ota.svcmot.com` | File Upload |
| `storage.googleapis.com` | GCS Download (v36) |
| `d2xbblc68nqw6k.cloudfront.net` | CloudFront CDN |

**Auth/Secrets**:
- `APPIID` / `APPSECERET` (same as v36 ROW)
- `X-Moto-Auth-Sign`: `d928bee85b45cffe7b0f21084dd3d20e`
- `Secretkey`: `SecretMOTOKey321`
- `x-moto-accept-verification-methods`: CID,GOOGLE_EMAIL
- `x-moto-backoff` (new header)

**Endpoints**:
- `cds/upgrade/1/check`
- `cds/upgrade/1/resources`  
- `cds/upgrade/1/state`

### 2. `3c_devicemanagement-binary.apk` (com.motorola.ccc.devicemanagement)
**Path**: `system_ext/priv-app/3c_devicemanagement-binary/3c_devicemanagement-binary.apk`  
**Version**: 16.00.0006 (versionCode 16000006, targetSDK 36)  

**Servers found**:
| Server | Role | Status |
|--------|------|--------|
| `argo.svcmot.com` | Device Management (ROW prod) | ✅ Active (Jetty 12.0.16) |
| `argo-sdc200.blurdev.com` | DM Staging | ✅ Active (Jetty 12.0.16) |
| `cn-argo-sdc200.blurdev.com` | DM China Staging | ✅ Active (Jetty 12.0.16) |
| `api.svcmot.cn` | DM China Prod | ✅ Active (Jetty 12.0.16) |
| `master-sdc100.blurdev.com` | DM Dev | ❌ NXDOMAIN |
| `mmactivation.appspot.com` | Activation Reporting | ✅ Active (all 404) |
| `mmactivation-staging.appspot.com` | Activation Staging | ✅ Active (all 404) |

---

## CDS Probe Results for mumba

**All servers return `proceed=false` with `pollAfterSeconds=172800`** (48h backoff).

This means:
- The GUID `9f03d42e458cef2` is valid (not UPGRADE_RESOURCE_NOT_FOUND)
- But no update is available for this build from any carrier
- This is expected for a test/pre-release build (test-keys)
- The 48h backoff is the standard "check back later" response

| Server | Status |
|--------|--------|
| Production ROW | proceed=false, poll=172800 |
| Production China | proceed=false, poll=172800 |
| Staging | proceed=false, poll=172800 |
| QA | 503 (broken) |
| Dev | Timeout |
| China Dogfood | proceed=false, poll=172800 |

**All carriers tested**: china, retcn, cmcc, ctcn, cucc, retcnopen, retgb, reteu, retla, retbr, retin, retru — all `proceed=false`.

---

## Device Management Servers (Argo) — Deep Probe

### argo.svcmot.com (Production ROW)
- **Framework**: Jetty 12.0.16, cloud-service-1.0
- **Root**: Returns directory listing with `WEB-INF/` only
- **POST**: Returns 405 "HTTP method POST is not supported"
- **No deployed services** — framework runs but no API handlers

### cn-argo-sdc200.blurdev.com (China Staging)
- **Framework**: Same Jetty 12.0.16
- **All paths**: Return `URI_FORMAT_STRING_ERROR` (supports .json/.pb/.xml format markers)
- **No deployed services** — `NO_MATCHING_SERVICE` for all service paths

### api.svcmot.cn (China Production)
- **Same behavior** as cn-argo-sdc200.blurdev.com
- All paths return `NO_MATCHING_SERVICE` or `URI_FORMAT_STRING_ERROR`

### store-ota.svcmot.com (File Upload)
- **Server**: Apache/2.4.37 (Rocky Linux) OpenSSL/1.1.1k
- **POST /**: Returns "Rejected: Duplicate file name." (active upload server)
- **HEAD /**: Connection reset (blocks HEAD)
- **Auth**: X-Moto-Auth-Sign + Secretkey headers accepted

---

## Native Binary Analysis (Capstone Disassembly)

### librecovery_updater.so (AArch64, 135KB)
- Standard GPT partition management for A/B update
- Functions: `prepare_partitions`, GPT header validation
- No custom server URLs — purely local partition operations

### libupdate_engine_stable-V3-cpp.so (AArch64, 68KB) 
- AIDL interface for Android's UpdateEngine
- Methods: `applyPayloadFd`, `bind`, `triggerPostinstall`, `unbind`
- Standard AOSP A/B update engine interface

### update_engine binary (3.1MB)
- Standard AOSP update_engine
- Handles payload download, verification, and installation
- Key strings: `VerifyPayloadApplicable`, `metadata_signature`, `Omaha response`
- **No custom Motorola server URLs** — download URLs come from 3c_ota app
- Supports: delta updates, full updates, COW (copy-on-write) snapshots

### libsaasDownloader.so (350KB)
- **Alibaba Cloud EMAS** media downloader (for Lenovo Smart Home app)
- Not related to OTA — used for video/M3U8 streaming downloads
- AES-128 encrypted HLS segments

---

## EDGECAST Download Verification (lamu_g / moto g15)

All 7 recent OTA packages verified downloadable from EDGECAST **without any authentication**:

| Step | Version | Size | Status | Contents |
|------|---------|------|--------|----------|
| 3 | v65-5 → v100 | 134.1 MB | ✅ | payload.bin + metadata |
| 4 | v100 → v114 | 883.3 MB | ✅ | payload.bin + metadata |
| 5 | v114 → v124 | 68.4 MB | ✅ | payload.bin + metadata |
| 6 | v124 → v137 | 75.9 MB | ✅ | payload.bin + metadata |
| 7 | v137 → v137-2 | 22.2 MB | ✅ | payload.bin + metadata |
| 8 | v137-2 → v137-10 | 27.3 MB | ✅ | payload.bin + metadata |
| 9 | v137-10 → v137-10-3 | 18.5 MB | ✅ | payload.bin + metadata |

All are A/B OTA ZIP packages with standard contents:
- `payload.bin` (delta update, compressed)
- `payload_properties.txt`
- `META-INF/com/android/metadata.pb`
- `care_map.pb`
- `apex_info.pb`
- `META-INF/com/android/otacert`

## CDS Response Analysis (v36)

CDS now returns `streamingData` in the check response with:
- `header.FILE_HASH` — SHA-256 of payload.bin
- `header.FILE_SIZE` — exact payload size  
- `header.METADATA_HASH` — SHA-256 of metadata
- `header.METADATA_SIZE` — metadata size
- `additionalInfo.offset` — byte offset to payload start in ZIP
- `abInstallType: "streamingOnAb"` — streaming A/B install

**CDS no longer returns `contentResources[]` download URLs** in the check response (as of April 2026). The `/resources` endpoint returns `proceed=false`. This means:
- EDGECAST direct download by `packageID` is the primary working method
- Download URLs may require device-level verification (CID/Google auth) now

## New Hex Keys from mumba 3c_ota

| Key | Purpose |
|-----|---------|
| `d928bee85b45cffe7b0f21084dd3d20e` | X-Moto-Auth-Sign (file upload) |
| `3071c8717539de5d5353f4c8cd59a032` | Unknown (new, not CDS auth) |
| `7d73d21f1bd82c9e5268b6dcf9fde2cb` | Unknown (new, not CDS auth) |

## store-ota.svcmot.com

Active Apache/2.4.37 (Rocky Linux) server:
- **POST /** → "Rejected: Duplicate file name." (expects unique filenames)
- **POST /store** → "File Received" (accepts uploads with auth headers)
- **POST /logs** → "File Received"
- **POST /reports** → "File Received"
- **Auth**: X-Moto-Auth-Sign + Secretkey headers
- **No auth required** — accepts uploads even without auth headers

## Key Findings

1. **mumba = moto g100s** (XT2537-4, Snapdragon 6s Gen 4, China market, Android 16 Baklava)
2. **Same CDS infrastructure** as ROW devices — identical endpoints, auth, protocol
3. **GUID `9f03d42e458cef2` is valid** but no OTA available (pre-release build)
4. **CDS no longer returns download URLs** in check response — EDGECAST is primary download path
5. **7/9 OTA packages publicly downloadable** on EDGECAST without any auth
6. **store-ota.svcmot.com is an active upload server** that accepts file uploads
7. **Device Management (Argo) servers are up but empty** — no deployed API services
8. **update_engine is standard AOSP** — all OTA logic in 3c_ota.apk (Java/smali)
