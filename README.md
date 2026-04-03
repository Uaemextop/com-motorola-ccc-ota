# Moto-OTA

**Download OTA updates for Motorola devices via CDS servers.**

A command-line tool and interactive TUI for querying Motorola's Content Delivery Service (CDS) servers, discovering available OTA firmware updates, and downloading them — with full update chain support, carrier scanning, and MD5 verification.

![Moto-OTA TUI](https://github.com/user-attachments/assets/627f9544-84b5-412a-bd95-c55026ac652b)

## Features

- **Check for updates** — query a specific GUID + carrier for available OTA packages
- **Walk update chains** — discover every intermediate update from current to latest
- **Download OTA zips** — download full chains with progress bars and MD5 verification
- **Carrier scanner** — scan 438 carriers in parallel to find which ones have open updates for a given GUID
- **Interactive TUI** — penumbra-style full-screen interface with animated starfield, scrollable results, and keyboard navigation
- **CLI mode** — scriptable commands with typer for automation and pipelines
- **Persistent config** — save server, GUID, carrier, and device identity across sessions
- **Cross-platform** — works on Windows, macOS, and Linux

## Installation

```bash
pip install .
```

Or install in development mode:

```bash
pip install -e .
```

### Requirements

- Python 3.10+
- Dependencies: `requests`, `rich`, `typer`, `tenacity`, `xmltodict`

## Usage

### Interactive TUI

Launch the interactive interface (no arguments):

```bash
moto-ota
```

Navigate with arrow keys, Enter to select, Escape/q to go back. Results are scrollable with ↑/↓ arrows.

### CLI Commands

```bash
# Check for an update
moto-ota check --guid <GUID> --carrier <CARRIER>

# Walk the full update chain
moto-ota chain --guid <GUID> --carrier <CARRIER>

# Download all updates in the chain
moto-ota download --guid <GUID> --carrier <CARRIER> --output ./downloads

# Scan all carriers for a GUID
moto-ota scan --guid <GUID>

# List available servers
moto-ota servers

# List known carriers (optionally filter by region)
moto-ota carriers --region LATAM

# View or edit configuration
moto-ota config --show
moto-ota config --set guid=<GUID> --set carrier=<CARRIER>
```

### Servers

| Server             | Region |
| ------------------ | ------ |
| production-global  | Global |
| production-prc     | China  |
| staging            | Global |
| qa                 | Global |
| dev                | Global |
| blurdev            | China  |

### Configuration

Configuration is stored in `~/.config/moto-ota/`:

- **`app.json`** — server, region, headers, timeout, retries, MD5 verification
- **`device.json`** — GUID, carrier, model, serial, fingerprint, IMEI, and other device identity fields

Edit via `moto-ota config` or through the TUI Configuration menu.

## Web App (MotoOTA)

A React web interface for querying Motorola CDS servers directly from the browser.

**Live:** https://Uaemextop.github.io/com-motorola-ccc-ota/

### Architecture

```
┌─────────────────────┐    POST /?url=<CDS_URL>    ┌──────────────────────────┐    POST /cds/upgrade/1/check/...    ┌────────────────────┐
│   MotoOTA Web App   │ ──────────────────────────► │  Cloudflare Worker Proxy │ ──────────────────────────────────►│ moto-cds.appspot.  │
│  (GitHub Pages)     │ ◄────────────────────────── │  (CORS headers added)    │ ◄─────────────────────────────────│ com (Motorola CDS) │
└─────────────────────┘    JSON + CORS headers      └──────────────────────────┘    JSON response                   └────────────────────┘
```

The Motorola CDS API does not return CORS headers, so browser requests fail.
The Cloudflare Worker acts as a transparent proxy that:

1. Receives the POST request from the browser
2. Forwards it to the CDS server with the exact headers the Android app uses
3. Returns the response with `Access-Control-Allow-Origin: *` headers added

### CORS Proxy (Cloudflare Worker)

**Deployed at:** `https://com-motorola-ccc-ota.ealvarado2677.workers.dev`

The proxy source is in [`motoota/worker/cors-proxy.js`](motoota/worker/cors-proxy.js).

#### How it works

```
Browser POST to:
  https://com-motorola-ccc-ota.ealvarado2677.workers.dev?url=https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/<GUID>

Body (forwarded as-is):
  {"id":"x","deviceInfo":{"country":"","region":"US"},"extraInfo":{"carrier":"amxmx","vitalUpdate":false,"otaSourceSha1":"<GUID>"},"triggeredBy":"user"}

Worker forwards to CDS with headers:
  Content-Type: application/json; charset=utf-8
  User-Agent: com.motorola.ccc.ota
  Accept-Encoding: gzip
  Connection: Keep-Alive

Worker returns the CDS JSON response + CORS headers + x-cds-content-exists header
```

#### Deploy your own proxy

1. Go to [Cloudflare Workers](https://workers.cloudflare.com) and create an account
2. **Workers & Pages → Create** → Connect to your fork of this repo
3. Configure the build:
   - **Build command:** *(leave empty)*
   - **Deploy command:** `npx wrangler deploy`
   - **Root directory:** `/`
   - **Production branch:** `master`
4. The `wrangler.jsonc` at the repo root points to `motoota/worker/cors-proxy.js`
5. After deploy, your proxy URL will be `https://<worker-name>.<account>.workers.dev`
6. In MotoOTA → Configuración → paste the URL in "Proxy CORS personalizado"

#### Allowed CDS hosts

The proxy only forwards requests to these verified Motorola servers:

| Host | Description |
|------|-------------|
| `moto-cds.appspot.com` | Production (Global) |
| `moto-cds.svcmot.cn` | Production (PRC/LATAM) |
| `moto-cds-staging.appspot.com` | Staging |
| `moto-cds-qa.appspot.com` | QA |
| `moto-cds-dev.appspot.com` | Development |
| `ota-cn-sdc.blurdev.com` | Blurdev (China) |

### CDS API Reference

**Endpoint:** `POST https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}`

**Request Headers** (matches `com.motorola.ccc.ota` Android app):
```
Content-Type: application/json; charset=utf-8
User-Agent: com.motorola.ccc.ota
Accept-Encoding: gzip
Connection: Keep-Alive
```

**Request Body** (minimal payload — only 4 fields affect server routing):
```json
{
  "id": "x",
  "deviceInfo": { "country": "", "region": "US" },
  "extraInfo": {
    "carrier": "<CARRIER_CODE>",
    "vitalUpdate": false,
    "otaSourceSha1": "<GUID>"
  },
  "triggeredBy": "user"
}
```

**Response (update available):**
```json
{
  "payload": {
    "proceed": true,
    "context": "ota",
    "contextKey": "<target_guid>",
    "content": {
      "displayVersion": "T2SQS33.72-22-8-2",
      "sourceDisplayVersion": "T2SQS33.72-22-8",
      "otaTargetSha1": "<target_guid>",
      "size": 123456789,
      "updateType": "FULL_UPDATE",
      "md5_checksum": "abc123...",
      "releaseNotes": "<h3>Security update</h3>...",
      "packageID": "..."
    },
    "contentResources": [
      { "url": "https://...", "tags": ["full"], "urlTtlSeconds": 3600 }
    ],
    "pollAfterSeconds": 3600,
    "smartUpdateBitmap": 7
  }
}
```

**Response Header:** `x-cds-content-exists: true|false` — indicates if content exists but requires serial/whitelist.

**Response (no update):** `{ "payload": { "proceed": false, ... } }`

## Project Structure

```
moto_ota/
├── __init__.py          # Package metadata
├── __main__.py          # python -m moto_ota entry point
├── cli.py               # Typer CLI commands
├── tui.py               # Penumbra-style interactive TUI
├── config/
│   ├── app_config.py    # App settings (server, region, etc.)
│   ├── carriers.py      # 438 Motorola carrier codes
│   ├── device_config.py # Device identity fields
│   ├── manager.py       # JSON config persistence
│   └── servers.py       # CDS server definitions
├── core/
│   ├── client.py        # OTA HTTP client (check, chain)
│   └── downloader.py    # Download with progress & MD5
└── models/
    ├── device.py        # DeviceInfo dataclass
    ├── request.py       # CDS request builder
    └── response.py      # CDS response parser
```

## License

MIT
