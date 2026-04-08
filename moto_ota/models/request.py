"""Build OTA check request payloads.

Three helpers are provided:

* :func:`build_check_payload` — minimal payload (only the four routing
  fields).  Works on all production servers.
* :func:`build_resources_payload` — body for the ``/resources`` endpoint
  (refreshes download URLs without re-checking).
* :func:`build_full_payload` — full payload mirroring every field the
  real ``com.motorola.ccc.ota`` APK sends (from ``BuildPropReader.smali``).

``TriggeredBy`` values (from GAE ``contentcheck:v2`` schema):
``user``, ``setup``, ``notification``, ``polling``, ``other``, ``d2d``.
Only ``user`` returns OTA updates on the normal ``/check`` endpoint.
"""

from __future__ import annotations

from enum import Enum
from typing import Any


class TriggeredBy(str, Enum):
    """Valid ``triggeredBy`` values from the GAE contentcheck:v2 schema."""

    USER = "user"
    SETUP = "setup"
    NOTIFICATION = "notification"
    POLLING = "polling"
    OTHER = "other"
    D2D = "d2d"  # device-to-device transfer


def build_check_payload(
    guid: str,
    carrier: str,
    *,
    serial: str = "x",
) -> dict[str, Any]:
    """Return the *minimal* JSON body that CDS accepts.

    Only four fields actually affect server routing (verified April 2026):

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


def build_resources_payload(
    guid: str,
    carrier: str,
    content_timestamp: int,
    *,
    serial: str = "x",
    reason: str = "expired",
) -> dict[str, Any]:
    """Return the JSON body for the ``/resources`` endpoint.

    This refreshes download URLs for an already-checked update without
    performing a full ``/check``.  Requires the ``trackingId`` from the
    original check response (passed in the URL, not the body).
    """
    return {
        "id": serial,
        "contentTimestamp": content_timestamp,
        "deviceInfo": {"country": "", "region": ""},
        "extraInfo": {
            "carrier": carrier,
            "vitalUpdate": False,
            "otaSourceSha1": guid,
        },
        "reason": reason,
    }


def build_full_payload(
    guid: str,
    carrier: str,
    *,
    serial: str = "UNKNOWN",
    model: str = "",
    fingerprint: str = "",
    build_tags: str = "release-keys",
    build_type: str = "user",
    build_device: str = "",
    build_id: str = "",
    build_display_id: str = "",
    build_incremental: str = "",
    channel_id: str = "",
    imei: str = "",
    mccmnc: str = "",
    imei2: str = "",
    mccmnc2: str = "",
    device_token: str = "",
    id_type: str = "",
    client_identity: str = "",
    content_timestamp: int = 0,
    triggered_by: str = "user",
) -> dict[str, Any]:
    """Return the *full* JSON body mirroring the real APK request.

    Field sources (from ``BuildPropReader.smali``):
    - ``carrier`` ← ``ro.mot.build.customerid``
    - ``otaSourceSha1`` ← ``ro.mot.build.guid``
    - ``model`` ← ``ro.product.model``
    - ``fingerprint`` ← ``ro.build.fingerprint``
    - ``buildTags`` ← ``ro.build.tags``
    - ``buildType`` ← ``ro.build.type``
    - ``buildDevice`` ← ``ro.build.device`` (codename)
    - ``buildId`` ← ``ro.build.id``
    - ``buildDisplayId`` ← ``ro.build.display.id``
    - ``buildIncrementalVersion`` ← ``ro.build.version.incremental``
    - ``imei`` ← ``TelephonyManager``
    - ``mccmnc`` ← ``TelephonyManager.getSimOperator``
    """
    return {
        "id": serial,
        "contentTimestamp": content_timestamp,
        "deviceInfo": {"country": "", "region": ""},
        "extraInfo": {
            "carrier": carrier,
            "vitalUpdate": False,
            "otaSourceSha1": guid,
            "model": model,
            "fingerprint": fingerprint,
            "buildTags": build_tags,
            "buildType": build_type,
            "buildDevice": build_device,
            "buildId": build_id,
            "buildDisplayId": build_display_id,
            "buildIncrementalVersion": build_incremental,
            "channel_id": channel_id,
            "imei": imei,
            "mccmnc": mccmnc,
            "imei2": imei2,
            "mccmnc2": mccmnc2,
            "serialNumber": serial,
        },
        "identityInfo": {"clientIdentity": client_identity},
        "idType": id_type,
        "deviceToken": device_token,
        "triggeredBy": triggered_by,
    }
