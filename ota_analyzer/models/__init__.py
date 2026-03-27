"""Data models for OTA requests and device information."""

from .device_info import DeviceInfo, ExtraInfo, IdentityInfo
from .request import CheckRequest
from .response import CheckResponse

__all__ = [
    "DeviceInfo",
    "ExtraInfo",
    "IdentityInfo",
    "CheckRequest",
    "CheckResponse",
]
