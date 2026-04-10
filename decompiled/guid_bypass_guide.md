# Motorola OTA Download — GUID Bypass Guide

**Date**: April 2026  
**APK**: com.motorola.ccc.ota v36.00.035  

---

## The GUID Problem

The CDS (Content Delivery Service) requires a device-specific GUID in the URL:
```
POST https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/{GUID}
```

The GUID comes from `ro.mot.build.guid` (mapped to `otaSourceSha1` in the request body).

**Tested bypasses that DON'T work:**
- Empty GUID → `UPGRADE_RESOURCE_NOT_FOUND`
- Wildcard (`*`, `.`, `?`) → `UPGRADE_RESOURCE_NOT_FOUND` or `proceed=false`
- Dummy values (`0`, `null`, `latest`, `lamu_g`) → `proceed=false`
- Body `otaSourceSha1` override (URL GUID is authoritative)
- GAE contentcheck API → requires Google OAuth
- Different contexts (`bota`, `fota`, `d2d`, etc.) → `proceed=false`
- CDS v3/v4 endpoints → `UPGRADE_RESOURCE_NOT_FOUND`

**Key finding**: The URL GUID is the **sole lookup key**. CDS treats the request body's `otaSourceSha1` as validation only — the URL GUID must match exactly.

**GUID is NOT derivable**: GUIDs are server-assigned, not computed from build fingerprint, version, or device model. Cannot be predicted from public info.

---

## Method 1: EDGECAST Direct Download (NO GUID, NO CDS)

**7 of 9** delta OTA packages for moto g15 (lamu_g) are publicly hosted on EDGECAST CDN with **zero authentication**:

```bash
# Step 3: v65-5 → v100 (134.1 MB)
curl -o delta_65-5_to_100.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-65-5_b608f4-VVTA35.51-100_e51bc9_release-keys.zip.b3cfce34feb0391c2e02142cf2a56291'

# Step 4: v100 → v114 (883.3 MB)
curl -o delta_100_to_114.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-100_e51bc9-VVTA35.51-114_8a4eec_release-keys.zip.6774dc67afbd5464234d12c64aeca941'

# Step 5: v114 → v124 (68.4 MB)
curl -o delta_114_to_124.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-114_8a4eec-VVTA35.51-124_777ecb_release-keys.zip.9b767d6a2345dc0ce6e0bf88e7946fc4'

# Step 6: v124 → v137 (75.9 MB)
curl -o delta_124_to_137.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-124_777ecb-VVTA35.51-137_7eabca_release-keys.zip.8e7880c5ce01092d8ac52cad892c96ed'

# Step 7: v137 → v137-2 (22.2 MB)
curl -o delta_137_to_137-2.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-137_7eabca-VVTAS35.51-137-2_f1c510_release-keys.zip.64c466021026a4634a6857e43b2db8db'

# Step 8: v137-2 → v137-10 (27.3 MB)
curl -o delta_137-2_to_137-10.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTAS35.51-137-2_f1c510-VVTA35.51-137-10_cabf9d_release-keys.zip.c795dc27c2b74379c3593f0f5d48eff2'

# Step 9: v137-10 → v137-10-3 (18.5 MB) — LATEST
curl -o delta_137-10_to_137-10-3.zip \
  'https://dlmgredg-vz.gtm.svcmot.com/delta-Ota_Version_lamu_g_VVTA35.51-137-10_cabf9d-VVTAS35.51-137-10-3_4ee65d_release-keys.zip.ea4aff8e44adc8aed2ff5207566f018b'
```

**Supports HTTP 206 Range** for resume:
```bash
curl -C - -o delta_100_to_114.zip 'https://dlmgredg-vz.gtm.svcmot.com/...'
```

**Limitations:**
- Steps 1-2 (oldest) return 404 on EDGECAST (only on DLMGR signed URLs)
- PackageIDs must be discovered first (via CDS chain-walk)
- No directory listing — must know exact packageID

---

## Method 2: CDS Chain-Walk (needs ONE starting GUID)

From a single GUID, discover the **entire OTA chain** for any device model:

```bash
# Starting GUID for lamu_g (moto g15): 0d5cc74421f2e8a
GUID="0d5cc74421f2e8a"

curl -s -X POST "https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/${GUID}" \
  -H 'User-Agent: com.motorola.ccc.ota/36.00.035' \
  -H 'Content-Type: application/json' \
  -H 'x-moto-accept-verification-methods: CID,GOOGLE_EMAIL' \
  -d '{
    "id": "chain-walk",
    "contentTimestamp": 0,
    "deviceInfo": {"country": "GB", "region": "en_GB"},
    "extraInfo": {
      "carrier": "retgb",
      "model": "moto g15",
      "fingerprint": "motorola/lamu_g/lamu_g:15/VVTAS35.51-18-6/f6ef94:user/release-keys",
      "buildTags": "release-keys",
      "buildType": "user",
      "buildDevice": "lamu_g",
      "buildId": "VVTAS35.51-18-6",
      "otaSourceSha1": "'${GUID}'",
      "vitalUpdate": false
    },
    "identityInfo": {"clientIdentity": ""},
    "triggeredBy": "user",
    "idType": ""
  }' | python3 -m json.tool
```

