# Motorola OTA App v36.00.035 (com.motorola.ccc.ota) — Comprehensive Analysis

**APK:** `3c_ota.apk`
**Package:** `com.motorola.ccc.ota`
**Version:** 36.00.035 (versionCode 3600035, hex 0x36eea3)
**Min SDK:** 34 (Android 14)
**Target SDK:** 36 (Android 16)
**Build Type:** release
**DEBUG:** false

---

## 1. CDS Server URLs and Endpoints

### 1.1 Server Hostnames (CDSUtils.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/utils/CDSUtils.smali`

Hardcoded constants:
```
SERVER_URL         = "moto-cds.appspot.com"
CHECK_BASE_URL     = "cds/upgrade/1/check"
RESOURCES_BASE_URL = "cds/upgrade/1/resources"
STATE_BASE_URL     = "cds/upgrade/1/state"
IDTYPE             = "serialNumber"
REQUEST_TAG        = "OTA"
```

### 1.2 Server Selection by Region (UpgradeUtils.smali)

**File:** `smali_classes2/com/motorola/otalib/common/utils/UpgradeUtils.smali`

```
PRODUCTION_SERVER       = "moto-cds.appspot.com"
STAGING_SERVER          = "moto-cds-staging.appspot.com"
QA_SERVER               = "moto-cds-qa.appspot.com"
DEVELOPMENT_SERVER      = "moto-cds-dev.appspot.com"
CHINA_PRODUCTION_SERVER = "moto-cds.svcmot.cn"
CHINA_STAGING_SERVER    = "ota-cn-sdc.blurdev.com"
```

### 1.3 MASTER_CLOUD Selection Logic (Configs.smali)

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/settings/Configs.smali`
**Method:** `getMasterCloud()`

```java
// Pseudocode from smali analysis:
static String getMasterCloud() {
    if (BuildPropertyUtils.isChinaDevice(context)) {
        if (!isDogfoodDevice() && isSecure()) {
            return "moto-cds.svcmot.cn";        // China production
        } else {
            return "ota-cn-sdc.blurdev.com";     // China staging/dogfood
        }
    } else {
        if (!isDogfoodDevice() && isSecure()) {
            return "moto-cds.appspot.com";       // Global production
        } else {
            return "moto-cds-staging.appspot.com"; // Global staging/dogfood
        }
    }
}
```

The same logic is mirrored in **CheckUpdateHandler.smali** (`getServerUrl()` method) and **BotaSettings.smali**.

### 1.4 CloudPickerActivity — Debug Cloud Selector

**File:** `smali_classes2/com/motorola/ccc/ota/ui/CloudPickerActivity.smali`

Available server options in the debug picker:
```
"moto-cds-qa.appspot.com"
"moto-cds.appspot.com"
"moto-cds-staging.appspot.com"
"moto-cds-dev.appspot.com"
"moto-cds.svcmot.cn"
```

### 1.5 Endpoint URL Patterns (from Configs.smali static init)

| Config Key | Default Value | Description |
|---|---|---|
| `ota.service.update.masterCloud` | `getMasterCloud()` | CDS server hostname |
| `ota.service.update.check.url` | `cds/upgrade/1/check` | Check for updates |
| `ota.service.update.dd.url` | `cds/upgrade/1/resources` | Download descriptor / resources |
| `ota.service.update.state.url` | `cds/upgrade/1/state` | Upgrade state reporting |
| `ota.service.update.check.httpmethod` | `post` | HTTP method for check |
| `ota.service.update.check.issecure` | `true` | Use HTTPS for check |
| `ota.service.update.dd.issecure` | `true` | Use HTTPS for resources |
| `ota.service.update.state.issecure` | `true` | Use HTTPS for state |
| `ota.service.update.context` | `ota` | OTA context identifier |

---

## 2. URL Construction

### 2.1 Check URL (CheckUrlConstructor.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/UrlConstructor/CheckUrlConstructor.smali`

Pattern: `{scheme}://{serverUrl}/{baseUrl}/ctx/{context}/key/{contextKey}`

Example: `https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/{URI-encoded-contextKey}`

If a test URL is set and the device is a dogfood device, the test URL is used instead.

