"""HTTP client for the Motorola CDS OTA API.

Uses :mod:`requests` for HTTP and :mod:`tenacity` for automatic retries
with exponential back-off (mirrors the retry logic in
``WebServiceThread.smali``).
"""

from __future__ import annotations

import logging
from typing import Any, Optional

import requests
from tenacity import (
    retry,
    retry_if_exception_type,
    stop_after_attempt,
    wait_exponential,
)

from moto_ota.config.servers import DEFAULT_SERVER, SERVERS, Server, ServerEnv
from moto_ota.models.request import build_check_payload
from moto_ota.models.response import CheckResponse

logger = logging.getLogger(__name__)

_HEADERS = {
    "Content-Type": "application/json; charset=utf-8",
    "User-Agent": "com.motorola.ccc.ota",
    "Connection": "Keep-Alive",
    "Accept-Encoding": "gzip",
}


class OTAClient:
    """Stateful client for the Motorola CDS API.

    Usage::

        client = OTAClient()
        resp = client.check("0d5cc74421f2e8a", "amxmx")
        if resp.has_update:
            print(resp.target_version, resp.download_urls)
    """

    def __init__(
        self,
        server: ServerEnv | Server | None = None,
        timeout: int = 30,
    ) -> None:
        if server is None:
            self._server = SERVERS[DEFAULT_SERVER]
        elif isinstance(server, ServerEnv):
            self._server = SERVERS[server]
        else:
            self._server = server
        self._timeout = timeout
        self._session = requests.Session()
        self._session.headers.update(_HEADERS)

    # ── public API ───────────────────────────────────────────────────

    @retry(
        retry=retry_if_exception_type(requests.ConnectionError),
        stop=stop_after_attempt(3),
        wait=wait_exponential(multiplier=1, min=2, max=30),
        reraise=True,
    )
    def check(
        self,
        guid: str,
        carrier: str,
        *,
        context: str = "ota",
        payload: Optional[dict[str, Any]] = None,
    ) -> CheckResponse:
        """Check for an OTA update.

        Parameters
        ----------
        guid:
            Device GUID (``ro.mot.build.guid``, 15 hex chars).
        carrier:
            Carrier code (e.g. ``"amxmx"``).
        context:
            URL context — ``ota``, ``fota``, or ``modem``.
        payload:
            Full JSON body override. If *None*, a minimal payload is
            built automatically.
        """
        url = self._server.check_url(guid, context)
        body = payload or build_check_payload(guid, carrier)

        logger.debug("POST %s", url)
        resp = self._session.post(url, json=body, timeout=self._timeout)
        resp.raise_for_status()

        return CheckResponse.from_dict(
            resp.json(),
            headers=dict(resp.headers),
        )

    def server_versions(self) -> dict[str, Any]:
        """Query ``/versions`` endpoint for server metadata."""
        url = self._server.versions_url()
        resp = self._session.get(url, timeout=self._timeout)
        resp.raise_for_status()
        return resp.json()

    def walk_chain(
        self,
        guid: str,
        carrier: str,
        *,
        max_steps: int = 50,
    ) -> list[CheckResponse]:
        """Walk the full OTA update chain starting from *guid*.

        Each response's ``otaTargetSha1`` becomes the next request's
        GUID.  The chain ends when ``proceed=false``.
        """
        chain: list[CheckResponse] = []
        current = guid

        for _ in range(max_steps):
            resp = self.check(current, carrier)
            if not resp.has_update:
                break
            chain.append(resp)
            next_guid = resp.target_guid
            if not next_guid or next_guid == current:
                break
            current = next_guid

        return chain

    # ── context manager ──────────────────────────────────────────────

    @property
    def server(self) -> Server:
        return self._server

    def close(self) -> None:
        self._session.close()

    def __enter__(self) -> OTAClient:
        return self

    def __exit__(self, *exc: object) -> None:
        self.close()
