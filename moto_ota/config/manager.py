"""Persistent configuration manager.

Reads and writes two JSON files under ``~/.config/moto-ota/``:

* ``app.json``    — server, headers, timeouts, region
* ``device.json`` — GUID, carrier, model, serial, …

Both files are created with sensible defaults on first access.
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any

from moto_ota.config.app_config import AppConfig
from moto_ota.config.device_config import DeviceConfig

_CONFIG_DIR = Path.home() / ".config" / "moto-ota"
_APP_FILE = _CONFIG_DIR / "app.json"
_DEVICE_FILE = _CONFIG_DIR / "device.json"


def config_dir() -> Path:
    """Return (and create) the config directory."""
    _CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    return _CONFIG_DIR


# ── read ─────────────────────────────────────────────────────────────


def _read_json(path: Path) -> dict[str, Any]:
    if path.exists():
        return json.loads(path.read_text(encoding="utf-8"))
    return {}


def load_app_config() -> AppConfig:
    """Load app config from disk (or return defaults)."""
    return AppConfig.from_dict(_read_json(_APP_FILE))


def load_device_config() -> DeviceConfig:
    """Load device config from disk (or return defaults)."""
    return DeviceConfig.from_dict(_read_json(_DEVICE_FILE))


# ── write ────────────────────────────────────────────────────────────


def _write_json(path: Path, data: dict[str, Any]) -> None:
    config_dir()
    path.write_text(
        json.dumps(data, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


def save_app_config(cfg: AppConfig) -> Path:
    """Persist app config to ``app.json`` and return its path."""
    _write_json(_APP_FILE, cfg.to_dict())
    return _APP_FILE


def save_device_config(cfg: DeviceConfig) -> Path:
    """Persist device config to ``device.json`` and return its path."""
    _write_json(_DEVICE_FILE, cfg.to_dict())
    return _DEVICE_FILE


# ── convenience ──────────────────────────────────────────────────────


def app_config_path() -> Path:
    return _APP_FILE


def device_config_path() -> Path:
    return _DEVICE_FILE


def reset_app_config() -> AppConfig:
    """Reset app config to defaults."""
    cfg = AppConfig()
    save_app_config(cfg)
    return cfg


def reset_device_config() -> DeviceConfig:
    """Reset device config to defaults."""
    cfg = DeviceConfig()
    save_device_config(cfg)
    return cfg