### 2.2 Resources URL (ResourcesUrlConstructor.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/UrlConstructor/ResourcesUrlConstructor.smali`

Pattern: `{scheme}://{serverUrl}/{baseUrl}/t/{trackingId}/ctx/{context}/key/{contextKey}`

Example: `https://moto-cds.appspot.com/cds/upgrade/1/resources/t/{trackingId}/ctx/ota/key/{contextKey}`

### 2.3 State URL (StateUrlConstructor.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/UrlConstructor/StateUrlConstructor.smali`

Pattern: `{scheme}://{serverUrl}/{baseUrl}/t/{trackingId}/s/{state}/ctx/{context}/key/{contextKey}`

Example: `https://moto-cds.appspot.com/cds/upgrade/1/state/t/{trackingId}/s/{stateCode}/ctx/ota/key/{contextKey}`

### 2.4 UrlRequest Data Object Fields

**File:** `smali_classes2/com/motorola/otalib/cdsservice/requestdataobjects/builders/UrlRequestBuilder.smali`

JSON fields:
```json
{
  "serverUrl": "moto-cds.appspot.com",
  "baseUrl": "cds/upgrade/1/check",
  "context": "ota",
  "contextKey": "{device-specific-key}",
  "state": "{state-code}",
  "trackingId": "{tracking-id}",
  "secure": "true",
  "testurl": ""
}
```

---

## 3. Request Body Construction

### 3.1 Check Request (CheckRequestBuilder.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder.smali`

JSON body structure:
```json
{
  "id": "{device-serial-number}",
  "contentTimestamp": 1234567890,
  "deviceInfo": { /* device properties */ },
  "extraInfo": { /* extra metadata */ },
  "identityInfo": { /* identity/serial info */ },
  "triggeredBy": "user|polling|setup|notification|other",
  "idType": "serialNumber"
}
```

### 3.2 Resources Request (ResourcesRequestBuilder.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/requestdataobjects/builders/ResourcesRequestBuilder.smali`

JSON body structure:
```json
{
  "id": "{device-serial-number}",
  "contentTimestamp": 1234567890,
  "deviceInfo": { /* device properties */ },
  "extraInfo": { /* extra metadata */ },
  "identityInfo": { /* identity/serial info */ },
  "idType": "serialNumber",
  "reportingTags": "{tags}",
  "reason": "{reason}"
}
```

### 3.3 State Request (StateRequestBuilder.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/requestdataobjects/builders/StateRequestBuilder.smali`

JSON body structure:
```json
{
  "id": "{device-serial-number}",
  "contentTimestamp": 1234567890,
  "deviceInfo": { /* device properties */ },
  "extraInfo": { /* extra metadata */ },
  "identityInfo": { /* identity/serial info */ },
  "info": "{info-string}",
  "logs": "{logs-string}",
  "idType": "serialNumber",
  "status": "{status-code}",
  "reportingTags": "{tags}",
  "upgradeSource": "{source}",
  "stats": { /* stats JSON object */ }
}
```

### 3.4 deviceInfo Fields (BuildPropReader.smali)

**File:** `smali_classes2/com/motorola/ccc/ota/utils/BuildPropReader.smali`

The `deviceInfo` JSON object is built from system properties:

```json
{
  "manufacturer": "Build.MANUFACTURER",
  "hardware": "Build.HARDWARE",
  "brand": "Build.BRAND",
  "model": "Build.MODEL",
  "product": "ro.vendor.product.display",
  "os": "Android",
  "osVersion": "Build.VERSION.RELEASE",
  "country": "ro.product.locale.region",
  "region": "ro.product.locale",
  "language": "{locale-language}",
  "userLanguage": "{locale-display-language}"
}
```

### 3.5 extraInfo Fields (BuildPropReader.smali + BotaUpgradeSource.smali)

The `extraInfo` JSON object includes:

