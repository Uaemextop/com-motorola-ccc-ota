# Motorola OTA Update Analyzer

Herramienta de análisis y consulta de actualizaciones OTA (Over-The-Air) para
dispositivos Motorola, construida mediante ingeniería inversa del APK
`com.motorola.ccc.ota` (MotoOta.apk).

## Arquitectura

El proyecto sigue una **arquitectura limpia** con separación clara de
responsabilidades:

```
ota_analyzer/
├── __init__.py          # Paquete raíz
├── __main__.py          # Punto de entrada CLI
├── config/              # Configuración de servidores y endpoints
│   ├── __init__.py      #   Servidores CDS por región/entorno
│   └── settings.py      #   Parámetros de la app (LibConfigs.smali)
├── models/              # Modelos de datos
│   ├── device_info.py   #   DeviceInfo, ExtraInfo, IdentityInfo
│   ├── request.py       #   CheckRequest (payload JSON)
│   └── response.py      #   CheckResponse (respuesta del servidor)
├── auth/                # Autenticación
│   └── authenticator.py #   Headers HTTP de autenticación
├── client/              # Cliente HTTP para la API CDS
│   └── ota_client.py    #   OTAClient con reintentos y back-off
├── analysis/            # Análisis de bytecode y binarios
│   ├── smali_parser.py  #   Parser de archivos smali
│   └── binary_analyzer.py # Desensamblador con Capstone (.so)
└── utils/               # Utilidades
    └── url_builder.py   #   Constructor de URLs CDS
```

## Instalación

```bash
pip install -r requirements.txt
```

Las dependencias principales son:
- **requests** – Cliente HTTP
- **capstone** – Motor de desensamblado para análisis de librerías nativas (.so)

## Uso

### Enumerar toda la cadena OTA (de más antigua a más reciente)

El comando `enumerate-updates` recorre la cadena completa de actualizaciones
OTA delta empezando desde un build base (GUID) y siguiendo el campo
`otaTargetSha1` de cada respuesta hasta llegar al build más reciente:

```bash
python -m ota_analyzer enumerate-updates \
    --model "moto g05" \
    --fingerprint "motorola/lamul_g/lamul:15/VVTA35.51-18-6/1e9f09:user/release-keys" \
    --guid "0d5cc74421f2e8a" \
    --serial "ZY32LNRW97" \
    --imei "359488357396203" \
    --mccmnc "334020" \
    --carrier "amxmx" \
    --hardware "mt6768" \
    --bootloader "0x0908" \
    --radio "MOLY.LR12A.R3.MP.V340.4.P8" \
    --region prc \
    --output ota_chain.json
```

El resultado incluye para cada paso: versiones fuente/destino, GUIDs,
tamaño del delta, URLs de descarga, MD5, tipo de actualización (MR/SMR),
y timestamps de build.

#### Ejemplo de salida

```
  #   Source                   Target                         Size Type
  ─── ──────────────────────── ──────────────────────── ────────── ─────
  1   VVTA35.51-18-6           VVTA35.51-28-15            105.9 MB MR
  2   VVTA35.51-28-15          VVTA35.51-65-5             338.5 MB MR
  3   VVTA35.51-65-5           VVTA35.51-100              134.1 MB MR
  4   VVTA35.51-100            VVTAS35.51-100-3            19.0 MB SMR
  5   VVTAS35.51-100-3         VVTA35.51-127              916.7 MB MR
  6   VVTA35.51-127            VVTA35.51-137               70.5 MB MR
  7   VVTA35.51-137            VVTAS35.51-137-2            22.2 MB SMR
  8   VVTAS35.51-137-2         VVTAS35.51-137-2-1          15.2 MB SMR
```

#### Equivalente con curl

```bash
# Paso 1: Consultar update desde el build base
curl -s -X POST \
  'https://moto-cds.svcmot.cn/cds/upgrade/1/check/ctx/ota/key/0d5cc74421f2e8a' \
  -H 'Content-Type: application/json; charset=utf-8' \
  -H 'User-Agent: Dalvik/2.1.0 (Linux; U; Android 15; moto g05 Build/VVTA35.51-18-6)' \
  -d '{
    "id": "ZY32LNRW97",
    "contentTimestamp": 0,
    "deviceInfo": {
      "manufacturer": "motorola", "hardware": "mt6768",
      "brand": "motorola", "model": "moto g05", "product": "",
      "os": "Linux:null:null", "osVersion": "15",
      "country": "", "region": "US", "language": "en", "userLanguage": "es_US"
    },
    "extraInfo": {
      "clientIdentity": "motorola-ota-client-app",
      "carrier": "amxmx", "brand": "motorola", "model": "moto g05",
      "fingerprint": "motorola/lamul_g/lamul:15/VVTA35.51-18-6/1e9f09:user/release-keys",
      "buildDevice": "lamul", "buildId": "VVTA35.51-18-6",
      "buildDisplayId": "VVTA35.51-18-6",
      "buildIncrementalVersion": "1e9f09",
      "otaSourceSha1": "0d5cc74421f2e8a",
      "network": "WIFI", "apkVersion": 3500094,
      "imei": "359488357396203", "mccmnc": "334020",
      "ro.virtual_ab.enabled": true
    },
    "identityInfo": {"serialNumber": "ZY32LNRW97"},
    "triggeredBy": "user",
    "idType": "serialNumber"
  }' | python3 -m json.tool

# La respuesta contiene:
#   "otaTargetSha1": "23d670d5d06f351"  ← GUID del siguiente build
#   "contentResources": [{"url": "https://dlmgr.gtm.svcmot.com/..."}]
#
# Para el siguiente paso, usar otaTargetSha1 como nuevo /key/ y otaSourceSha1:
curl -s -X POST \
  'https://moto-cds.svcmot.cn/cds/upgrade/1/check/ctx/ota/key/23d670d5d06f351' \
  -H 'Content-Type: application/json; charset=utf-8' \
  -d '{ ... "otaSourceSha1": "23d670d5d06f351", "buildId": "VVTA35.51-28-15" ... }'
# Repetir hasta que "proceed" sea false.
```

### Consultar actualizaciones OTA (un solo paso)

```bash
python -m ota_analyzer check-update \
    --model "moto g05" \
    --fingerprint "motorola/lamul_g/lamul:15/VVTA35.51-18-6/1e9f09:user/release-keys" \
    --guid "0d5cc74421f2e8a" \
    --serial "ZY32LNRW97" \
    --imei "359488357396203" \
    --mccmnc "334020" \
    --carrier "amxmx" \
    --hardware "mt6768" \
    --region prc
```

### Analizar bytecode smali

Buscar cadenas de texto (URLs, claves, endpoints):

```bash
python -m ota_analyzer analyze-smali smali_classes2 \
    --search "https?://" \
    --path-filter "com/motorola"
```

Buscar métodos por nombre:

