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
