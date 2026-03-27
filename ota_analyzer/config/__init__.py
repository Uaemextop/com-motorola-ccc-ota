"""Server endpoint configuration derived from smali analysis.

Server map verified by direct probing (March 2026):
  - All servers run the same GAE app (``moto-cds``) with ``mainwithdefaults``
  - ``ota-cn-sdc.blurdev.com`` is an nginx/1.14.1 proxy to ``moto-cds-staging``
  - Non-production servers (staging/QA/dev/blurdev) have **zero** OTA packages
  - ``smartUpdateBitmap`` differs by server: prod=7, staging=7, QA=-1, dev=11
"""

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


# Server map extracted from CheckUpdateHandler.smali + Configs.smali
# Verified by direct curl probing March 2026.
#
# PRC staging: ``ota-cn-sdc.blurdev.com`` is an nginx proxy to
# ``moto-cds-staging.appspot.com`` (same applicationId + applicationVersion).
# PRC QA/Dev fall back to global servers (no PRC-specific instance exists).
_SERVER_MAP: dict[Region, dict[Environment, ServerConfig]] = {
    Region.GLOBAL: {
        Environment.PRODUCTION: ServerConfig(host="moto-cds.appspot.com"),
        Environment.STAGING: ServerConfig(host="moto-cds-staging.appspot.com"),
        Environment.QA: ServerConfig(host="moto-cds-qa.appspot.com"),
        Environment.DEVELOPMENT: ServerConfig(host="moto-cds-dev.appspot.com"),
    },
    Region.PRC: {
        Environment.PRODUCTION: ServerConfig(host="moto-cds.svcmot.cn"),
        Environment.STAGING: ServerConfig(host="ota-cn-sdc.blurdev.com"),
        Environment.QA: ServerConfig(host="moto-cds-qa.appspot.com"),
        Environment.DEVELOPMENT: ServerConfig(host="moto-cds-dev.appspot.com"),
    },
}

# File upload server from FileUtils.smali
STORE_SERVER = ServerConfig(host="store-ota.svcmot.com", base_path="")

# All known CDS servers (for probing / debug commands)
ALL_SERVERS: list[tuple[str, str]] = [
    ("production-global", "moto-cds.appspot.com"),
    ("production-prc", "moto-cds.svcmot.cn"),
    ("staging", "moto-cds-staging.appspot.com"),
    ("blurdev (=staging)", "ota-cn-sdc.blurdev.com"),
    ("qa", "moto-cds-qa.appspot.com"),
    ("dev", "moto-cds-dev.appspot.com"),
]


def get_server(
    region: Region = Region.GLOBAL,
    environment: Environment = Environment.PRODUCTION,
) -> ServerConfig:
    """Retrieve the server config for a given region and environment.

    Falls back to production if the requested environment is unavailable.
    """
    region_servers = _SERVER_MAP.get(region, _SERVER_MAP[Region.GLOBAL])
    return region_servers.get(environment, region_servers[Environment.PRODUCTION])