```bash
python -m ota_analyzer analyze-smali smali_classes2 \
    --methods "checkUpdate|download" \
    --path-filter "com/motorola/otalib"
```

Extraer jerarquía de clases:

```bash
python -m ota_analyzer analyze-smali smali_classes2 \
    --path-filter "com/motorola/ccc/ota/ui"
```

### Analizar librerías nativas (.so) con Capstone

Desensamblar instrucciones:

```bash
python -m ota_analyzer analyze-binary lib/arm64-v8a/libnative.so \
    --arch arm64 --offset 0x1000 --size 512
```

Extraer cadenas de texto del binario:

```bash
python -m ota_analyzer analyze-binary lib/arm64-v8a/libnative.so --strings
```

Buscar patrones de autenticación:

```bash
python -m ota_analyzer analyze-binary lib/arm64-v8a/libnative.so --auth-patterns
```

## Protocolo CDS — Cómo funciona la cadena OTA

El servidor CDS (Content Delivery Service) de Motorola enruta las
actualizaciones OTA usando un **GUID** de 15 caracteres hexadecimales
(`ro.mot.build.guid`). Cada build tiene un GUID único.

### Mecanismo de cadena

```
GUID_A (build viejo) ──check──→ servidor ──→ {otaTargetSha1: GUID_B, version: "nuevo"}
GUID_B (build nuevo) ──check──→ servidor ──→ {otaTargetSha1: GUID_C, version: "más nuevo"}
GUID_C (último)      ──check──→ servidor ──→ {proceed: false}  ← no hay más updates
```

- El campo `otaSourceSha1` en el request y la URL `/key/{GUID}` identifican el build actual
- El campo `otaTargetSha1` en la respuesta da el GUID del siguiente build
- El campo `minVersion` / `flavour` confirma la versión base (fábrica)
- **No hay forma de obtener builds anteriores al GUID de fábrica** — el
  servidor solo conoce la cadena hacia adelante

### Campos clave del body que afectan la respuesta

Verificado con curl — estos son los campos que **sí importan** y los que no:

| Campo (extraInfo)      | ¿Afecta respuesta? | Notas                                      |
|------------------------|--------------------|---------------------------------------------|
| `carrier`              | **SÍ (crítico)**   | El campo más importante. Sin carrier válido no hay update. |
| `otaSourceSha1`        | SÍ                 | Debe coincidir con el `/key/` de la URL     |
| `buildId`              | no                 | Servidor lo ignora para routing             |
| `fingerprint`          | no                 | Servidor lo ignora para routing             |
| `buildType`/`buildTags`| no                 | user/userdebug/eng todos reciben lo mismo   |
| `imei`                 | no                 | Puede ser `IMEI_NOT_AVAILABLE`              |
| `mccmnc`               | no                 | Puede ser `MCCMNC_NOT_AVAILABLE`            |
| `network`              | no                 | WIFI/CELL/5G todos reciben lo mismo         |
| `vitalUpdate`          | SÍ                 | `true` → `proceed: false` (bloquea update)  |
| `contentTimestamp`      | no                 | Servidor lo ignora                          |
| `clientState`          | no                 | Servidor lo ignora                          |
| `userLocation`         | no                 | Servidor lo ignora                          |

### Carrier: campo crítico para el routing

El campo `carrier` en `extraInfo` determina si el servidor entrega la
actualización. Verificado con curl sobre el mismo GUID:

Se probaron los **157 carriers oficiales** de Motorola (fuente: `motorola-carrier-channel-ids.dtsi`
del kernel) contra el servidor CDS. Resultado:

| Resultado | Carriers (23 con update, 10 bloqueados, 124 sin contenido) |
|-----------|-------------------------------------------------------------|
| ✅ Update | `amxbr`, `amxmx`, `amxla`, `amxpe`, `tefbr`, `tefmx`, `retbr`, `retla`, `avaco`, `openmx`, `altmx`, `openpe`, `reteu`, `retgb`, `o2gb`, `eegb`, `vfeu`, `3gb`, `timit`, `teleu`, `pluspl`, `retru`, **`demogb`** |
| 🔒 Bloqueado | `amxar`, `amxco`, `timbr`, `retar`, `attmx`, `opencl`, `retapac`, `oraeu`, `retin`, `retjp` |
| ❌ Sin contenido | Los otros 124 carriers (retus, vzw, tmo, att, sprint, etc.) |

### 9 cadenas de firmware diferentes por carrier

Se caminó la cadena completa para los 23 carriers con update.
**Hay 9 cadenas de firmware distintas**:

| Cadena | Carriers | Ruta de versiones | Último build |
|--------|----------|-------------------|--------------|
| 1 | `tefmx`, `retla`, `avaco`, `openmx`, `altmx`, `openpe` | →28-15→65-5→100→**100-3**→124→137→137-2→137-2-1 | VVTAS35.51-137-2-1 |
| 2 | `retgb`, `o2gb`, `eegb`, `vfeu`, `3gb`, **`demogb`** | →28-15→65-5→100→**114**→124→137→137-2→**137-10**→**137-10-3** | VVTAS35.51-137-10-3 |
| 3 | `amxbr`, `tefbr`, `retbr` | →28-15→**28-24**→**65-12**→100→114→124→137→137-2→137-2-1 | VVTAS35.51-137-2-1 |
| 4 | `amxmx`, `amxla`, `amxpe` | →28-15→65-5→100→100-3→**127**→137→137-2→137-2-1 | VVTAS35.51-137-2-1 |
| 5 | `reteu` | →28-15→65-5→100→114 (4 pasos, cadena corta) | VVTA35.51-114 |
| 6 | `timit` | →28-15→65-5→100→114→124→137 (6 pasos) | VVTA35.51-137 |
| 7 | `teleu` | →28-15→65-5→100→114→124 (5 pasos) | VVTA35.51-124 |
| 8 | `pluspl` | →28-15→65-5→100→**137**(940MB)→137-2→**137-10**→**137-10-3** | VVTAS35.51-137-10-3 |
| 9 | `retru` | →28-15→65-5→100→114→124→137→137-2→137-2-1 | VVTAS35.51-137-2-1 |

> **Hallazgo clave**: `demogb` (demo UK) sigue la misma cadena que `retgb`/`o2gb`/`eegb`
> y llega a un build diferente: **VVTAS35.51-137-10-3** (vs 137-2-1 para LATAM).

> **Hallazgo**: Los carriers de Brasil (`amxbr`, `tefbr`, `retbr`) tienen una cadena
> única con versiones intermedias exclusivas: `VVTA35.51-28-24` y `VVTA35.51-65-12`.

> **Hallazgo**: `pluspl` (Plus Poland) salta directamente de `100` a `137` con un
> delta de 940 MB, omitiendo `114` y `124`.