```json
{
  "imei": "{IMEI}",
  "mccmnc": "{MCC+MNC}",
  "clientIdentity": "motorola-ota-client-app",
  "carrier": "{carrier-name}",
  "bootloaderVersion": "Build.BOOTLOADER",
  "brand": "Build.BRAND",
  "model": "Build.MODEL",
  "fingerprint": "Build.FINGERPRINT",
  "radioVersion": "Build.getRadioVersion()",
  "buildTags": "Build.TAGS",
  "buildType": "Build.TYPE",
  "buildDevice": "Build.DEVICE",
  "buildId": "Build.ID",
  "buildDisplayId": "Build.DISPLAY",
  "buildIncrementalVersion": "Build.VERSION.INCREMENTAL",
  "releaseVersion": "Build.VERSION.RELEASE",
  "otaSourceSha1": "{sha1-of-source}",
  "network": "{network-type}",
  "apkVersion": "{OTA-app-version}",
  "provisionedTime": "{provision-time}",
  "incrementalVersion": "Build.VERSION.INCREMENTAL",
  "additionalInfo": "{...}",
  "colorId": "{channel-id}",
  "apkPackageName": "com.motorola.ccc.ota",
  "OtaLibVersion": "{otalib-version}",
  "mobileModel": "ro.product.model",
  "mccmnc2": "{SIM2-MCC+MNC}",
  "imei2": "{IMEI2}"
}
```

### 3.6 BotaUpgradeSource extraInfo Additions

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/BotaUpgradeSource.smali`

Additional fields in the extraInfo for check requests:
```json
{
  "autoDownloadPolicySet": "...",
  "disableOtaUpdatePolicySet": "...",
  "isDeviceUnderFreezePeriod": "...",
  "clientState": "{current-client-state}",
  "pollingFeature": "...",
  "pollingIntervalInMilliSeconds": "...",
  "prevSessionTrackingId": "{previous-tracking-id}",
  "userTriggerLaunchPoint": "...",
  "smartUpdateStats": "...",
  "eolStats": "...",
  "historyStats": "...",
  "whyUpdateMattersStats": "...",
  "vabMergeCheckUpdateAfterDeviceCorrupted": "...",
  "isPRC": "{true|false}"
}
```

### 3.7 identityInfo Fields

**File:** `smali_classes2/com/motorola/ccc/ota/utils/BuildPropReader.smali`

```json
{
  "serialNumber": "{device-serial-number}"
}
```

### 3.8 Check Response Structure (CheckResponseBuilder.smali)

```json
{
  "proceed": true,
  "context": "ota",
  "contextKey": "{key}",
  "contentTimestamp": 1234567890,
  "reportingTags": "{tags}",
  "trackingId": "{tracking-id}",
  "pollAfterSeconds": 86400,
  "content": { /* OTA update content */ },
  "smartUpdateBitmap": "7",
  "settings": { /* server-pushed settings */ },
  "uploadFailureLogs": true
}
```

### 3.9 contextKey Construction

**File:** `smali_classes2/com/motorola/ccc/ota/utils/BuildPropReader.smali`

The context key is constructed from system properties:
- `ro.build.product` — product name
- `ro.mot.build.guid` — Motorola build GUID
- `ro.build.id` — Build ID

---

## 4. Authentication and Headers

### 4.1 WebServiceThread Headers

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebServiceThread.smali`

The `headers` map is passed into the WebServiceThread constructor and forwarded to Volley:
```java
WebServiceThread(context, url, webRequest, retryHandler, responseHandler, headers) {
    this.headers = headers;  // Map<String, String>
}
```

These headers are passed directly to the Volley `JsonObjectRequest.getHeaders()` override.

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3.smali`

The custom Volley `JsonObjectRequest` subclass overrides `getHeaders()` to return whatever headers map was passed in.

### 4.2 x-moto Headers (WebServiceThread.smali)

Response headers read by WebServiceThread:

| Header | Direction | Purpose |
|---|---|---|
| `x-moto-accept-verification-methods` | Response (401) | Server tells client which auth method to use |
| `x-moto-backoff` | Response | Server-specified backoff time in milliseconds |

### 4.3 401 Unauthorized Flow

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebServiceThread.smali` (lines ~340-400)

```java
// Pseudocode from smali:
if (responseCode == 401) {
    headers = response.getHeaders();
    verificationType = headers.get("x-moto-accept-verification-methods");
    if (verificationType == null) {
        log("Unauthorized response with no verification-methods, can't proceed further");
        return FAILURE;
    }
    log("server sent verificationMethod as " + verificationType);
    // Stores mVerificationType for subsequent auth attempt
}
```

