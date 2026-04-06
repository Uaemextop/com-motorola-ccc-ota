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

**Live:** `https://com-motorola-ccc-ota.ealvarado2677.workers.dev`

### Architecture

```text
┌──────────────────────────────────────────────────────────────────────────┐
│  Cloudflare Worker  (com-motorola-ccc-ota.ealvarado2677.workers.dev)    │
│                                                                          │
│  ┌──────────────┐    same-origin POST    ┌─────────────┐                │
│  │  SPA (Vite)  │ ────────────────────►  │  /api/check  │               │
│  │  index.html  │ ◄──────────────────── │  handler     │               │
│  └──────────────┘    JSON response       └──────┬──────┘                │
│                                                  │                       │
└──────────────────────────────────────────────────┼───────────────────────┘
                                                   │ POST /cds/upgrade/1/check/...
                                                   ▼
                                          ┌────────────────────┐
                                          │ moto-cds.appspot.  │
                                          │ com (Motorola CDS) │
                                          └────────────────────┘
```

The Motorola CDS API does not return CORS headers, so cross-origin browser requests fail.
This project solves it by deploying the SPA **and** the API handler on the **same Cloudflare Worker domain** — making every API call a same-origin request. No CORS proxy is needed.

### How it works

1. The Cloudflare Worker serves the Vite-built SPA as static assets
2. The browser POSTs to `/api/check` (same origin — no CORS)
3. The Worker forwards the request to the CDS server with Android app headers
4. The CDS JSON response is returned to the browser

Source: [`motoota/worker/index.js`](motoota/worker/index.js)

### Deploy your own instance

1. Go to [Cloudflare Workers](https://workers.cloudflare.com) and create an account
2. **Workers & Pages → Create** → Connect to your fork of this repo
3. Configure the build:
   - **Build command:** `cd motoota && npm ci && npm run build`
   - **Deploy command:** `npx wrangler deploy`
   - **Root directory:** `/`
   - **Production branch:** `master`
4. The `wrangler.jsonc` at the repo root configures everything:
   - `main` → Worker script (`motoota/worker/index.js`)
   - `assets.directory` → SPA build output (`motoota/dist`)
   - `assets.not_found_handling` → `single-page-application` (SPA routing)
5. After deploy, your app will be at `https://<worker-name>.<account>.workers.dev`

### Allowed CDS hosts

The Worker only forwards requests to these verified Motorola servers:

| Host | Description |
| ------ | ------------- |
| `moto-cds.appspot.com` | Production (Global) |
| `moto-cds.svcmot.cn` | Production (PRC/LATAM) |
| `moto-cds-staging.appspot.com` | Staging |
| `moto-cds-qa.appspot.com` | QA |
| `moto-cds-dev.appspot.com` | Development |
| `ota-cn-sdc.blurdev.com` | Blurdev (China) |

### CDS API Reference

**Endpoint:** `POST https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}`

**Request Headers** (matches `com.motorola.ccc.ota` Android app):

```text
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

```text
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