> **Hallazgo**: Cuando `x-cds-content-exists: true` pero `proceed: false`,
> significa que el servidor **tiene** el firmware para ese carrier, pero el
> número de serie del dispositivo no está en la whitelist
> (`serialNoListType: Inclusive`, `deploymentPlanPhase` no es `Open`).

### Campos clave de la respuesta

| Campo                    | Descripción                                    |
|--------------------------|------------------------------------------------|
| `proceed`                | `true` si hay update disponible                |
| `otaSourceSha1`          | GUID del build actual (fuente del delta)       |
| `otaTargetSha1`          | GUID del build destino                         |
| `displayVersion`         | Nombre del build destino (ej: `VVTA35.51-28-15`)|
| `size`                   | Tamaño del delta en bytes                      |
| `md5_checksum`           | MD5 del archivo delta                          |
| `contentResources`       | URLs de descarga (WIFI y CELL)                 |
| `minVersion`             | Versión mínima requerida                       |
| `updateType`             | Tipo: `MR` (release) o `SMR` (parche seguridad)|
| `forced`                 | `true` si la actualización es obligatoria       |
| `serialNoListType`       | `Inclusive` = whitelist, `NA` = todos           |
| `deploymentPlanPhase`    | `Open` = disponible para todos                 |
| `abInstallType`          | `streamingOnAb` para A/B OTA                   |
| `streamingData`          | Metadata del payload.bin (hash, offset, size)  |

### Headers de respuesta importantes

| Header                   | Descripción                                    |
|--------------------------|------------------------------------------------|
| `x-cds-content-exists`   | `true`/`false` — indica si hay contenido para el GUID+carrier |
| `cache-control`          | `no-cache, no-store, must-revalidate`          |
| `x-cloud-trace-context`  | ID de traza de Google App Engine               |

### CDNs de descarga

Las URLs de descarga usan dos CDNs diferentes:

| CDN                      | Patrón de URL                                  |
|--------------------------|------------------------------------------------|
| DLMGR (Motorola)         | `dlmgr.gtm.svcmot.com/dl/dlws/1/download/...` |
| EdgeCast (Verizon)       | `dlmgredg-vz.gtm.svcmot.com/{packageID}`      |

- Cada update tiene 2 URLs: una con tag `WIFI` y otra con tag `CELL`
- Las URLs expiran (`urlTtlSeconds: 600` = 10 minutos)
- Los archivos son ZIP conteniendo `payload.bin` (Chrome OS Update format)
- Soportan HEAD y Range requests

### triggeredBy: valores válidos

Verificado con curl — solo estos 3 valores son aceptados por el servidor:

| Valor       | Resultado | Uso                                |
|-------------|-----------|-------------------------------------|
| `user`      | ✅ 200    | Verificación manual del usuario     |
| `polling`   | ✅ 200    | Verificación periódica automática   |
| `setup`     | ✅ 200    | Verificación durante setup inicial  |
| `pairing`   | ❌ 400    | Rechazado por el servidor           |
| `system`    | ❌ 400    | Rechazado por el servidor           |
| `(vacío)`   | ❌ 400    | Rechazado por el servidor           |

### idType: valores aceptados

El servidor acepta cualquier valor de `idType` (`serialNumber`, `IMEI`,
`MAC`, vacío) — todos retornan la misma respuesta. El smali hardcodea
`serialNumber`.

### Contextos URL (ctx/XXX)

Solo `ota` tiene paquetes publicados. Los otros contextos retornan
`proceed: false`:

| Contexto     | Resultado      | Uso esperado                     |
|--------------|----------------|-----------------------------------|
| `ota`        | ✅ Updates     | Actualización del sistema         |
| `fota`       | ❌ Sin updates | Firmware over-the-air (carrier)   |
| `modem`      | ❌ Sin updates | Firmware del modem/radio          |
| `firmware`   | ❌ Sin updates | (no estándar)                     |
| `bootloader` | ❌ Sin updates | (no estándar)                     |

## Servidores CDS

| Región | Entorno      | Servidor                           | Estado          |
|--------|--------------|------------------------------------|-----------------|
| Global | Producción   | `moto-cds.appspot.com`             | ✅ Funciona     |
| Global | Staging      | `moto-cds-staging.appspot.com`     | Sin OTA paquetes|
| Global | QA           | `moto-cds-qa.appspot.com`          | Timeout/503     |
| Global | Desarrollo   | `moto-cds-dev.appspot.com`         | Timeout         |
| PRC    | Producción   | `moto-cds.svcmot.cn`              | ✅ Funciona     |
| PRC    | Desarrollo   | `ota-cn-sdc.blurdev.com`           | Sin OTA paquetes|

> **Nota:** `moto-cds.svcmot.cn` no es exclusivo de China — funciona para
> dispositivos de cualquier región. Ambos servidores de producción retornan
> los mismos updates con las mismas cadenas de firmware.

> **Nota:** `ota-cn-sdc.blurdev.com` en realidad apunta a la misma
> instancia que staging (`appId=moto-cds-staging`).

## Endpoints API

| Operación          | Método | Ruta                                           | Estado    |
|--------------------|--------|-------------------------------------------------|-----------|
| Verificar update   | POST   | `cds/upgrade/1/check/ctx/{ctx}/key/{guid}`     | ✅ Real   |
| Obtener recursos   | POST   | `cds/upgrade/1/resources/t/{tid}/ctx/{c}/key/{g}`| ✅ Real |
| Reportar estado    | POST   | `cds/upgrade/1/state/t/{tid}/s/{st}/ctx/{c}/key/{g}`| ✅ Real |
| Info del servidor  | GET    | `cds/upgrade/1/versions`                        | ✅ Real   |
| Check API v2       | POST   | `cds/upgrade/2/check/ctx/{ctx}/key/{guid}`     | ✅ Mismo que v1|
| Cualquier otra ruta| GET/POST| `cds/upgrade/1/{otro}/...`                     | 200 catch-all → `UPGRADE_RESOURCE_NOT_FOUND` |

> **Nota:** El endpoint `/check` es POST-only (GET retorna 405).
> POST con body vacío retorna 400: `"The id/imei is missing from the request"`.
> Las rutas desconocidas retornan 200 con `UPGRADE_RESOURCE_NOT_FOUND`
> (catch-all de Google App Engine), no 404.

Patrón de URL completo:
```
https://{servidor}/{ruta}/ctx/{contexto}/key/{claveContexto}
```

## Autenticación

La API CDS **no requiere headers de autenticación personalizados** para
los endpoints check/resources/state (verificado desde el smali:
`getHeaders()` retorna HashMap vacío y confirmado por captura HAR).

Solo se necesitan los headers estándar:

| Header              | Valor                                          |
|---------------------|------------------------------------------------|
| `Content-Type`      | `application/json; charset=utf-8`              |
| `User-Agent`        | `Dalvik/2.1.0 (Linux; U; Android {ver}; {model} Build/{buildId})` |

