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