The server sends a 401 with `x-moto-accept-verification-methods` header to indicate what auth mechanism the client should use.

### 4.4 Redirect Handling (302/307)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebServiceThread.smali`

HTTP status codes 302 (0x12e) and 307 (0x133) trigger redirect handling:
```java
if (statusCode == 302 || statusCode == 307) {
    String location = headers.get("Location");
    // Follow redirect with backoff retry
}
```

### 4.5 Google Cloud Storage Authorization (DownloadService.smali)

**File:** `smali_classes2/com/motorola/otalib/downloadservice/DownloadService.smali` (lines ~255-320)

```java
// Pseudocode:
boolean addAuthorizationHeader(String url) {
    URI uri = new URI(url);
    String scheme = uri.getScheme();
    String host = uri.getHost();
    if (scheme.equals("https") && host.equals("storage.googleapis.com")) {
        return true;  // Signals that auth header should be added
    }
    return false;
}
```

**This confirms OTA packages are hosted on Google Cloud Storage (`storage.googleapis.com`).**

### 4.6 FileUploadService Auth Headers (Log Upload)

**File:** `smali_classes2/com/motorola/ccc/ota/ui/FileUploadService.smali`

For log file uploads:
```
Content-Type: application/octet-stream
X-Moto-Auth-Sign: d928bee85b45cffe7b0f21084dd3d20e
Secretkey: SecretMOTOKey321
```

### 4.7 Download Request Headers (AdvancedFileDownloader.smali)

**File:** `smali_classes2/com/motorola/otalib/downloadservice/download/AdvancedFileDownloader.smali`

Standard download headers set on HttpURLConnection:
```
If-Match: {ETag}
Range: bytes={offset}-
Accept-Encoding: identity
Connection: close
```

Plus any headers from the `headers` list added via `addHeader()`.

### 4.8 IPv4 Preference for China/Dev Servers

**File:** `smali_classes2/com/motorola/otalib/downloadservice/download/AdvancedFileDownloader.smali`

```java
if (downloadUrl.contains("svcmot") || downloadUrl.contains("blurdev")) {
    System.setProperty("java.net.preferIPv4Stack", "true");
    System.setProperty("java.net.preferIPv6Addresses", "false");
}
```

---

## 5. Hardcoded Keys, Secrets, and Tokens