Los headers `X-Moto-Auth-Sign` y `Secretkey` solo se usan para el endpoint
de upload de archivos (`store-ota.svcmot.com`).

## Depuración CDS para obtener actualizaciones de Carrier

### Hallazgo principal: payload simplificado

Se descubrió mediante depuración curl directa contra los servidores CDS
oficiales de Motorola que el servidor acepta un **payload mínimo**.
Solo se necesitan 3 campos para obtener actualizaciones con URLs de descarga:

```bash
# ✅ PAYLOAD MÍNIMO — funciona en ambos servidores (svcmot.cn Y appspot.com)
curl -s -X POST \
  'https://moto-cds.svcmot.cn/cds/upgrade/1/check/ctx/ota/key/0d5cc74421f2e8a' \
  -H 'Content-Type: application/json' \
  -H 'User-Agent: com.motorola.ccc.ota' \
  -d '{
    "id": "SERIAL_NUMBER_NOT_AVAILABLE",
    "deviceInfo": {"country": "US", "region": "US"},
    "extraInfo": {
      "carrier": "amxmx",
      "vitalUpdate": false,
      "otaSourceSha1": "0d5cc74421f2e8a"
    },
    "triggeredBy": "user"
  }' | python3 -m json.tool
```

**Campos obligatorios del payload:**
- `id` → cualquier string (no necesita serial real)
- `extraInfo.carrier` → carrier válido (determina la cadena de firmware)
- `extraInfo.otaSourceSha1` → GUID del build actual (debe coincidir con URL `/key/`)
- `extraInfo.vitalUpdate` → debe ser `false` (`true` bloquea updates)
- `triggeredBy` → `"user"` (otros valores no devuelven updates en producción)

**Campos opcionales:**
- `deviceInfo.country` / `deviceInfo.region` → solo importa para `retcn` (China)
- `identityInfo.serialNumber` → no necesario para builds abiertos
- `idType`, `contentTimestamp` → aceptados pero ignorados

### Cómo descargar OTA de cualquier carrier

**Paso 1:** Obtener el GUID del dispositivo (desde `adb` o `build.prop`):
```bash
adb shell getprop ro.mot.build.guid  # → "0d5cc74421f2e8a"
```

**Paso 2:** Consultar con curl mínimo:
```bash
curl -s -X POST \
  'https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/0d5cc74421f2e8a' \
  -H 'Content-Type: application/json' \
  -H 'User-Agent: com.motorola.ccc.ota' \
  -d '{"id":"x","deviceInfo":{"country":"US","region":"US"},"extraInfo":{"carrier":"amxmx","vitalUpdate":false,"otaSourceSha1":"0d5cc74421f2e8a"},"triggeredBy":"user"}'
```

**Paso 3:** De la respuesta, extraer la URL de descarga:
```json
{
  "proceed": true,
  "content": {
    "displayVersion": "VVTA35.51-28-15",
    "size": "111043449",
    "packageID": "delta-Ota_Version_lamul_g_VVTA35.51-18-6_1e9f09-...",
    "md5_checksum": "...",
    "otaTargetSha1": "23d670d5d06f351"
  },
  "contentResources": [
    {"url": "https://dlmgr.gtm.svcmot.com/dl/dlws/1/download/...", "tags": ["WIFI","DLMGR_AGENT"], "urlTtlSeconds": 600},
    {"url": "https://dlmgr.gtm.svcmot.com/dl/dlws/1/download/...", "tags": ["CELL","DLMGR_AGENT"], "urlTtlSeconds": 600}
  ]
}
```

**Paso 4:** Descargar el OTA directamente (URL válida por 600 segundos):
```bash
# Descargar con wget o curl (URLs soportan HEAD y Range)
wget -O ota_step1.zip "URL_FROM_RESPONSE"

# Verificar antes de descargar:
curl -I "URL_FROM_RESPONSE"
# Content-Type: application/octetstream
# Content-Length: 111043449
# Accept-Ranges: bytes
```

**Paso 5:** Para la siguiente actualización, usar `otaTargetSha1` como nuevo GUID:
```bash
curl -s -X POST \
  'https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/23d670d5d06f351' \
  -H 'Content-Type: application/json' \
  -H 'User-Agent: com.motorola.ccc.ota' \
  -d '{"id":"x","deviceInfo":{"country":"US","region":"US"},"extraInfo":{"carrier":"amxmx","vitalUpdate":false,"otaSourceSha1":"23d670d5d06f351"},"triggeredBy":"user"}'
```

### Cadenas OTA verificadas por carrier (marzo 2026)

Se caminaron las cadenas completas para 6 carriers con el payload simplificado.
Todas las URLs de descarga fueron verificadas con `HEAD` (status 200):

| Carrier | Pasos | Último build | Tamaño total | URLs |
|---------|-------|-------------|-------------|------|
| `amxmx` (LATAM/México AMX) | 8 | VVTAS35.51-137-2-1 | 1,622 MB | 16 |
| `retgb` (UK Retail) | 9 | VVTAS35.51-137-10-3 | 1,674 MB | 18 |
| `demogb` (UK Demo) | 9 | VVTAS35.51-137-10-3 | 1,674 MB | 18 |
| `retbr` (Brazil Retail) | 9 | VVTAS35.51-137-2-1 | 1,675 MB | 18 |
| `reteu` (EU Retail) | 4 | VVTA35.51-114 | 1,462 MB | 8 |
| `retla` (LATAM Retail) | 8 | VVTAS35.51-137-2-1 | 1,625 MB | 16 |

#### Cadena completa amxmx (ejemplo)

```
Step 1: VVTA35.51-18-6   → VVTA35.51-28-15      105.9 MB  MR
Step 2: VVTA35.51-28-15  → VVTA35.51-65-5       338.5 MB  MR
Step 3: VVTA35.51-65-5   → VVTA35.51-100        134.1 MB  MR
Step 4: VVTA35.51-100    → VVTAS35.51-100-3      19.0 MB  SMR
Step 5: VVTAS35.51-100-3 → VVTA35.51-127        916.7 MB  MR
Step 6: VVTA35.51-127    → VVTA35.51-137         70.5 MB  MR
Step 7: VVTA35.51-137    → VVTAS35.51-137-2      22.2 MB  SMR
Step 8: VVTAS35.51-137-2 → VVTAS35.51-137-2-1    15.2 MB  SMR
```

### URLs de descarga — CDNs y formato

Cada paso de la cadena incluye 2 URLs de descarga en `contentResources`:

| CDN | Tag | Formato URL |
|-----|-----|-------------|
| `dlmgr.gtm.svcmot.com` | `WIFI,DLMGR_AGENT` | `/dl/dlws/1/download/...` (tokens URL-encoded) |
| `dlmgredg-vz.gtm.svcmot.com` | `CELL,EDGECAST_AGENT` | `/{packageID}/...` (directo) |

