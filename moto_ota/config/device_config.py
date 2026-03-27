"""Device-level configuration: GUID, carrier, model, serial, etc.

Stored at ``~/.config/moto-ota/device.json``.  These values are used to
build the OTA check request payload.
"""

from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import Any

# Valid triggeredBy values (only "user" returns updates on production)
VALID_TRIGGERED_BY: list[str] = ["user", "polling", "setup"]

# Valid OTA contexts
VALID_CONTEXTS: list[str] = ["ota", "fota", "modem"]


@dataclass
class DeviceConfig:
    """Device parameters persisted to ``device.json``."""

    # ── routing fields (these actually matter for the server) ────────
    guid: str = ""
    """Device GUID — ``ro.mot.build.guid`` (15 hex chars)."""

    carrier: str = ""
    """Carrier code for OTA routing (e.g. ``amxmx``, ``reteu``)."""

    triggered_by: str = "user"
    """Trigger type — only ``user`` returns updates on production."""

    context: str = "ota"
    """URL context — ``ota``, ``fota``, or ``modem``."""

    # ── cosmetic fields (server ignores these but sent for compat) ──
    model: str = ""
    """Device model name (e.g. ``moto g05``)."""

    serial: str = ""
    """Device serial number (e.g. ``ZY32LNRW97``)."""

    fingerprint: str = ""
    """Build fingerprint (e.g. ``motorola/lamul_g/lamul:15/...``)."""

    imei: str = ""
    """Primary IMEI."""

    mccmnc: str = ""
    """Primary MCC+MNC (e.g. ``334020``)."""

    hardware: str = ""
    """Hardware platform (e.g. ``mt6768``)."""

    bootloader: str = ""
    """Bootloader version (e.g. ``0x0908``)."""

    radio: str = ""
    """Radio/baseband version."""

    build_id: str = ""
    """Current build ID (e.g. ``VVTA35.51-18-6``)."""

    os_version: str = "15"
    """Android version."""

    security_patch: str = ""
    """Security patch level (e.g. ``2024-11-05``)."""

    # ── helpers ──────────────────────────────────────────────────────

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> DeviceConfig:
        known = {f.name for f in cls.__dataclass_fields__.values()}
        return cls(**{k: v for k, v in data.items() if k in known})


# ── field metadata for the TUI config menu ───────────────────────────

DEVICE_CONFIG_FIELDS: list[dict[str, Any]] = [
    {
        "key": "guid",
        "label": "GUID",
        "description": "Device build GUID — ro.mot.build.guid (15 hex chars)",
        "type": "text",
    },
    {
        "key": "carrier",
        "label": "Carrier",
        "description": "Carrier code for OTA routing (critical routing field)",
        "type": "carrier",  # special type handled by TUI
    },
    {
        "key": "triggered_by",
        "label": "Triggered By",
        "description": "Trigger type — only 'user' returns updates on production",
        "type": "choice",
        "choices": VALID_TRIGGERED_BY,
    },
    {
        "key": "context",
        "label": "Context",
        "description": "URL context — only 'ota' has packages on production",
        "type": "choice",
        "choices": VALID_CONTEXTS,
    },
    {
        "key": "model",
        "label": "Model",
        "description": "Device model name (e.g. moto g05) — server ignores this",
        "type": "text",
    },
    {
        "key": "serial",
        "label": "Serial",
        "description": "Device serial number — server ignores this",
        "type": "text",
    },
    {
        "key": "fingerprint",
        "label": "Fingerprint",
        "description": "Build fingerprint — server ignores this",
        "type": "text",
    },
    {
        "key": "imei",
        "label": "IMEI",
        "description": "Primary IMEI — server ignores this",
        "type": "text",
    },
    {
        "key": "mccmnc",
        "label": "MCC+MNC",
        "description": "Mobile Country+Network Code (e.g. 334020) — server ignores this",
        "type": "text",
    },
    {
        "key": "hardware",
        "label": "Hardware",
        "description": "Hardware platform (e.g. mt6768) — server ignores this",
        "type": "text",
    },
    {
        "key": "bootloader",
        "label": "Bootloader",
        "description": "Bootloader version — server ignores this",
        "type": "text",
    },
    {
        "key": "radio",
        "label": "Radio",
        "description": "Radio/baseband version — server ignores this",
        "type": "text",
    },
    {
        "key": "build_id",
        "label": "Build ID",
        "description": "Current build ID (e.g. VVTA35.51-18-6) — server ignores this",
        "type": "text",
    },
    {
        "key": "os_version",
        "label": "Android Version",
        "description": "Android OS version (e.g. 15) — server ignores this",
        "type": "text",
    },
    {
        "key": "security_patch",
        "label": "Security Patch",
        "description": "Security patch date (e.g. 2024-11-05) — server ignores this",
        "type": "text",
    },
]
