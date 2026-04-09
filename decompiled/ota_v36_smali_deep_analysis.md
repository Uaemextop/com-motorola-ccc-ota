# Motorola OTA v36.00.035 — Deep Smali Analysis

**Source**: `com-motorola-ccc-ota_3` (decompiled APK `3c_ota.apk`)
**Version**: 36.00.035 (versionCode 3600035)
**SDK**: minSdk 34, targetSdk 36
**Package**: com.motorola.ccc.ota (packageId 127)
**Total smali files**: 11,556
**Analysis date**: April 2026

---

## 1. CDS SERVER SELECTION

From `CheckUpdateHandler.smali` and `Configs.smali`:

```
China (ro.product.is_prc=true):
  Production device → moto-cds.svcmot.cn
  Dogfood/non-secure → ota-cn-sdc.blurdev.com

ROW (rest of world):
  Production device → moto-cds.appspot.com
  Dogfood/non-secure → moto-cds-staging.appspot.com
```

**All known CDS servers** (from CloudPickerActivity + Configs + BotaSettings):
- `moto-cds.appspot.com` — production ROW
- `moto-cds-staging.appspot.com` — staging/dogfood
- `moto-cds-qa.appspot.com` — QA
- `moto-cds-dev.appspot.com` — dev
- `moto-cds.svcmot.cn` — production China
- `ota-cn-sdc.blurdev.com` — China dogfood

**Valid master URLs** (strings.xml:564):
```
moto-cds.appspot.com,moto-cds-dev.appspot.com
```

---

## 2. CDS API ENDPOINTS

From `Configs.smali` (config keys with system property overrides):

| Endpoint | Default Path | Config Key | System Property |
|----------|-------------|------------|-----------------|
| Check | `cds/upgrade/1/check` | CHECK_FOR_UPGRADE_URL | ota.service.update.check.url |
| Resources | `cds/upgrade/1/resources` | DOWNLOAD_DESCRIPTOR_URL | ota.service.update.dd.url |
| State | `cds/upgrade/1/state` | UPGRADE_STATE_URL | ota.service.update.state.url |

### URL Construction Patterns

**Check URL** (CheckUrlConstructor.smali):
```
https://{serverUrl}/{baseUrl}/ctx/{context}/key/{Uri.encode(contextKey)}
Example: https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/{guid}
```

**Resources URL** (ResourcesUrlConstructor.smali):
```
https://{serverUrl}/{baseUrl}/t/{trackingId}/ctx/{context}/key/{Uri.encode(contextKey)}
Example: https://moto-cds.appspot.com/cds/upgrade/1/resources/t/{trackingId}/ctx/ota/key/{guid}
```

**State URL** (StateUrlConstructor.smali):
```
https://{serverUrl}/{baseUrl}/t/{trackingId}/s/{state}/ctx/{context}/key/{Uri.encode(contextKey)}
Example: https://moto-cds.appspot.com/cds/upgrade/1/state/t/{trackingId}/s/downloading/ctx/ota/key/{guid}
```

All support test URL override via `isDogfoodDevice()` check.

---

## 3. CDS REQUEST BODY

From `CheckRequestBuilder.smali` — JSON fields:

```json
{
  "id": "<device unique ID>",
  "contentTimestamp": 0,
  "deviceInfo": {
    "country": "<ro.product.locale.region>",
    "region": "<ro.product.locale>"
  },
  "extraInfo": {
    "carrier": "<ro.mot.build.customerid>",
    "model": "<ro.product.model>",
    "fingerprint": "<Build.FINGERPRINT>",
    "buildTags": "<Build.TAGS>",
    "buildType": "<Build.TYPE>",
    "buildDevice": "<Build.DEVICE>",
    "buildId": "<ro.build.id>",
    "buildDisplayId": "<Build.DISPLAY>",
    "buildIncrementalVersion": "<Build.VERSION.INCREMENTAL>",
    "otaSourceSha1": "<ro.mot.build.guid>",
    "channel_id": "<channel_id setting>",
    "imei": "<IMEI from TelephonyManager>",
    "mccmnc": "<MCC+MNC>",
    "imei2": "<IMEI2>",
    "mccmnc2": "<MCC+MNC2>",
    "serialNumber": "<ro.boot.hardware.sku>"
  },
  "identityInfo": {
    "clientIdentity": "<identity>"
  },
  "triggeredBy": "user",
  "idType": "<idType>"
}
```