- Las URLs expiran después de **600 segundos** (`urlTtlSeconds`)
- Soportan **HEAD** y **Range** requests (descarga parcial/resumable)
- Los archivos son **ZIP** conteniendo `payload.bin` (formato Chrome OS Update)
- `Content-Type: application/octetstream`

### Servidores que funcionan

Ambos servidores de producción funcionan con el payload simplificado:

| Servidor | Resultado |
|----------|-----------|
| `moto-cds.svcmot.cn` | ✅ proceed=true |
| `moto-cds.appspot.com` | ✅ proceed=true |
| `moto-cds-staging.appspot.com` | ❌ sin packages |
| `moto-cds-qa.appspot.com` | ❌ sin packages |
| `moto-cds-dev.appspot.com` | ❌ sin packages |

### Campos del body — análisis comparativo

Se probó campo por campo para determinar qué afecta el resultado:

| Campo | ¿Afecta routing? | Notas |
|-------|-------------------|-------|
| `extraInfo.carrier` | **SÍ (crítico)** | Determina la cadena de firmware |
| `extraInfo.otaSourceSha1` | **SÍ** | Debe coincidir con GUID en URL |
| `extraInfo.vitalUpdate` | **SÍ (bloqueador)** | `true` = siempre `proceed: false` |
| `triggeredBy` | **SÍ** | Solo `"user"` devuelve updates en producción |
| `id` | No | Acepta cualquier string |
| `identityInfo.serialNumber` | No | Solo requerido para builds serial-whitelisted |
| `deviceInfo.*` | No | Ignorado para routing |
| `extraInfo.fingerprint` | No | Ignorado |
| `extraInfo.buildType` | No | Ignorado |
| `extraInfo.imei` | No | Ignorado |
| `extraInfo.mccmnc` | No | Ignorado |
| `idType` | No | Acepta cualquier valor |
| `contentTimestamp` | No | Ignorado |

### Fuentes de GUIDs para consultar

Para poder consultar OTA, necesitas un GUID (`ro.mot.build.guid`).
Fuentes conocidas:

1. **Desde el dispositivo**: `adb shell getprop ro.mot.build.guid`
2. **Desde firmware descargado**: El archivo `build.prop` dentro del
   firmware fastboot contiene `ro.mot.build.guid=...`

### Limitaciones descubiertas

1. **No hay endpoint para listar carriers disponibles** — hay que probarlos
2. **No hay endpoint para listar GUIDs activos** — necesitas obtener uno de un dispositivo o firmware
3. **No hay API para firmware completo** — solo deltas OTA incrementales
4. **`ctx=fota` y `ctx=modem` no tienen packages** — solo `ctx=ota` funciona
5. **Staging/Dev/QA no tienen packages** — solo producción
6. **API v2 retorna exactamente lo mismo que v1** — no hay endpoints ocultos
7. **URLs expiran rápido (600s)** — hay que generar nuevas para cada descarga

## Análisis del device dump (motorola\_lamu\_dump)

Análisis exhaustivo del dump completo del dispositivo moto g15 (lamu\_g),
incluyendo decompilación con apktool de `framework.jar` (32,848 smali),
`services.jar` (16,760 smali), `framework-res.apk` (5,964 XML) y
`MotoOta.apk` (10,906 smali del repo); análisis con Capstone de binarios
ELF (`update_engine`, `update_verifier`, `otapreopt`) y librerías `.so`;
y extracción recursiva de strings de todos los archivos de
`system/`, `vendor/`, `product/`, `system_ext/`.

### GUID descubierto en el dump

```
ro.mot.build.guid=2d94974667acf1d   (build VVTA35.51-137, moto g15 lamu_g)
```

Este GUID está **activo** en ambos servidores CDS y devuelve updates para
**todos** los carriers probados (27/27). La cadena desde este GUID:

```
Step 1: VVTA35.51-137   → VVTAS35.51-137-2     (22.2 MB, SMR)
Step 2: VVTAS35.51-137-2 → VVTAS35.51-137-2-1  (15.2 MB, SMR)
```

### Todos los GUIDs recopilados (cadena completa moto g05/g15)

| GUID | Build | Tamaño delta |
|------|-------|-------------|
| `0d5cc74421f2e8a` | VVTA35.51-18-6 (base) | — |
| `23d670d5d06f351` | VVTA35.51-28-15 | 105.9 MB |
| `a363e2a67728d8a` | VVTA35.51-65-5 | 338.5 MB |
| `190325d96009ac5` | VVTA35.51-100 | 134.1 MB |
| `96398c9adf48ac1` | VVTAS35.51-100-3 | 19.0 MB |
| `871158e11e40ca6` | VVTA35.51-127 | 916.7 MB |
| `2d94974667acf1d` | VVTA35.51-137 | 70.5 MB |
| `39c2283287d0945` | VVTAS35.51-137-2 | 22.2 MB |
| `2a30b040bddb962` | VVTAS35.51-137-2-1 | 15.2 MB (último) |

### Endpoints descubiertos en binarios

| Endpoint | Archivo fuente | Propósito |
|----------|---------------|-----------|
| `https://store-ota.svcmot.com/` | FileUtils.smali | Upload de logs update\_engine (no descarga) |
| `https://d2xbblc68nqw6k.cloudfront.net/` | PublicUtilityMethods.smali | CDN para MFP (pre-install notes) |
| `http://www.motorola.com/support/%s/ReleaseNotes.html` | Configs.smali | Notas de release por modelo |
| `moto-cds.svcmot.cn` | BotaSettings/Configs/CheckUpdateHandler | Servidor CDS producción (PRC route) |
| `moto-cds.appspot.com` | BotaSettings/Configs/CloudPickerActivity | Servidor CDS producción (global) |
| `moto-cds-staging.appspot.com` | Configs/CloudPickerActivity | Staging (sin packages) |
| `moto-cds-qa.appspot.com` | CloudPickerActivity | QA (sin packages) |
| `moto-cds-dev.appspot.com` | CloudPickerActivity | Dev (sin packages) |

### Headers HTTP extraídos del smali

| Header | Archivo | Dirección | Uso |
|--------|---------|-----------|-----|
| `Content-Type` | FileUploadService.smali | Request | `application/json` para check, multipart para upload |
| `X-Moto-Auth-Sign` | FileUploadService.smali | Request | Firma para upload de logs a store-ota |
| `x-moto-accept-verification-methods` | WebServiceThread.smali | Request | Métodos de verificación aceptados |
| `x-moto-backoff` | WebServiceThread.smali | Response | Backoff del servidor |
| `Accept-Encoding` | AdvancedFileDownloader.smali | Request | Compresión para descargas |
| `Content-Length` | AdvancedFileDownloader.smali | Response | Tamaño del archivo |
| `Content-Range` | AdvancedFileDownloader.smali | Response | Rango parcial (resume) |
| `Transfer-Encoding` | AdvancedFileDownloader.smali | Response | Chunked transfer |
| `ETag` | AdvancedFileDownloader.smali | Response | Cache validation |
| `x-cds-content-exists` | (HTTP response) | Response | `true`/`false` indica si existe contenido |

