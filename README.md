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

### Campos clave de la respuesta

| Campo               | Descripción                                    |
|---------------------|------------------------------------------------|
| `proceed`           | `true` si hay update disponible                |
| `otaSourceSha1`     | GUID del build actual (fuente del delta)        |
| `otaTargetSha1`     | GUID del build destino                          |
| `displayVersion`    | Nombre del build destino (ej: `VVTA35.51-28-15`)|
| `size`              | Tamaño del delta en bytes                       |
| `md5_checksum`      | MD5 del archivo delta                           |
| `contentResources`  | URLs de descarga (WIFI y CELL)                  |
| `minVersion`        | Versión mínima requerida                        |
| `updateType`        | Tipo: `MR` (release) o `SMR` (parche seguridad) |

## Servidores CDS

| Región | Entorno      | Servidor                           |
|--------|--------------|------------------------------------|
| Global | Producción   | `moto-cds.appspot.com`             |
| Global | Staging      | `moto-cds-staging.appspot.com`     |
| Global | QA           | `moto-cds-qa.appspot.com`          |
| Global | Desarrollo   | `moto-cds-dev.appspot.com`         |
| PRC    | Producción   | `moto-cds.svcmot.cn`              |
| PRC    | Desarrollo   | `ota-cn-sdc.blurdev.com`           |

> **Nota:** `moto-cds.svcmot.cn` no es exclusivo de China — funciona para
> dispositivos de cualquier región. Ambos servidores de producción retornan
> los mismos updates.

## Endpoints API

| Operación          | Ruta                         |
|--------------------|------------------------------|
| Verificar update   | `cds/upgrade/1/check`        |
| Obtener recursos   | `cds/upgrade/1/resources`    |
| Reportar estado    | `cds/upgrade/1/state`        |

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
