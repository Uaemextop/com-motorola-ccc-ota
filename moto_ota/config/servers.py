"""CDS server endpoints verified by direct probing (March 2026).

Each Motorola CDS environment runs the same GAE ``moto-cds`` application.
Only the **production** servers carry OTA packages; staging/QA/dev/blurdev
always return ``proceed=false``.

``ota-cn-sdc.blurdev.com`` is an nginx/1.14.1 proxy to
``moto-cds-staging.appspot.com`` (identical ``applicationId`` + version).
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import Enum


class ServerEnv(str, Enum):
    """Available CDS server environments."""

    PRODUCTION_GLOBAL = "production-global"
    PRODUCTION_PRC = "production-prc"
    STAGING = "staging"
    QA = "qa"
    DEV = "dev"
    BLURDEV = "blurdev"


@dataclass(frozen=True)
class Server:
    """Immutable CDS server definition."""

    host: str
    label: str
    env: ServerEnv
    description: str = ""

    @property
    def base_url(self) -> str:
        return f"https://{self.host}"

    def check_url(self, guid: str, context: str = "ota") -> str:
        """Build the ``/check`` endpoint URL for a given GUID."""
        return (
            f"{self.base_url}/cds/upgrade/1/check"
            f"/ctx/{context}/key/{guid}"
        )

    def versions_url(self) -> str:
        """Build the ``/versions`` endpoint URL."""
        return f"{self.base_url}/cds/upgrade/1/versions"


SERVERS: dict[ServerEnv, Server] = {
    ServerEnv.PRODUCTION_GLOBAL: Server(
        host="moto-cds.appspot.com",
        label="Production (Global)",
        env=ServerEnv.PRODUCTION_GLOBAL,
        description="Google Frontend — serves most devices worldwide",
    ),
    ServerEnv.PRODUCTION_PRC: Server(
        host="moto-cds.svcmot.cn",
        label="Production (PRC / LATAM)",
        env=ServerEnv.PRODUCTION_PRC,
        description="nginx/1.14.1 — serves China & Latin-American devices",
    ),
    ServerEnv.STAGING: Server(
        host="moto-cds-staging.appspot.com",
        label="Staging",
        env=ServerEnv.STAGING,
        description="Zero OTA packages, smartUpdateBitmap=7",
    ),
    ServerEnv.QA: Server(
        host="moto-cds-qa.appspot.com",
        label="QA",
        env=ServerEnv.QA,
        description="Zero OTA packages, smartUpdateBitmap=-1",
    ),
    ServerEnv.DEV: Server(
        host="moto-cds-dev.appspot.com",
        label="Development",
        env=ServerEnv.DEV,
        description="Zero OTA packages, smartUpdateBitmap=11",
    ),
    ServerEnv.BLURDEV: Server(
        host="ota-cn-sdc.blurdev.com",
        label="Blurdev (≡ Staging)",
        env=ServerEnv.BLURDEV,
        description="nginx proxy → moto-cds-staging; v1/check times out",
    ),
}

DEFAULT_SERVER = ServerEnv.PRODUCTION_PRC
