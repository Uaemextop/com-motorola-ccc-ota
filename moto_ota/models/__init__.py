"""Data models for OTA requests and responses."""

from moto_ota.models.device import DevicePayload
from moto_ota.models.request import build_check_payload
from moto_ota.models.response import CheckResponse

__all__ = ["CheckResponse", "DevicePayload", "build_check_payload"]