### Body keys del request (355 extraídos del smali)

Keys principales para el JSON del request `/cds/upgrade/1/check`:

```json
{
  "id": "...",                     // serial o "SERIAL_NUMBER_NOT_AVAILABLE"
  "contentTimestamp": 0,
  "idType": "serialNumber",
  "triggeredBy": "user",           // user|polling|setup|pairing
  "deviceInfo": {
    "manufacturer": "motorola",
    "hardware": "...",
    "brand": "motorola",
    "model": "...",
    "product": "",                  // vacío en tráfico real (server lo ignora)
    "os": "Linux:null:null",
    "osVersion": "15",
    "country": "US",
    "region": "US",
    "language": "es",
    "userLanguage": "es_US"
  },
  "extraInfo": {
    "carrier": "amxmx",            // CRÍTICO — determina firmware
    "otaSourceSha1": "...",         // GUID del build actual
    "vitalUpdate": false,           // true BLOQUEA updates
    "clientIdentity": "motorola-ota-client-app",
    "brand": "motorola",
    "model": "...",
    "fingerprint": "...",           // ignorado por server
    "buildDevice": "...",
    "buildId": "...",
    "buildDisplayId": "...",
    "buildTags": "release-keys",
    "buildType": "user",
    "buildIncrementalVersion": "...",
    "releaseVersion": "15",
    "network": "WIFI",
    "apkVersion": 3500094,
    "imei": "...",                  // ignorado
    "mccmnc": "...",                // ignorado
    "bootloaderStatus": "not-applicable",
    "deviceRooted": "false",
    "deviceChipset": "Others",
    "userLocation": "Non-CN",
    "provisionedTime": 0,
    "additionalInfo": "",
    "is4GBRam": false,
    "incrementalVersion": 0,
    "radioVersion": "",
    "bootloaderVersion": "",
    "securityVersion": ""
  },
  "identityInfo": {
    "serialNumber": "..."           // ignorado para builds abiertos
  }
}
```

**Hallazgo clave:** El server solo necesita `carrier`, `otaSourceSha1`,
`vitalUpdate=false` y `triggeredBy=user`. Todos los demás campos son ignorados.

### Body keys de la response

```json
{
  "proceed": true,
  "context": "ota",
  "contextKey": "...",              // GUID consultado
  "content": {
    "displayVersion": "...",
    "sourceDisplayVersion": "...",
    "size": "...",
    "packageID": "...",
    "md5_checksum": "...",
    "otaTargetSha1": "...",         // GUID del siguiente build
    "updateType": "MR|SMR",
    "minVersion": "...",
    "flavour": "...",
    "preInstallNotes": "...",
    "postInstallNotes": "...",
    "releaseNotes": "..."
  },
  "contentTimestamp": 0,
  "contentResources": [
    {
      "url": "https://dlmgr.gtm.svcmot.com/...",
      "tags": ["WIFI", "DLMGR_AGENT"],
      "urlTtlSeconds": 600
    }
  ],
  "trackingId": "...",
  "reportingTags": "...",
  "pollAfterSeconds": 172800,
  "smartUpdateBitmap": 7,
  "uploadFailureLogs": false
}
```

### Análisis de framework.jar (32,848 smali)

Decompilado con apktool. Hallazgos relevantes:

- **RecoverySystem.smali**: Verifica OTA con certificados de `/system/etc/security/otacerts.zip`.
  Usa `X.509` para validación. No contiene URLs de servidor.
- **UpdateEngine.smali**: Busca `android.os.UpdateEngineService` para aplicar payloads A/B.
  No contiene URLs ni endpoints de descarga propios.
- **IUpdateEngine$Stub**: Expone `applyPayload` y `applyPayloadFd` — métodos para aplicar OTA.
- **Carrier.smali**: Lee `ro.carrier` — propiedad del carrier del dispositivo.
- **GeneralFeature.smali**: Lee `ro.moto.general.feature.ota` para determinar si OTA está habilitado.
- **Motorola event-api** (v1.4.1-SNAPSHOT): Usado para checkin de eventos, no para OTA.

**No se encontraron URLs, endpoints ni servidores OTA adicionales en framework.jar.**

### Análisis de services.jar (16,760 smali)

Decompilado con apktool. Hallazgos relevantes:

- **AbUpdateInstaller.smali**: Aplica OTA A/B buscando `payload.bin` y
  `payload_properties.txt` dentro del ZIP. Copia el ZIP a `/ota_package`.
- **UpdateInstaller.smali**: Copia el archivo update a `/ota_package/update.zip`.
- **SystemUpdateManagerService.smali**: Persiste estado en `system-update-info.xml`.
  Solo maneja estado local, no hace requests HTTP.
- **FotaProtectionAdapter.smali** (Motorola enterprise): Controla si FOTA está
  protegido via HAL `IFdrControl`. Solo lectura/escritura de estado.
- **BootReceiver.smali**: Referencia `com.google.android.systemupdater.SystemUpdateReceiver`
  — el receiver de GMS para system updates.

**No se encontraron URLs, endpoints ni servidores OTA adicionales en services.jar.**

### Análisis de framework-res.apk (5,964 XML)

Decompilado con apktool. Hallazgos relevantes:

- `AndroidManifest.xml`: Define permisos `NOTIFY_PENDING_SYSTEM_UPDATE`,
  `READ_SYSTEM_UPDATE_INFO`, `MANAGE_DEVICE_POLICY_SYSTEM_UPDATES`,
  `UPGRADE_RUNTIME_PERMISSIONS`. Broadcast protegidos para carrier config.
- Acción `android.telephony.euicc.action.OTA_STATUS_CHANGED` para eSIM OTA.
- `config_carrierDpcPackage`: Placeholder para carrier DPC.

**No se encontraron URLs, endpoints ni servidores OTA adicionales en framework-res.apk.**

### Análisis de binarios con Capstone

| Binario | Tamaño | Hallazgos OTA |
|---------|--------|--------------|
| `update_engine` | 3.2 MB | Usa libcurl para descargas HTTP. Paths: `ro.ota.allow_downgrade`. Errors: `ErrorCode::kDownloadOperationExecutionError` |
| `update_verifier` | 151 KB | Lee `/data/ota_package/care_map`. Prop: `ota.warm_reset` |
| `otapreopt` | 232 KB | Props: `pm.dexopt.abota_dex2oat.cpu-set`, `pm.dexopt.abota_dex2oat.threads` |
| `otapreopt_chroot` | 167 KB | Ejecuta `/system/bin/otapreopt` en chroot |
| `motoproxyd` | 35 KB | Proxy server para PAC. No OTA. |