**Additional extraInfo fields** (BuildPropReader.smali lines 968-1118):
- `ro.product.name.canonical`
- `ro.mot.build.device`
- `ro.vendor.hw.storage`
- `ro.vendor.hw.ram`
- `ro.vendor.hw.esim`
- `ro.mot.product_wave`
- `ro.mot.build.oem.product`
- `ro.mot.build.system.product`
- `ro.mot.build.product.increment`
- `ro.boot.veritymode`
- `ro.mot.version`
- `ro.build.version.security_patch`
- `ro.enterpriseedition`
- `ro.virtual_ab.enabled`

---

## 4. CDS AUTH (401/403 HANDLING)

From `WebServiceThread.smali`:

### 401 Response Flow
1. Server returns 401 with header `x-moto-accept-verification-methods`
2. Client reads the verification type string
3. If null → abort ("can't proceed further")
4. If present → stores `mVerificationType` and logs it
5. **Supported methods**: CID, GOOGLE_EMAIL (from previous version analysis)

### HTTP Status Handling
- **0** (success on /check) → parse response
- **403** (0x193) and **404** (0x194) → retry with backoff
- **302** (0x12e) and **307** (0x133) → follow Location redirect
- **401** → verification challenge
- Other errors → invoke retry handler

### Backoff Header
- `x-moto-backoff` — server-specified backoff time

---

## 5. CDS RESPONSE — CONTENT RESOURCES

From `ContentResourcesBuilder.smali` — JSON response parsing:

```json
{
  "proceed": true,
  "wifiUrl": "https://storage.googleapis.com/...",
  "wifiHeaders": {"Authorization": "Bearer ...", ...},
  "cellUrl": "https://storage.googleapis.com/...",
  "cellHeaders": {"Authorization": "Bearer ...", ...},
  "adminApnUrl": "...",
  "adminApnHeaders": {...},
  "trackingId": "abc123"
}
```

**Key fields from ContentResources class**:
- `mWifiUrl` / `mCellularUrl` / `mAdminApnUrl` — download URLs
- `mWifiHeaders` / `mCellularHeaders` / `mAdminApnHeaders` — Map<String,String> headers
- `mProceed` — boolean continue flag
- `mTrackingId` — tracking ID for state/resources calls

**Key: wifiHeaders and cellHeaders are Map<String,String>** that get added to the download HTTP request. This is how GCS auth tokens are passed.

---

## 6. DOWNLOAD FLOW — GCS (storage.googleapis.com)

### addAuthorizationHeader() in DownloadService.smali (line 255)
```java
private boolean addAuthorizationHeader(String url) {
    try {
        URI uri = new URI(url);
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if ("https".equals(scheme) && "storage.googleapis.com".equals(host)) {
            return true;  // GCS detected → add auth headers
        }
    } catch (Exception e) {
        log("addAuthorizationHeader,Caught exception" + e);
    }
    return false;
}
```

### Header Passing Flow (DownloadService.smali lines 1190-1310)
1. Get `ContentResource` JSON from download request
2. Call `getDownloadHeaders()` which extracts `wifiHeaders`/`cellHeaders`/`adminApnHeaders` based on network type
3. Iterate over JSON object keys
4. For each key-value pair, call `downloader.addHeader(key, value)`
5. These headers are added to the `AdvancedFileDownloader` HTTP request

```java
// Pseudocode from smali
JSONObject headers = getDownloadHeaders(contentResource);
if (headers != null && headers.length() > 0) {
    JSONArray names = headers.names();
    for (int i = 0; i < names.length(); i++) {
        String key = names.getString(i);
        String value = headers.getString(key);
        downloader.addHeader(key, value);  // e.g. "Authorization: Bearer ..."
    }
}
```