**Response includes:**
- `content.otaTargetSha1` = **GUID for NEXT version** (use as input for next step)
- `content.packageID` = direct download ID for EDGECAST
- `content.contentResources[].url` = signed download URL (DLMGR 600s TTL or EDGECAST permanent)
- `content.version` = target version string

**Chain-walk algorithm:**
1. Send request with current GUID
2. Extract `otaTargetSha1` from response → this is the NEXT GUID
3. Extract `packageID` → save for EDGECAST direct access
4. Update `buildId`, `fingerprint`, `otaSourceSha1` with new version info
5. Repeat until `content` is null (end of chain)

---

## Method 3: Get Starting GUIDs

### From a physical device:
```bash
adb shell getprop ro.mot.build.guid
```

### Known GUID Database (lamu_g / moto g15):

| Version | GUID | Build Increment |
|---------|------|-----------------|
| VVTAS35.51-18-6 | `0d5cc74421f2e8a` | f6ef94 |
| VVTA35.51-28-15 | `23d670d5d06f351` | bd4d30 |
| VVTA35.51-65-5 | `a363e2a67728d8a` | b608f4 |
| VVTA35.51-100 | `190325d96009ac5` | e51bc9 |
| VVTA35.51-114 | `3501e9086e77dc1` | 8a4eec |
| VVTA35.51-124 | `80b99133e0ddb3f` | 777ecb |
| VVTAS35.51-137 | `2d94974667acf1d` | 7eabca |
| VVTAS35.51-137-2 | `39c2283287d0945` | f1c510 |
| VVTA35.51-137-10 | `19cfbaf29ab2e36` | cabf9d |
| VVTAS35.51-137-10-3 | `83436843c200809` | 4ee65d |
| VVTAS35.51-137-2-1 | `2a30b04` | — |

### For new device models:
1. Search public firmware databases (lolinet.com mirrors)
2. Extract from factory firmware images
3. Get from any user with the device

---

## Architecture Diagram

```
                         ┌─────────────┐
                         │   Device    │
                         │ ro.mot.build│
                         │   .guid     │
                         └──────┬──────┘
                                │
                    GUID = "0d5cc74421f2e8a"
                                │
                    ┌───────────▼───────────┐
                    │   CDS /check          │
                    │ URL: /key/{GUID}      │──── GUID is MANDATORY
                    │ Body: otaSourceSha1   │     in URL path
                    └───────────┬───────────┘
                                │
                    Response includes:
                    ├── otaTargetSha1 = NEXT GUID
                    ├── packageID
                    └── contentResources[].url
                                │
              ┌─────────────────┼─────────────────┐
              ▼                 ▼                  ▼
     ┌────────────┐    ┌──────────────┐   ┌──────────────┐
     │   DLMGR    │    │  EDGECAST    │   │    GCS       │
     │ Signed URL │    │  Public URL  │   │ Auth Headers │
     │  600s TTL  │    │  Permanent   │   │ from CDS     │
     │ Steps 1-2  │    │  Steps 3-9   │   │  (v36 new)   │
     └────────────┘    └──────────────┘   └──────────────┘
                              │
                    NO GUID NEEDED
                    Direct by packageID
```

---

## Comparison of Methods

| Method | Needs GUID | Needs CDS | Auth Required | Coverage |
|--------|-----------|-----------|---------------|----------|
| EDGECAST direct | ❌ No | ❌ No | ❌ None | 7/9 steps (recent) |
| CDS chain-walk | ⚠️ ONE | ✅ Yes | UA only | All steps + URLs |
| CDS + DLMGR | ⚠️ ONE | ✅ Yes | UA + signed URL | All steps |
| GCS download | ⚠️ ONE | ✅ Yes | CDS headers | v36+ only |
| `adb getprop` | Physical device | ❌ No | Device access | Current version |

---

## CDS Request Requirements

**Mandatory:**
- URL: `POST /cds/upgrade/1/check/ctx/ota/key/{GUID}`
- Header: `User-Agent` must contain `com.motorola.ccc.ota` (any version suffix works)
- Header: `Content-Type: application/json`
- Body: Valid JSON with `id`, `contentTimestamp`, `deviceInfo`, `extraInfo`, `triggeredBy`, `idType`
- Body: `extraInfo.otaSourceSha1` should match URL GUID

**Optional (can be fake):**
- `x-moto-accept-verification-methods: CID,GOOGLE_EMAIL`
- `x-moto-verification-info: nonce=xxx,method=CID`
- `extraInfo.imei`, `serialNumber`, `carrier` (affects which chain branch)

**Server selection:**
- Production ROW: `moto-cds.appspot.com`
- Production China: `moto-cds.svcmot.cn`
- Singapore: `moto-cds-sg.svcmot.com` (same backend)
- All three return identical content
