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
    # --- LATAM --------------------------------------------------------
    Carrier("amxmx", "América Móvil México", "LATAM"),
    Carrier("openmx", "Open Market México", "LATAM"),
    Carrier("retla", "Retail Latin America", "LATAM"),
    Carrier("amxla", "América Móvil LATAM", "LATAM"),
    Carrier("amxpe", "América Móvil Perú", "LATAM"),
    Carrier("tefmx", "Telefónica México", "LATAM"),
    Carrier("amxco", "América Móvil Colombia", "LATAM"),
    Carrier("amxcl", "América Móvil Chile", "LATAM"),
    Carrier("tclmx", "Telcel México", "LATAM"),
    Carrier("openla", "Open Market LATAM", "LATAM"),
    Carrier("attmx", "AT&T México", "LATAM", "whitelisted"),
    Carrier("retar", "Retail Argentina", "LATAM", "whitelisted"),
    Carrier("amxar", "América Móvil Argentina", "LATAM", "whitelisted"),
    # --- Brazil -------------------------------------------------------
    Carrier("retbr", "Retail Brazil", "Brazil"),
    Carrier("amxbr", "América Móvil Brazil", "Brazil"),
    Carrier("tefbr", "Telefónica Brazil", "Brazil"),
    Carrier("timbr", "TIM Brazil", "Brazil", "whitelisted"),
    # --- Europe -------------------------------------------------------
    Carrier("reteu", "Retail Europe", "Europe"),
    Carrier("retgb", "Retail UK", "Europe"),
    Carrier("o2gb", "O2 UK", "Europe"),
    Carrier("eegb", "EE UK", "Europe"),
    Carrier("vfeu", "Vodafone Europe", "Europe"),
    Carrier("3gb", "Three UK", "Europe"),
    Carrier("demogb", "Demo UK", "Europe"),
    Carrier("pluspl", "Plus Poland", "Europe"),
    Carrier("retde", "Retail Germany", "Europe"),
    Carrier("retfr", "Retail France", "Europe"),
    Carrier("retes", "Retail Spain", "Europe"),
    Carrier("retit", "Retail Italy", "Europe"),
    Carrier("retnl", "Retail Netherlands", "Europe"),
    Carrier("openeu", "Open Market Europe", "Europe"),
    Carrier("vfgb", "Vodafone UK", "Europe"),
    Carrier("dteu", "Deutsche Telekom EU", "Europe"),
    # --- North America ------------------------------------------------
    Carrier("retus", "Retail US", "North America"),
    Carrier("vzw", "Verizon", "North America"),
    Carrier("tmo", "T-Mobile US", "North America"),
    Carrier("att", "AT&T US", "North America", "whitelisted"),
    Carrier("sprint", "Sprint US", "North America"),
    Carrier("usc", "US Cellular", "North America"),
    Carrier("fi", "Google Fi", "North America"),
    Carrier("comcast", "Xfinity Mobile", "North America"),
    Carrier("spectrum", "Spectrum Mobile", "North America"),
    Carrier("retca", "Retail Canada", "North America"),
    # --- Asia ---------------------------------------------------------
    Carrier("retin", "Retail India", "Asia", "whitelisted"),
    Carrier("retcn", "Retail China", "Asia"),
    Carrier("openapcn", "Open Market Asia Pacific CN", "Asia"),
    Carrier("retau", "Retail Australia", "Asia"),
    Carrier("retjp", "Retail Japan", "Asia"),
    Carrier("retkr", "Retail Korea", "Asia"),
    Carrier("rettw", "Retail Taiwan", "Asia"),
    # --- Global / Other -----------------------------------------------
    Carrier("retgl", "Retail Global", "Global"),
    Carrier("openmarket", "Open Market", "Global"),
]


def open_carriers() -> list[Carrier]:
    """Return only carriers that do not require serial whitelisting."""
    return [c for c in CARRIERS if c.status == "open"]


def carriers_by_region(region: str) -> list[Carrier]:
    """Return carriers for a given region."""
    return [c for c in CARRIERS if c.region == region]