**THIS IS THE KEY FINDING**: CDS /resources endpoint returns wifiHeaders containing an `Authorization: Bearer <token>` header. This bearer token is then added to the GCS download request. The token is generated server-side — the client doesn't create it.

---

## 7. HTTP DOWNLOAD — AdvancedFileDownloader.smali

### Download Headers (lines 1060-1130)
```
Request headers set:
1. Custom headers from CDS (iterated from headers list)
2. If-Match: {ETag}  (if ETag was received from previous response)
3. Range: bytes={offset}-  (for resume)
4. Accept-Encoding: identity
5. Connection: close
```

### IPv4 Forcing for Motorola CDNs (lines 953-982)
```java
if (downloadUrl.contains("svcmot") || downloadUrl.contains("blurdev")) {
    System.setProperty("java.net.preferIPv4Stack", "true");
    System.setProperty("java.net.preferIPv6Addresses", "false");
}
```

### Response Handling
- Reads `Content-Length`, `Content-Range`, `Transfer-Encoding`
- Stores `ETag` from response for subsequent range requests
- Supports chunked transfer encoding
- CRC32 verification via `.crc` file

### CDN Detection
The `svcmot`/`blurdev` check means the app recognizes downloads from:
- `*.svcmot.com` / `*.svcmot.cn` (DLMGR, EDGECAST)
- `*.blurdev.com` (staging/dev CDN)

For `storage.googleapis.com` URLs, IPv4 forcing is NOT applied (GCS handles IPv6 fine).

---

## 8. HARDCODED SECRETS & CREDENTIALS

### App Identity (Configs.smali)
```
APPIID    = "MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ"
APPSECERET = "zdG4h4k2NOm6MSh"
```
Config keys: `com.motorola.ccc.ota.botaplugin.appid` / `com.motorola.ccc.ota.botaplugin.appsecret`

### File Upload Auth (FileUploadService.smali:268-277)
```
X-Moto-Auth-Sign: d928bee85b45cffe7b0f21084dd3d20e
Secretkey: SecretMOTOKey321
```

### Upload Endpoint
```
https://store-ota.svcmot.com/  (FileUtils.smali:2506)
```

---

## 9. UPDATER ENGINE (UE) DOWNLOAD — Streaming

From `UEDownloadRequestBuilder.smali`:

### Header Format for Streaming Downloads
```
NETWORK_ID={networkId}
NETWORK_TYPE={networkType}
USER_AGENT={http.agent system property}
PROXY_HOST=dmint.softbank.ne.jp  (SoftBank-specific)
PROXY_PORT=8080
```

### Streaming Payload (from CDS response `additionalInfo`)
```json
{
  "additionalInfo": {
    "payload": [
      {"offset": 12345, "size": 67890}
    ]
  }
}
```

The UE (Update Engine) can do streaming installs — downloading and installing simultaneously from `payload.bin` inside the OTA ZIP.

---

## 10. COMPLETE DOWNLOAD SEQUENCE

### Step 1: CDS Check
```
POST https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/{guid}
Headers:
  User-Agent: com.motorola.ccc.ota/36.00.035
  x-moto-accept-verification-methods: CID,GOOGLE_EMAIL
  Content-Type: application/json
Body: {id, contentTimestamp:0, deviceInfo, extraInfo, triggeredBy:"user", ...}
```

### Step 2: Parse Check Response
Get `contentResources[]` array with:
- `url` — download URL (now storage.googleapis.com)
- `headers` — JSON object with auth headers
- `tags` — ["WIFI", "CELL"]
- `urlTtlSeconds` — URL expiry time

### Step 3: CDS Resources (refresh URLs)
```
POST https://moto-cds.appspot.com/cds/upgrade/1/resources/t/{trackingId}/ctx/ota/key/{guid}
Body: {id, contentTimestamp, deviceInfo, extraInfo, reason}
Response: {proceed, wifiUrl, wifiHeaders, cellUrl, cellHeaders, trackingId}
```