**Ningún binario contiene URLs o endpoints CDS adicionales.** `update_engine`
usa curl pero las URLs vienen del caller (MotoOta.apk), no están hardcoded.

### Análisis de archivos .rc init

Archivos con configuración OTA:

| Archivo | Contenido relevante |
|---------|-------------------|
| `init.moto.ota.rc` | `mkdir /data/misc_ne 0770 system cache` |
| `update_engine.rc` | `service update_engine /system/bin/update_engine --logtostderr` |
| `update_verifier.rc` | `service update_verifier /system/bin/update_verifier` |
| `otapreopt.rc` | `exec - root -- /system/bin/otapreopt_slot` |
| `hw/init.rc` | `mkdir /metadata/ota`, `mkdir /data/ota_package`, `mkdir /data/misc/update_engine` |
| `hw/init.mt6768.rc` | `import /FWUpgradeInit.rc` — firmware upgrade init |

**No se encontraron URLs ni configuraciones de servidor en los .rc files.**

### Resultado del brute force

**El servidor CDS ignora TODOS los campos del request excepto 3:**
`carrier`, `otaSourceSha1` (GUID) y `vitalUpdate`. El campo `triggeredBy`
debe ser `"user"` para obtener updates. Todo lo demás es ignorado.

| Prueba | Parámetros probados | Resultado |
|--------|--------------------|-----------| 
| Product names | 33 variantes (lamu_g_eng, lamu_factory, lamu_soak, etc.) | Todos devuelven el mismo paquete |
| buildType × buildTags | 30 combinaciones (user/userdebug/eng/debug/test/factory × release/test/dev/eng/debug-keys) | Todos devuelven el mismo paquete |
| Device flags | 21 combinaciones (isDogfoodDevice, isProductionDevice, isSoakDevice, channelId=beta/eng/factory, buildVariant=eng, etc.) | Todos devuelven el mismo paquete |
| Device models | 10 modelos diferentes (razr, edge, thinkphone, etc.) | Todos devuelven el mismo paquete |
| GUID adyacente (±50) | 100 GUIDs probados | 0 nuevos GUIDs |
| URL contexts | 32 probados (ota/fota/modem/firmware/factory/eng/debug/soak/beta/qa/dogfood...) | Solo `ctx=ota` funciona |
| API versions | v1-v9 | Solo v1 y v2 devuelven updates |
| URL patterns alternativas | 24 paths distintas (/cds/factory/, /cds/full/, /api/v1/, etc.) | Solo `/cds/upgrade/1/check/ctx/ota/key/` funciona |
| Servers no-producción | staging + qa + dev con user/polling/setup | 0 packages disponibles |
| Resources endpoint | 4 payloads con trackingId/contentTimestamp | UPGRADE_RESOURCE_NOT_FOUND siempre |
| State endpoint | downloaded/installed/available | UPGRADE_RESOURCE_NOT_FOUND siempre |

### Información del servidor CDS

```
GET /cds/upgrade/1/versions
{
  "version": "Google App Engine/mainwithdefaults",
  "applicationVersion": "20260227t153823.475717825022236165",
  "applicationId": "moto-cds",
  "environment": "Production"
}
```

Response headers del check endpoint:
```
Server: nginx/1.14.1 (svcmot.cn) / Google Frontend (appspot.com)
Content-Type: application/json;charset=utf-8
x-cds-content-exists: true|false
cache-control: no-cache, no-store, must-revalidate
pragma: no-cache
content-encoding: gzip
Alt-Svc: h3=":443"; ma=2592000
```

### Todos los campos de la response `content` (69 campos)

```
annoy, installTime, showPreDownloadDialog, showDownloadOptions,
preDownloadNotificationExpiryMins, preInstallNotificationExpiryMins,
lowDataStorageDeferCount, lowDataStorageReminder, reserveSpaceInMb,
forced, wifionly, rebootRequired, mccmncListType, mccListType,
serialNoListType, emailListType, imeiListType, deploymentPlanPhase,
optionalUpdateDeferCount, criticalUpdateDeferCount, criticalUpdateReminder,
criticalUpdateExtraWaitPeriod, criticalUpdateExtraWaitCount,
optionalUpdateCancelReminderDays, minBatteryRequiredForInstall,
showDownloadProgress, showPreInstallScreen, showPostInstallScreen,
serviceControlEnabled, serviceTimeoutSeconds, continueOnServiceError,
severityType, deploymentPhaseForAdvancedNotice, upgradeNotification,
preInstallNotes, postInstallNotes, postInstallFailureMessage,
advancedNotice, releaseNotes, forceUpgradeTime, forceDownloadTime,
forceInstallTime, policyBundle, featureEnableBitmap, installReminder,
preDownloadInstructions, preInstallInstructions, packageID, size,
md5_checksum, flavour, minVersion, version, model, otaSourceSha1,
otaTargetSha1, sourceBuildTimestamp, targetBuildTimestamp,
displayVersion, sourceDisplayVersion, oemConfigUpdate, abInstallType,
streamingData, updateType, uiWorkflowControl, downloadStartTime,
downloadEndTime, daysToCancelUpdate, trackingId, reportingTags
```

Campo `streamingData` contiene headers para update_engine:
```json
{
  "header": {
    "vitalUpdate": "false",
    "FILE_HASH": "base64...",
    "FILE_SIZE": "...",
    "METADATA_HASH": "base64...",
    "METADATA_SIZE": "..."
  }
}
```

### Servidores CDS — Lógica de routing completa (del smali)

La app selecciona servidor según `isDogfoodDevice()` (`ro.product.is_production=false`)
e `isChinaDevice()` (`ro.product.is_prc=prc` o carrier=retcn/cmcc/ctcn/cucn):

| Condición | Servidor | Propósito |
|-----------|----------|-----------|
| Production + Global | `moto-cds.appspot.com` | OTA producción global |
| Production + China | `moto-cds.svcmot.cn` | OTA producción China/LATAM |
| Dogfood/non-secure + Global | `moto-cds-staging.appspot.com` | Builds dogfood global |
| Dogfood/non-secure + China | `ota-cn-sdc.blurdev.com` | Builds dogfood China (**nuevo**) |
| QA (manual via CloudPicker) | `moto-cds-qa.appspot.com` | Testing QA |
| Dev (manual via CloudPicker) | `moto-cds-dev.appspot.com` | Testing Dev |

#### Servidor China dogfood: `ota-cn-sdc.blurdev.com`

Descubierto en `Configs.smali:6421` y `CloudPickerActivity.smali:145`.
**Es en realidad `moto-cds-staging` detrás de un proxy nginx/1.14.1:**

```
GET /cds/upgrade/1/versions -> 200
{
  "version": "Google App Engine/mainwithdefaults",
  "applicationVersion": "20260219t144007.475531348487524753",
  "applicationId": "moto-cds-staging",       ← NO es moto-cds, es staging
  "environment": "Production"
}
```

