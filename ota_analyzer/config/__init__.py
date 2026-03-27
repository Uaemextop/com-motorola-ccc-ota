"""Server endpoint configuration derived from smali analysis."""

from dataclasses import dataclass
from enum import Enum
from typing import Optional


class Environment(Enum):
    """Server environments extracted from CheckUpdateHandler.smali."""
    PRODUCTION = "production"
    STAGING = "staging"
    QA = "qa"
    DEVELOPMENT = "development"


class Region(Enum):
    """Device region classification."""
    GLOBAL = "global"
    PRC = "prc"  # China


@dataclass(frozen=True)
class ServerConfig:
    """Immutable server endpoint configuration."""
    host: str
    base_path: str = "cds/upgrade/1"
    secure: bool = True

    @property
    def scheme(self) -> str:
        return "https" if self.secure else "http"

    @property
    def base_url(self) -> str:
        return f"{self.scheme}://{self.host}"


# Server map extracted from CheckUpdateHandler.smali
_SERVER_MAP: dict[Region, dict[Environment, ServerConfig]] = {
    Region.GLOBAL: {
        Environment.PRODUCTION: ServerConfig(host="moto-cds.appspot.com"),
        Environment.STAGING: ServerConfig(host="moto-cds-staging.appspot.com"),
        Environment.QA: ServerConfig(host="moto-cds-qa.appspot.com"),
        Environment.DEVELOPMENT: ServerConfig(host="moto-cds-dev.appspot.com"),
    },
    Region.PRC: {
        Environment.PRODUCTION: ServerConfig(host="moto-cds.svcmot.cn"),
        Environment.DEVELOPMENT: ServerConfig(host="ota-cn-sdc.blurdev.com"),
    },
}

# File upload server from FileUtils.smali
STORE_SERVER = ServerConfig(host="store-ota.svcmot.com", base_path="")


def get_server(
    region: Region = Region.GLOBAL,
    environment: Environment = Environment.PRODUCTION,
) -> ServerConfig:
    """Retrieve the server config for a given region and environment.

    Falls back to production if the requested environment is unavailable.
    """
    region_servers = _SERVER_MAP.get(region, _SERVER_MAP[Region.GLOBAL])
    return region_servers.get(environment, region_servers[Environment.PRODUCTION])