### Step 4: Download from GCS
```
GET {wifiUrl or cellUrl from resources response}
Headers:
  Authorization: Bearer {token from wifiHeaders/cellHeaders}
  Range: bytes={offset}-
  Accept-Encoding: identity
  Connection: close
  If-Match: {ETag from previous request}
```

### Step 5: State Report
```
POST https://moto-cds.appspot.com/cds/upgrade/1/state/t/{trackingId}/s/{state}/ctx/ota/key/{guid}
States: downloading, downloaded, installing, installed, failed
```

---

## 11. V36 CHANGES vs PREVIOUS VERSIONS

| Feature | Previous (v3.x) | v36.00.035 |
|---------|-----------------|------------|
| Download CDN | DLMGR + EDGECAST | **storage.googleapis.com (GCS)** |
| Download auth | DLMGR signed token / EDGECAST public | **Bearer token from CDS wifiHeaders** |
| URL construction | Same | Same (check/resources/state) |
| CDS server | moto-cds.appspot.com | Same |
| Request body | Same fields | +more extraInfo fields (storage, ram, esim, wave, etc.) |
| File upload | store-ota.svcmot.com | Same |
| IPv4 forcing | svcmot/blurdev domains | Same (NOT applied to GCS) |
| Auth sign | d928bee... + SecretMOTOKey321 | Same |
| APPIID | MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ | Same |
| APPSECERET | zdG4h4k2NOm6MSh | Same |
| Admin APN | Not in response | **New: adminApnUrl + adminApnHeaders** |

---

## 12. HOW TO DOWNLOAD OTA FILES

Based on the complete analysis, here's the download flow:

### Method 1: CDS → GCS (v36 flow)
1. **CDS /check** with correct GUID, carrier, model → get tracking ID + content info
2. **CDS /resources** with tracking ID → get wifiUrl (GCS) + wifiHeaders (Bearer token)
3. **GET wifiUrl** with wifiHeaders as HTTP headers → download OTA ZIP
4. Bearer token has TTL (urlTtlSeconds), refresh via /resources if expired

### Method 2: EDGECAST Direct (older packages, no auth)
```
GET https://dlmgredg-vz.gtm.svcmot.com/{packageID}
```
Where `packageID` = `{zip_name}.{md5_hash}` — NO authentication needed.

### Method 3: DLMGR Signed (older packages)
```
GET https://dlmgr.gtm.svcmot.com/dl/dlws/1/{token}/{packageID}
```
Token from CDS response, 600s TTL, refresh via /resources.

### Authentication Requirements Summary
| Component | Auth Needed |
|-----------|-------------|
| CDS /check | `User-Agent: com.motorola.ccc.ota/*` (ONLY requirement) |
| CDS /resources | Same UA |
| CDS /state | Same UA |
| GCS download | `Authorization: Bearer {token}` from CDS response |
| EDGECAST download | None (public by packageID) |
| DLMGR download | Signed token URL from CDS |
| File upload | `X-Moto-Auth-Sign: d928bee...` + `Secretkey: SecretMOTOKey321` |

---

## 13. KEY SYSTEM PROPERTIES READ

```properties
# Identity
ro.mot.build.customerid    → carrier (e.g., "retgb", "retla")
ro.mot.build.guid          → otaSourceSha1 (OTA chain GUID)
ro.product.model           → model (e.g., "moto g15")
ro.build.product           → buildDevice
ro.build.id                → buildId

# Location
ro.product.locale.region   → country
ro.product.locale          → region

# Hardware
ro.vendor.hw.storage       → storage capacity
ro.vendor.hw.ram           → RAM size
ro.vendor.hw.esim          → eSIM support
ro.boot.hardware.sku       → serialNumber

# Version
ro.build.version.release   → Android version
ro.build.version.security_patch → security patch
ro.mot.version             → Motorola version
ro.build.date.utc          → build timestamp

# Features
ro.virtual_ab.enabled      → A/B (Virtual A/B) support
ro.virtual_ab.compression.enabled → compression
ro.boot.secure_hardware    → secure hardware
ro.boot.verifiedbootstate  → verified boot state
ro.enterpriseedition       → enterprise edition
ro.mot.product_wave        → product wave
```
