"""Known carrier codes for Motorola OTA routing.

The ``carrier`` field in ``extraInfo`` is the **critical** routing key.
Without a valid carrier the server returns ``proceed=false`` even when the
GUID is correct.

Carrier list built from systematic testing of 157 carrier codes against
``moto-cds.svcmot.cn`` for the moto g05 (``lamul_g``) base GUID
``0d5cc74421f2e8a`` (March 2026).
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Carrier:
    """A carrier / channel code used for OTA routing."""

    code: str
    name: str
    region: str
    status: str = "open"  # open | whitelisted


CARRIERS: list[Carrier] = [
    # --- Open (return updates without serial whitelisting) ----------------
    Carrier("amxmx", "América Móvil México", "LATAM"),
    Carrier("openmx", "Open Market México", "LATAM"),
    Carrier("retla", "Retail Latin America", "LATAM"),
    Carrier("reteu", "Retail Europe", "Europe"),
    Carrier("retgb", "Retail UK", "Europe"),
    Carrier("retbr", "Retail Brazil", "Brazil"),
    Carrier("o2gb", "O2 UK", "Europe"),
    Carrier("eegb", "EE UK", "Europe"),
    Carrier("vfeu", "Vodafone Europe", "Europe"),
    Carrier("3gb", "Three UK", "Europe"),
    Carrier("demogb", "Demo UK", "Europe"),
    Carrier("amxla", "América Móvil LATAM", "LATAM"),
    Carrier("amxpe", "América Móvil Perú", "LATAM"),
    Carrier("amxbr", "América Móvil Brazil", "Brazil"),
    Carrier("tefmx", "Telefónica México", "LATAM"),
    Carrier("tefbr", "Telefónica Brazil", "Brazil"),
    Carrier("pluspl", "Plus Poland", "Europe"),
    # --- Whitelisted (content exists but requires device serial) ----------
    Carrier("attmx", "AT&T México", "LATAM", "whitelisted"),
    Carrier("retin", "Retail India", "Asia", "whitelisted"),
    Carrier("retar", "Retail Argentina", "LATAM", "whitelisted"),
    Carrier("amxar", "América Móvil Argentina", "LATAM", "whitelisted"),
    Carrier("timbr", "TIM Brazil", "Brazil", "whitelisted"),
]


def open_carriers() -> list[Carrier]:
    """Return only carriers that do not require serial whitelisting."""
    return [c for c in CARRIERS if c.status == "open"]
