"""High-level OTA API client.

Implements the request flow observed in the smali bytecode:
  1. Build check-request payload  (CheckRequestBuilder)
  2. Construct endpoint URL        (CheckUrlConstructor)
  3. Attach auth headers           (OTAAuthenticator)
  4. POST to CDS server            (WebServiceThread / Volley)
  5. Parse response                (CheckResponseBuilder)
"""

from __future__ import annotations

import json
import logging
import time
from typing import Optional

import requests

from ota_analyzer.auth import OTAAuthenticator
from ota_analyzer.config import Environment, Region, ServerConfig, get_server
from ota_analyzer.config.settings import OTASettings
from ota_analyzer.models.request import CheckRequest
from ota_analyzer.models.response import CheckResponse
from ota_analyzer.utils.url_builder import URLBuilder

logger = logging.getLogger(__name__)


class OTAClient:
    """Stateful client that mirrors the CDS communication layer.

    Usage::

        client = OTAClient.create(region=Region.GLOBAL)
        response = client.check_update(request)
    """

    def __init__(
        self,
        server: ServerConfig,
        settings: OTASettings,
        authenticator: OTAAuthenticator,
        url_builder: URLBuilder,
        timeout: int = 30,
    ) -> None:
        self._server = server
        self._settings = settings
        self._auth = authenticator
        self._url = url_builder
        self._timeout = timeout
        self._session = requests.Session()

    # -- factory -----------------------------------------------------------

    @classmethod
    def create(
        cls,
        region: Region = Region.GLOBAL,
        environment: Environment = Environment.PRODUCTION,
        timeout: int = 30,
    ) -> "OTAClient":
        """Convenience factory that wires all dependencies."""
        server = get_server(region, environment)
        settings = OTASettings()
        auth = OTAAuthenticator(settings=settings)
        url_builder = URLBuilder(server=server, settings=settings)
        return cls(
            server=server,
            settings=settings,
            authenticator=auth,
            url_builder=url_builder,
            timeout=timeout,
        )

    # -- public API --------------------------------------------------------

    def check_update(self, request: CheckRequest) -> CheckResponse:
        """Send a check-for-update request to the CDS server.

        Mirrors the flow in *CheckUpdateHandler.smali*:
          CheckRequestBuilder → URL construction → POST → parse response.

        The context key in the URL comes from ``ro.mot.build.guid``.  If the
        caller did not supply one, the build fingerprint or build ID is used
        as a best-effort fallback.
        """
        ctx_key = (
            request.context_key
            or request.extra_info.fingerprint
            or request.extra_info.build_id
        )
        url = self._url.check_url(ctx_key)
        headers = self._auth.get_check_headers(
            model=request.device_info.model,
            build_id=request.extra_info.build_id,
        )
        payload = request.to_dict()

        logger.info("POST %s", url)
        logger.debug("Payload: %s", json.dumps(payload, indent=2))

        return self._post(url, headers, payload)

    def get_resources(
        self,
        tracking_id: str,
        context_key: str,
    ) -> CheckResponse:
        """Fetch download descriptors for an available update.

        Corresponds to the *cds/upgrade/1/resources* endpoint.
        """
        url = self._url.resources_url(tracking_id, context_key)
        headers = self._auth.get_check_headers()

        logger.info("POST %s (resources)", url)
        return self._post(url, headers, {})

    def report_state(
        self,
        tracking_id: str,
        state: str,
        context_key: str,
    ) -> CheckResponse:
        """Report the current upgrade state back to the server.

        Corresponds to the *cds/upgrade/1/state* endpoint.
        """
        url = self._url.state_url(tracking_id, state, context_key)
        headers = self._auth.get_check_headers()

        logger.info("POST %s (state=%s)", url, state)
        return self._post(url, headers, {})

    # -- internal ----------------------------------------------------------

    def _post(
        self,
        url: str,
        headers: dict[str, str],
        payload: dict,
    ) -> CheckResponse:
        """Execute POST with retry/back-off logic from WebServiceThread.smali."""
        last_error: Optional[Exception] = None

        for attempt, backoff_ms in enumerate(
            self._settings.backoff_values, start=1
        ):
            try:
                resp = self._session.post(
                    url,
                    json=payload,
                    headers=headers,
                    timeout=self._timeout,
                )
                resp.raise_for_status()
                data = resp.json()
                return CheckResponse.from_dict(data, headers=dict(resp.headers))
            except requests.RequestException as exc:
                last_error = exc
                wait = backoff_ms / 1000.0
                logger.warning(
                    "Attempt %d/%d failed (%s). Retrying in %.1fs …",
                    attempt,
                    self._settings.max_retries,
                    exc,
                    wait,
                )
                time.sleep(wait)

        raise ConnectionError(
            f"Request failed after {len(self._settings.backoff_values)} attempts"
        ) from last_error

    def close(self) -> None:
        self._session.close()

    def __enter__(self) -> "OTAClient":
        return self

    def __exit__(self, *exc) -> None:
        self.close()