### 5.1 App ID and App Secret

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/settings/Configs.smali` (also in LibConfigs.smali)

| Setting | Key | Value |
|---|---|---|
| APPIID | `com.motorola.ccc.ota.botaplugin.appid` | `MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ` |
| APPSECERET | `com.motorola.ccc.ota.botaplugin.appsecret` | `zdG4h4k2NOm6MSh` |

These are identical in both `Configs.smali` and `LibConfigs.smali`.

### 5.2 Log Upload Auth

**File:** `smali_classes2/com/motorola/ccc/ota/ui/FileUploadService.smali`

| Header | Value |
|---|---|
| `X-Moto-Auth-Sign` | `d928bee85b45cffe7b0f21084dd3d20e` |
| `Secretkey` | `SecretMOTOKey321` |

### 5.3 Client Identity

Hardcoded client identity string:
```
clientIdentity = "motorola-ota-client-app"
```

---

## 6. File Download Flow

### 6.1 Overview

The download flow follows these steps:

1. **Check for Update** → CDS `/check` endpoint → gets `contentResponse` with `trackingId`
2. **Get Resources** → CDS `/resources` endpoint → gets download URLs + headers per network type
3. **Report State** → CDS `/state` endpoint → reports download/install status
4. **Download Package** → `DownloadService` → `AdvancedFileDownloader` → HTTP download from GCS

### 6.2 Resources Response Structure (ContentResourcesBuilder.smali)

**File:** `smali_classes2/com/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder.smali`

The resources response contains different download URLs and headers for different network types:

```json
{
  "proceed": true,
  "trackingId": "{tracking-id}",
  "wifiUrl": "https://storage.googleapis.com/...",
  "wifiHeaders": { "key": "value", ... },
  "cellUrl": "https://storage.googleapis.com/...",
  "cellHeaders": { "key": "value", ... },
  "adminApnUrl": "https://...",
  "adminApnHeaders": { "key": "value", ... }
}
```

### 6.3 Download URL Selection (DownloadService.smali)

**File:** `smali_classes2/com/motorola/otalib/downloadservice/DownloadService.smali`

The `getDownloadUrl()` method selects the URL based on current network connectivity:
```java
// Pseudocode:
String getDownloadUrl(String downloadDescriptor) {
    if (isWifiConnected())      return descriptor.get("wifiUrl");
    if (isCellConnected())      return descriptor.get("cellUrl");
    if (isAdminApnConnected())  return descriptor.get("adminApnUrl");
    return null; // "DownloadService:getDownloadUrl, no url to proceed"
}
```

Corresponding headers:
```java
JSONObject getDownloadHeaders(String downloadDescriptor) {
    if (isWifiConnected())      return descriptor.get("wifiHeaders");
    if (isCellConnected())      return descriptor.get("cellHeaders");
    if (isAdminApnConnected())  return descriptor.get("adminApnHeaders");
    return null;
}
```

### 6.4 Download Execution (AdvancedFileDownloader.smali)

**File:** `smali_classes2/com/motorola/otalib/downloadservice/download/AdvancedFileDownloader.smali`

Uses `HttpURLConnection` directly (not Volley) for binary downloads. Supports:
- **Resume downloads** via `Range: bytes={offset}-` header
- **ETag validation** via `If-Match: {etag}` header
- **Content-Range** parsing for total file size
- **Transfer-Encoding: chunked** detection
- **CRC verification** (creates `.crc` files)
- **Backoff and retry** via `BackoffValueProvider`

### 6.5 Streaming Update / UpdaterEngine Download

**File:** `smali_classes2/com/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder.smali`

For A/B (seamless) updates, downloads go through Android's UpdateEngine:
```java
DownloadRequestToUE build(NetworkDetails networkDetails, JSONObject metadata) {
    String downloadUrl = networkDetails.getDownloadUrl();
    long[] offsetAndSize = getPayloadOffsetAndSize(metadata);
    String[] headers = getHeaderKeyValuePair(metadata, networkDetails);
    return new DownloadRequestToUE(url, offset, size, headers);
}
```

### 6.6 Payload Metadata Download (PayloadMetaDataDownloader.smali)

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader.smali`

For streaming updates, the payload metadata is downloaded separately:
```json
{
  "additionalInfo": {
    "payload_metadata": {
      "offset": 12345,
      "size": 67890
    }
  }
}
```

### 6.7 BotaDownloadHandler Error Handling

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/BotaDownloadHandler.smali`

Error codes handled for download failures:
- `400 Bad Request`
- `401 Unauthorized`
- `403 Forbidden`
- `404 Not Found`
- `410 Gone`
- `412 Precondition failed` (ETag mismatch)
- `429 Too many requests`

All trigger `ResetSMToGettingDescriptor` to re-fetch the download descriptor.

### 6.8 SSL/TLS Configuration

**File:** `smali_classes2/com/motorola/otalib/downloadservice/DownloadService.smali`

Uses custom SSL configuration:
```java
SSLContext ctx = SSLContext.getInstance("TLS");
TrustManagerFactory tmf = TrustManagerFactory.getInstance(defaultAlgorithm);
tmf.init(keyStore());
ctx.init(null, tmf.getTrustManagers(), null);
```

---

## 7. WebService Request Flow

### 7.1 Volley-based HTTP Client

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebServiceThread.smali`

The CDS web service uses Android's **Volley** library for HTTP requests:

```java
// Pseudocode from smali:
Future<JSONObject> makeWebServiceCallWithVolley(WebRequest webRequest) {
    JSONObject requestBody = new JSONObject(webRequest.getPayload().getData());
    
    WaitForResponseTask task = new WaitForResponseTask(
        service,           // Context
        mUrl,              // Constructed URL
        requestBody,       // JSON payload
        httpMethod,        // "post"
        queryParams,       // Map<String,String>
        headers,           // Map<String,String> - auth/custom headers
        mRequestQueue      // Volley RequestQueue
    );
    
    return requestExecutor.submit(task);
}
```

### 7.2 WebRequest Structure (WebRequestBuilder.smali)

