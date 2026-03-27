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

### Consultar actualizaciones OTA

```bash
python -m ota_analyzer check-update \
    --model "moto g84 5G" \
    --product "bangkk" \
    --build-id "U1TBS35.29-28-5" \
    --serial "ABC123456" \
    --carrier "Verizon" \
    --region global \
    --env production
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

## Servidores CDS

| Región | Entorno      | Servidor                           |
|--------|--------------|------------------------------------|
| Global | Producción   | `moto-cds.appspot.com`             |
| Global | Staging      | `moto-cds-staging.appspot.com`     |
| Global | QA           | `moto-cds-qa.appspot.com`          |
| Global | Desarrollo   | `moto-cds-dev.appspot.com`         |
| China  | Producción   | `moto-cds.svcmot.cn`              |
| China  | Desarrollo   | `ota-cn-sdc.blurdev.com`           |

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

La API CDS utiliza autenticación basada en headers HTTP:

| Header              | Descripción                      |
|---------------------|----------------------------------|
| `X-Moto-Auth-Sign`  | Firma MD5 de autenticación       |
| `Secretkey`         | Clave secreta de la aplicación   |
| `Content-Type`      | `application/json`               |

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
