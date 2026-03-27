# moto-ota — Motorola OTA Downloader

```
 ███╗   ███╗ ██████╗ ████████╗ ██████╗        ██████╗ ████████╗ █████╗
 ████╗ ████║██╔═══██╗╚══██╔══╝██╔═══██╗      ██╔═══██╗╚══██╔══╝██╔══██╗
 ██╔████╔██║██║   ██║   ██║   ██║   ██║█████╗██║   ██║   ██║   ███████║
 ██║╚██╔╝██║██║   ██║   ██║   ██║   ██║╚════╝██║   ██║   ██║   ██╔══██║
 ██║ ╚═╝ ██║╚██████╔╝   ██║   ╚██████╔╝      ╚██████╔╝   ██║   ██║  ██║
 ╚═╝     ╚═╝ ╚═════╝    ╚═╝    ╚═════╝        ╚═════╝    ╚═╝   ╚═╝  ╚═╝
```

Download OTA updates for Motorola devices directly from CDS servers.

Built by reverse-engineering the `com.motorola.ccc.ota` (MotoOta.apk)
system updater and verified by direct server probing.

## Features

- **Interactive TUI** — keyboard-driven interface inspired by [penumbra](https://github.com/shomykohai/penumbra), with split-pane layouts, ASCII banner, arrow-key navigation and purple/blue colour theme
- **CLI mode** — scriptable commands with `typer`
- **Download** — full update chains with rich progress bars
- **Chain walk** — enumerate all delta updates from base to latest
- **All servers** — 6 CDS environments (production, staging, QA, dev)
- **22+ carriers** — pre-configured carrier codes with region info
- **Persistent config** — two JSON config files (`app.json` + `device.json`) saved at `~/.config/moto-ota/`
- **Config menus** — interactive settings editor with field descriptions and valid option pickers

## Installation

```bash
pip install .
```

## Quick Start

### Interactive mode (TUI)

```bash
moto-ota
```

Launches a penumbra-style TUI with:
- **↑/↓** arrow keys to navigate menus
- **Enter** to select
- **Esc** to go back
- Split-pane layout: action list on left, description on right
- Configuration editor with live field descriptions

### CLI commands

```bash
# Check for a single update
moto-ota check --guid 0d5cc74421f2e8a --carrier amxmx

# Walk the full update chain
moto-ota chain --guid 0d5cc74421f2e8a --carrier amxmx

# Download all updates in the chain
moto-ota download --guid 0d5cc74421f2e8a --carrier amxmx -d ./ota_files

# List available servers
moto-ota servers

# List known carriers
moto-ota carriers
moto-ota carriers --region LATAM
moto-ota carriers --all  # include whitelisted

# Show / edit configuration
moto-ota config --show
moto-ota config --paths
moto-ota config --edit
```

## Configuration

Two JSON config files stored at `~/.config/moto-ota/`:

### App config (`app.json`)

| Setting | Default | Description |
|---------|---------|-------------|
| `server` | `production-prc` | CDS server environment |
| `region` | `LATAM` | Your region (default carrier filter) |
| `user_agent` | `com.motorola.ccc.ota` | HTTP User-Agent header |
| `content_type` | `application/json; charset=utf-8` | HTTP Content-Type |
| `timeout` | `30` | Request timeout in seconds |
| `max_retries` | `3` | Connection retry attempts |
| `verify_md5` | `true` | Verify downloads against MD5 |

### Device config (`device.json`)

| Setting | Description | Routing? |
|---------|-------------|----------|
| `guid` | Device GUID (`ro.mot.build.guid`) | **YES** |
| `carrier` | Carrier code (e.g. `amxmx`) | **YES** |
| `triggered_by` | Trigger type (must be `user`) | **YES** |
| `context` | URL context (`ota`/`fota`/`modem`) | **YES** |
| `model` | Device model name | No |
| `serial` | Serial number | No |
| `fingerprint` | Build fingerprint | No |
| `imei` | Primary IMEI | No |
| `hardware` | Hardware platform | No |

> Fields marked "No" are sent for compatibility but the server ignores them.

## Servers

| Server | Host | Has Packages |
|--------|------|:---:|
| `production-prc` | moto-cds.svcmot.cn | Yes |
| `production-global` | moto-cds.appspot.com | Yes |
| `staging` | moto-cds-staging.appspot.com | No |
| `qa` | moto-cds-qa.appspot.com | No |
| `dev` | moto-cds-dev.appspot.com | No |
| `blurdev` | ota-cn-sdc.blurdev.com | No |

## Architecture

```
moto_ota/
├── __init__.py           # Package version
├── __main__.py           # python -m moto_ota
├── cli.py                # Typer CLI commands
├── tui.py                # Rich interactive terminal UI
├── config/
│   ├── servers.py        # 6 CDS server endpoints
│   ├── carriers.py       # 22 known carrier codes
│   ├── app_config.py     # App settings model + field metadata
│   ├── device_config.py  # Device params model + field metadata
│   └── manager.py        # Read/write JSON config files
├── core/
│   ├── client.py         # API client (requests + tenacity)
│   └── downloader.py     # File downloads (rich progress)
└── models/
    ├── device.py          # Device payload builder
    ├── request.py         # Minimal check request
    └── response.py        # Server response parser
```

## Dependencies

| Package | Purpose |
|---------|---------|
| `requests` | HTTP client |
| `rich` | Terminal UI, tables, progress bars |
| `typer` | CLI framework |
| `tenacity` | Retry logic with back-off |
| `xmltodict` | XML metadata parsing |

## How It Works

1. The CDS server routes updates by **carrier** and **GUID**
2. Each update response contains `otaTargetSha1` -- the GUID of the next build
3. Walking the chain: feed each target GUID as the next request until `proceed=false`
4. Download URLs come in pairs (WIFI + CELL CDNs), expire after 600s

## License

This tool is for educational and research purposes.