```json
{
  "request": {
    "url": "https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/{key}",
    "retries": 3,
    "httpMethod": "post",
    "queryParams": { },
    "payload": {
      "data": "{JSON-string-of-CheckRequest}"
    },
    "proxyHost": "",
    "proxyPort": 0
  }
}
```

### 7.3 Proxy Support

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebService.smali`

Uses `CDSHurlStack` with optional proxy for Volley requests. Proxy configured via:
- `ota.service.update.cds.httpProxyHost`
- `ota.service.update.cds.httpProxyPort`
- `ota.service.update.download.httpProxyHost`
- `ota.service.update.download.httpProxyPort`

### 7.4 Backoff and Retry

**File:** `smali_classes2/com/motorola/otalib/cdsservice/WebServiceThread.smali`

Default backoff values: `"30000,180000"` (30s, 180s)

Backoff uses server-sent `x-moto-backoff` header if present, otherwise falls back to incremental backoff provider.

5xx errors trigger backoff and retry.

---

## 8. ThinkShield / Enterprise (ASC) Integration

**File:** `smali_classes2/com/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils.smali`

Uses ContentProvider-based queries to enterprise adapter:
```
content://com.motorola.enterprise.adapter.service.asc.provider/GET_ASC_INFO
content://com.motorola.enterprise.adapter.service.asc.provider/GET_ASC_VERSION
content://com.motorola.enterprise.adapter.service.asc.provider/GET_CAMPAIGN_TYPE
```

Key ASC (Advanced Security Configuration) fields:
- `ASC_STATUS_STRING`
- `ASC_CHK_DISABLE_STATUS`
- `ALLOW_LIST` / `BLOCK_LIST`
- `CRITICAL_UPDATE_REMINDER`
- `CRITICAL_UPDATE_DEFER_COUNT`
- `SHOW_PRE_DOWNLOAD_DIALOG`
- Campaign types: `STANDALONE`, `MDM`

---

## 9. Configuration Settings Summary

### 9.1 Key Configs (Configs.smali)

| Config | Default | Description |
|---|---|---|
| `MASTER_CLOUD` | `getMasterCloud()` | CDS server |
| `CHECK_FOR_UPGRADE_URL` | `cds/upgrade/1/check` | Check endpoint |
| `DOWNLOAD_DESCRIPTOR_URL` | `cds/upgrade/1/resources` | Resources endpoint |
| `UPGRADE_STATE_URL` | `cds/upgrade/1/state` | State endpoint |
| `OTA_CONTEXT` | `ota` | Context identifier |
| `BACKOFF_VALUES` | `30000,180000` | Retry backoff (ms) |
| `DEFAULT_ANNOY` | `360` | Annoy interval (min) |
| `NO_POLLING_VALUE_FROM_SERVER` | `86400` | Default polling (sec) |
| `DEFAULT_MIN_BATTERY_LEVEL` | `20` | Min battery % |
| `DEFAULT_WIFI_DISCOVER_TIME` | `82800` | WiFi discover timeout (sec) |
| `MAX_UPGRADE_ATTEMPT_COUNT` | `1` | Max install attempts |
| `DEFAULT_INSTALL_COUNT_DOWN_SECS` | `61` | Install countdown |
| `CHECK_ORDER` | `bota` | Update source priority |
| `DEFAULT_SMART_UPDATE_BITMAP` | `7` | Smart update config |

### 9.2 LibConfigs Additional Settings

| Config | Default | Description |
|---|---|---|
| `APPIID` | `MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ` | App identifier |
| `APPSECERET` | `zdG4h4k2NOm6MSh` | App secret |
| `PROVISION_TIME` | (empty) | Device provision time |
| `DEVICE_POLLING_MAPPER` | (empty) | Polling configuration |
| `OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS` | (empty) | Download retries |
| `OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS` | (empty) | Exception retries |
| `DOWNLOAD_DESCRIPTOR` | (empty) | Cached download descriptor |

---

## 10. Changes from Previous Versions — Notable Findings

### 10.1 Target SDK 36 (Android 16)
This version targets Android 16 (SDK 36), the highest seen, with minSDK 34 (Android 14). This means it drops support for Android 13 and below.

### 10.2 Kotlin Coroutines
The app includes `kotlinx.coroutines` classes, indicating parts of the app have been modernized from pure Java to Kotlin.

### 10.3 Virtual A/B Support
**File:** `smali_classes2/com/motorola/ccc/ota/utils/BuildPropReader.smali`
```
ro.virtual_ab.enabled
ro.virtual_ab.compression.enabled
```

### 10.4 Streaming Update Flow
The `StreamingUpdate` class and `UEDownloadRequestBuilder` indicate support for Android's streaming A/B update mechanism, where the UpdateEngine downloads and applies the update simultaneously.

### 10.5 Smart Update Feature
The `smartUpdateBitmap` in the check response and `SmartUpdateKey` processing indicate a server-controlled smart update scheduling feature.

### 10.6 EOL (End of Life) Support
`EOLFragment` and `eolStats` in extraInfo indicate the app can display end-of-life notices for devices that will no longer receive updates.

### 10.7 No DLMGR/EDGECAST CDN References
Unlike older versions, **no references to "dlmgr" or "edgecast" CDN hosts** were found in this version. Downloads appear to exclusively use Google Cloud Storage (`storage.googleapis.com`).

### 10.8 Dual-SIM Support
The `imei2` and `mccmnc2` fields in extraInfo confirm dual-SIM device support.

---

## 11. Complete File Reference

| File | Contains |
|---|---|
| `BuildConfig.smali` | App version, package info |
| `sources/bota/settings/Configs.smali` | All CDS URLs, server settings, feature flags |
| `sources/bota/settings/BotaSettings.smali` | Runtime settings, server selection |
| `otalib/cdsservice/utils/CDSUtils.smali` | Hardcoded server URLs, base URLs |
| `otalib/common/utils/UpgradeUtils.smali` | All server hostname constants |
| `otalib/cdsservice/UrlConstructor/CheckUrlConstructor.smali` | Check URL pattern |
| `otalib/cdsservice/UrlConstructor/ResourcesUrlConstructor.smali` | Resources URL pattern |
| `otalib/cdsservice/UrlConstructor/StateUrlConstructor.smali` | State URL pattern |
| `otalib/cdsservice/WebServiceThread.smali` | HTTP request execution, auth flow, backoff |
| `otalib/cdsservice/WaitForResponseTask.smali` | Volley request wrapper |
| `otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3.smali` | Custom Volley request with headers |
| `otalib/cdsservice/webdataobjects/builders/WebRequestBuilder.smali` | WebRequest JSON structure |
| `otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder.smali` | Check request JSON |
| `otalib/cdsservice/requestdataobjects/builders/ResourcesRequestBuilder.smali` | Resources request JSON |
| `otalib/cdsservice/requestdataobjects/builders/StateRequestBuilder.smali` | State request JSON |
| `otalib/cdsservice/requestdataobjects/builders/UrlRequestBuilder.smali` | URL request fields |
| `otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder.smali` | Check response parsing |
| `otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder.smali` | Download URL/header parsing |
| `otalib/downloadservice/DownloadService.smali` | Download orchestration, GCS auth |
| `otalib/downloadservice/download/AdvancedFileDownloader.smali` | HTTP file download, resume, ETag |
| `otalib/downloadservice/download/PackageDownloader.smali` | Download factory |
| `otalib/main/checkUpdate/CheckUpdateHandler.smali` | Check update orchestration, server URL selection |
| `otalib/main/Settings/LibConfigs.smali` | Library-level configs, APPIID, APPSECERET |
| `utils/BuildPropReader.smali` | Device info, extra info, identity info, context key |
| `sources/bota/BotaUpgradeSource.smali` | Update check flow, extraInfo construction |
| `sources/bota/BotaDownloadHandler.smali` | Download error handling |
| `sources/bota/PayloadMetaDataDownloader.smali` | Streaming update metadata |
| `sources/bota/thinkshield/ThinkShieldUtils.smali` | Enterprise/MDM integration |
| `installer/updaterEngine/download/UEDownloadRequestBuilder.smali` | UpdateEngine download setup |
| `ui/CloudPickerActivity.smali` | Debug server picker |
| `ui/FileUploadService.smali` | Log upload with auth headers |

---

*Analysis performed on decompiled smali from APK version 36.00.035 (versionCode 3600035)*
