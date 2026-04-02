"""Core OTA operations."""

from moto_ota.core.client import OTAClient
from moto_ota.core.downloader import download_ota

__all__ = ["OTAClient", "download_ota"]