> **Hallazgo:** `ota-cn-sdc.blurdev.com` es un alias de `moto-cds-staging.appspot.com`
> detrás de nginx/1.14.1. Ambos comparten el mismo `applicationId` y
> `applicationVersion`. El servidor blurdev sufre timeouts en POST /check
> pero responde a GET /versions y POST v2/check.

### Respuestas completas de todos los servidores (body completo)

#### Identificación de servidores (GET /cds/upgrade/1/versions)

| Servidor | applicationId | applicationVersion | Server header |
|----------|--------------|-------------------|---------------|
| `moto-cds.svcmot.cn` | `moto-cds` | `20260227t153823...` | nginx/1.14.1 |
| `moto-cds.appspot.com` | `moto-cds` | `20260227t153823...` | Google Frontend |
| `moto-cds-staging.appspot.com` | `moto-cds-staging` | `20260219t144007...` | Google Frontend |
| `moto-cds-qa.appspot.com` | `moto-cds-qa` | `20251204t182430...` | Google Frontend |
| `moto-cds-dev.appspot.com` | `moto-cds-dev` | `20260217t112859...` | Google Frontend |
| `ota-cn-sdc.blurdev.com` | `moto-cds-staging` | `20260219t144007...` | nginx/1.14.1 |

> Todos reportan `environment: "Production"` independientemente de su función real.

#### Respuesta `proceed=false` completa (servidores sin paquetes)

Cuando un servidor no tiene contenido, retorna **exactamente** esta estructura:

```json
{
  "proceed": false,
  "context": "ota",
  "contextKey": "2d94974667acf1d",
  "content": null,
  "contentTimestamp": 0,
  "contentResources": null,
  "trackingId": null,
  "reportingTags": null,
  "pollAfterSeconds": 172800,
  "smartUpdateBitmap": 7,
  "uploadFailureLogs": false
}
```

Header: `x-cds-content-exists: false`

**Diferencias de `smartUpdateBitmap` por servidor:**

| Servidor | smartUpdateBitmap |
|----------|-------------------|
| Producción (svcmot.cn, appspot.com) | `7` |
| Staging (staging, blurdev) | `7` |
| QA | `-1` |
| Dev | `11` |

Los contextos `fota` y `modem` retornan la misma estructura con `content: null`.

#### Endpoints que retornan error genérico

Los siguientes endpoints retornan el mismo error GAE catch-all en **todos** los servidores:

```json
{"code": "UPGRADE_RESOURCE_NOT_FOUND", "description": "Requested resource not found.", "suggestion": "Please check the URI and make sure the resource is valid."}
```

| Endpoint | Método | Status |
|----------|--------|--------|
| `/cds/upgrade/1/resources/ctx/ota/key/{GUID}` | POST | 200 |
| `/cds/upgrade/1/state/ctx/ota/key/{GUID}` | POST | 200 |
| `/cds/factory/1/check/ctx/ota/key/{GUID}` | POST | 200 |
| `/cds` | GET | 200 |
| Cualquier path no válido | GET/POST | 200 |

> **Nota:** `/cds/factory/1/check` NO es un endpoint válido — retorna el
> mismo error genérico que cualquier URL inventada. El servidor GAE tiene un
> catch-all que responde 200 + UPGRADE_RESOURCE_NOT_FOUND para paths no
> registrados.

#### Raíz del servidor (GET /)

Todos los servidores retornan una página HTML genérica de Google App Engine:
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration -->
```

#### Servidor blurdev — comportamiento de timeouts

`ota-cn-sdc.blurdev.com` tiene comportamiento errático:

| Endpoint | Resultado |
|----------|-----------|
| GET /cds/upgrade/1/versions | ✅ 200 OK (responde rápido) |
| GET / | ✅ 200 OK (página HTML GAE) |
| POST v2/check | ✅ 200 OK (`proceed:false`) |
| POST /state | ✅ 200 OK (UPGRADE_RESOURCE_NOT_FOUND) |
| POST v1/check (ota/fota/modem) | ❌ **Timeout** (15s) |
| POST /resources | ❌ **Timeout** (15s) |
| POST /factory/1/check | ❌ **Timeout** (15s) |
| GET /cds | ❌ **Timeout** (15s) |

> Los timeouts en v1/check sugieren que el proxy nginx no reenvía
> correctamente ciertos POSTs al backend GAE de staging, pero v2/check sí funciona.

### Resultado de pruebas exhaustivas en servidores dev/staging/qa/blurdev

- 2 carriers (amxmx + retcn) × 3 contextos (ota/fota/modem) × 4 servidores = **0 packages**
- Todos retornan `proceed:false, content:null, x-cds-content-exists:false`
- Carriers China (retcn, cmcc, ctcn, cucn) = sin contenido en **ningún** servidor
- `/cds/factory/1/check` → error genérico (path no registrado, no endpoint real)
- API v2 (`/cds/upgrade/2/check`) retorna los mismos resultados que v1
- Los servidores dev aceptan requests válidos pero **no tienen packages publicados**

### Conclusión del análisis

**Toda la lógica de OTA está en MotoOta.apk** (ya decompilado en este repo).
`framework.jar`, `services.jar` y `framework-res.apk` solo contienen las APIs
de Android estándar (`UpdateEngine`, `RecoverySystem`, `PackageInstaller`) que
**reciben** las instrucciones de MotoOta.apk. No contienen URLs, endpoints,
servidores ni lógica de routing de OTA adicionales.

Los únicos servidores que manejan OTA son los ya documentados:
- `moto-cds.svcmot.cn` (producción, ruta PRC)
- `moto-cds.appspot.com` (producción, ruta global)
- `store-ota.svcmot.com` (solo upload de logs)
- `d2xbblc68nqw6k.cloudfront.net` (CDN de notas pre-install)

## Fuentes del análisis

Los algoritmos y estructuras de datos fueron extraídos del bytecode smali:

- `CheckUpdateHandler.smali` – Flujo de verificación de actualizaciones
- `CheckRequestBuilder.smali` – Estructura del request JSON
- `CheckResponseBuilder.smali` – Parsing de la respuesta
- `CheckUrlConstructor.smali` – Construcción de URLs
- `LibConfigs.smali` – Configuración de endpoints y credenciales
- `FileUtils.smali` – Headers de autenticación para upload
- `BuildPropReader.smali` – Recolección de información del dispositivo
- `WebServiceThread.smali` – Lógica de reintentos y back-off
- `WaitForResponseTask$InternalResponseReceiver$3.smali` – Headers HTTP (vacíos)
- `PublicUtilityMethods$TRIGGER_BY.smali` – Valores válidos de triggeredBy
- `CDSUtils.smali` – Constantes de idType y endpoints
- `CloudPickerActivity.smali` – Selector de servidores (dogfood only)
- `BuildPropertyUtils.smali` – isDogfoodDevice() / isSecure()
