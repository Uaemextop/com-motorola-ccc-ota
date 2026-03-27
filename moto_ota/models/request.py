"""Build OTA check request payloads.

Two helpers are provided:

* :func:`build_check_payload` — minimal payload (only the four routing
  fields).  Works on all production servers.
* :meth:`DevicePayload.to_dict` — full payload mirroring the real app
  format (for compatibility / debugging).
"""

from __future__ import annotations

from typing import Any


def build_check_payload(
    guid: str,
    carrier: str,
    *,
    serial: str = "x",
) -> dict[str, Any]:
    """Return the *minimal* JSON body that CDS accepts.

    Only four fields actually affect server routing (verified March 2026):

    * ``extraInfo.carrier`` — selects the firmware chain
    * ``extraInfo.otaSourceSha1`` — device GUID (also in URL path)
    * ``extraInfo.vitalUpdate`` — must be ``false``
    * ``triggeredBy`` — must be ``"user"``

    Everything else is cosmetic.
    """
    return {
        "id": serial,
        "deviceInfo": {"country": "", "region": "US"},
        "extraInfo": {
            "carrier": carrier,
            "vitalUpdate": False,
            "otaSourceSha1": guid,
        },
        "triggeredBy": "user",
    }
