"""Lenovo LSA API client.

Handles the full flow:
  1. Login via Camoufox browser → obtain WUST token
  2. Exchange WUST for Bearer token via ``lenovoIdLogin``
  3. Query ``getModelNames`` (list all models per category/country)
  4. Query ``getResource`` (get firmware ROM/tool URLs for a model)
  5. Download firmware from ``rsddownload-secure.lenovo.com``

All API calls to ``lsa.lenovo.com`` use the LMSA client headers
(User-Agent, Request-Tag, clientVersion) as observed in the HAR
capture.
"""

from __future__ import annotations

import logging
import uuid
from pathlib import Path
from typing import Any, Optional

import requests
from tenacity import (
    retry,
    retry_if_exception_type,
    stop_after_attempt,
    wait_exponential,
)

from moto_ota.lenovo.browser import passport_login
from moto_ota.lenovo.config import (
    CLIENT_VERSION,
    DEFAULT_LANGUAGE,
    GET_MODEL_NAMES_URL,
    GET_RESOURCE_URL,
    LENOVO_ID_LOGIN_URL,
    LSA_HEADERS,
    WINDOWS_INFO,
)
from moto_ota.lenovo.models import (
    FirmwareResource,
    LenovoLoginResult,
    LenovoModel,
    LSAResponse,
)

logger = logging.getLogger(__name__)


def _generate_guid() -> str:
    """Generate a random GUID for the client session."""
    return str(uuid.uuid4())


def _build_body(
    dparams: dict[str, Any] | None = None,
    language: str = DEFAULT_LANGUAGE,
) -> dict[str, Any]:
    """Build the standard LSA API request body."""
    return {
        "client": {"version": CLIENT_VERSION},
        "dparams": dparams,
        "language": language,
        "windowsInfo": WINDOWS_INFO,
    }


class LenovoClient:
    """Client for the Lenovo Smart Assistant (LSA) firmware API.

    Usage::

        client = LenovoClient()
        client.login("user@example.com", "password123")
        models = client.get_model_names(country="Mexico", category="Phone")
        resources = client.get_resource("XT2523-2", "Moto g05", sim_count="Single", country="Mexico")
    """

    def __init__(
        self,
        language: str = DEFAULT_LANGUAGE,
        timeout: int = 30,
    ) -> None:
        self._language = language
        self._timeout = timeout
        self._guid = _generate_guid()
        self._bearer_token: str = ""
        self._wust: str = ""
        self._user_info: Optional[LenovoLoginResult] = None
        self._session = requests.Session()
        self._session.headers.update(LSA_HEADERS)
        self._session.headers["guid"] = self._guid

    # ── Authentication ──────────────────────────────────────────────

    def login(
        self,
        username: str,
        password: str,
        *,
        headless: bool = True,
        browser_timeout_ms: int = 90_000,
        proxy: dict | None = None,
    ) -> LenovoLoginResult:
        """Login to Lenovo ID and obtain a Bearer token.

        This performs a two-step login:
          1. Browser-based Passport login (Camoufox) → WUST token
          2. Exchange WUST for Bearer token via LSA API

        The LSA server uses **rotating tokens**: each response includes
        a new ``Authorization`` header that must be used for the next
        request.  The client tracks this automatically.

        Parameters
        ----------
        username:
            Lenovo ID email.
        password:
            Account password.
        headless:
            Run Camoufox in headless mode.
        browser_timeout_ms:
            Max time for the browser login flow.
        proxy:
            Optional Playwright proxy dict for residential proxy.

        Returns
        -------
        LenovoLoginResult
            Login result with user info and Bearer token.
        """
        # Step 1: Passport login via Camoufox
        logger.info("Step 1: Passport login via Camoufox...")
        self._wust = passport_login(
            username,
            password,
            headless=headless,
            timeout_ms=browser_timeout_ms,
            proxy=proxy,
        )

        # Step 2: Exchange WUST for Bearer token
        logger.info("Step 2: Exchange WUST for Bearer token...")
        body = _build_body(
            dparams={"wust": self._wust, "guid": self._guid},
            language=self._language,
        )

        resp = self._session.post(
            LENOVO_ID_LOGIN_URL,
            json=body,
            timeout=self._timeout,
        )
        resp.raise_for_status()
        data = resp.json()

        result = LenovoLoginResult.from_dict(data, wust=self._wust)

        if not result.success:
            raise RuntimeError(
                f"Lenovo ID login failed: {data.get('desc', 'unknown error')}"
            )

        # Extract rotating Bearer token from response header.
        # The LSA server returns a new Authorization token with every
        # response.  The client must use the latest token for the next
        # request (rotating token pattern).
        self._update_bearer_from_response(resp)

        self._user_info = result
        logger.info("Logged in as %s (userId=%s)", result.full_name, result.user_id)
        return result

    def login_with_wust(self, wust: str) -> LenovoLoginResult:
        """Login using a pre-obtained WUST token (skips Camoufox).

        Useful when the WUST was obtained externally (e.g. via a
        browser session or from a HAR capture).
        """
        self._wust = wust

        body = _build_body(
            dparams={"wust": wust, "guid": self._guid},
            language=self._language,
        )

        resp = self._session.post(
            LENOVO_ID_LOGIN_URL,
            json=body,
            timeout=self._timeout,
        )
        resp.raise_for_status()
        data = resp.json()

        result = LenovoLoginResult.from_dict(data, wust=wust)
        if not result.success:
            raise RuntimeError(
                f"Lenovo ID login failed: {data.get('desc', 'unknown error')}"
            )

        self._update_bearer_from_response(resp)
        self._user_info = result
        logger.info("Logged in as %s (userId=%s)", result.full_name, result.user_id)
        return result

    def _update_bearer_from_response(self, resp: requests.Response) -> None:
        """Extract rotating Authorization token from response headers.

        The LSA server returns a new ``Authorization`` value with every
        response.  The client must send it as ``Bearer <token>`` in the
        next request.
        """
        auth = resp.headers.get("Authorization", "")
        if auth:
            if auth.startswith("Bearer "):
                self._bearer_token = auth
            else:
                self._bearer_token = f"Bearer {auth}"
            logger.debug("Updated Bearer token: %s...", self._bearer_token[:40])

    def set_bearer_token(self, token: str) -> None:
        """Manually set a Bearer token (useful for testing)."""
        if not token.startswith("Bearer "):
            token = f"Bearer {token}"
        self._bearer_token = token

    @property
    def is_authenticated(self) -> bool:
        """Check if the client has a valid session."""
        return bool(self._wust or self._bearer_token)

    def _auth_headers(self) -> dict[str, str]:
        """Build authorization headers for authenticated requests."""
        headers: dict[str, str] = {}
        if self._bearer_token:
            headers["Authorization"] = self._bearer_token
        return headers

    # ── Firmware discovery ──────────────────────────────────────────

    @retry(
        retry=retry_if_exception_type(requests.ConnectionError),
        stop=stop_after_attempt(3),
        wait=wait_exponential(multiplier=1, min=2, max=30),
        reraise=True,
    )
    def get_model_names(
        self,
        *,
        country: str = "",
        category: str = "Phone",
    ) -> list[LenovoModel]:
        """Get all available device models.

        Parameters
        ----------
        country:
            Filter by country (e.g. ``"Mexico"``).
        category:
            Device category (``"Phone"``).

        Returns
        -------
        list[LenovoModel]
            List of available device models with metadata.
        """
        dparams: dict[str, Any] = {"category": category}
        if country:
            dparams["country"] = country

        body = _build_body(dparams=dparams, language=self._language)

        resp = self._session.post(
            GET_MODEL_NAMES_URL,
            json=body,
            headers=self._auth_headers(),
            timeout=self._timeout,
        )
        resp.raise_for_status()
        self._update_bearer_from_response(resp)
        data = resp.json()

        lsa_resp = LSAResponse.from_dict(data)
        if not lsa_resp.is_success:
            raise RuntimeError(f"getModelNames failed: {lsa_resp.desc}")

        models_data = lsa_resp.content.get("models", [])
        return [LenovoModel.from_dict(m) for m in models_data]

    @retry(
        retry=retry_if_exception_type(requests.ConnectionError),
        stop=stop_after_attempt(3),
        wait=wait_exponential(multiplier=1, min=2, max=30),
        reraise=True,
    )
    def get_resource(
        self,
        model_name: str,
        market_name: str,
        *,
        sim_count: str = "",
        country: str = "",
    ) -> list[FirmwareResource]:
        """Get firmware resources for a specific model.

        The LSA API uses a multi-step selection flow:
          1. Query with model name → get parameter options (simCount)
          2. Query with simCount → get country options
          3. Query with country → get final firmware resources

        Parameters
        ----------
        model_name:
            Device model (e.g. ``"XT2523-2"``).
        market_name:
            Market/display name (e.g. ``"Moto g05"``).
        sim_count:
            SIM configuration (``"Single"`` or ``"Dual"``).
        country:
            Country/carrier variant (e.g. ``"Mexico"``).

        Returns
        -------
        list[FirmwareResource]
            Firmware resources with download URLs.
        """
        dparams: dict[str, Any] = {
            "modelName": model_name,
            "marketName": market_name,
        }
        if sim_count:
            dparams["simCount"] = sim_count
        if country:
            dparams["country"] = country

        body = _build_body(dparams=dparams, language=self._language)

        resp = self._session.post(
            GET_RESOURCE_URL,
            json=body,
            headers=self._auth_headers(),
            timeout=self._timeout,
        )
        resp.raise_for_status()
        self._update_bearer_from_response(resp)
        data = resp.json()

        lsa_resp = LSAResponse.from_dict(data)
        if not lsa_resp.is_success:
            raise RuntimeError(f"getResource failed: {lsa_resp.desc}")

        if not isinstance(lsa_resp.content, list):
            return []

        return [FirmwareResource.from_dict(item) for item in lsa_resp.content]

    def discover_firmware(
        self,
        model_name: str,
        market_name: str,
    ) -> list[FirmwareResource]:
        """Auto-discover firmware by walking the multi-step selection flow.

        Queries the API iteratively:
          1. Get SIM count options
          2. For each SIM option, get country options
          3. For each country, get firmware resources

        Returns all firmware variants found.
        """
        all_resources: list[FirmwareResource] = []

        # Step 1: Get initial parameters (usually simCount)
        step1 = self.get_resource(model_name, market_name)
        if not step1:
            return []

        # Check if we got final resources or need more steps
        first = step1[0]
        if first.rom_resource or first.tool_resource:
            # Already have firmware resources
            return step1

        if not first.param_property:
            return step1

        # Step 2: Iterate through parameter values
        prop = first.param_property
        logger.info("Selection step: %s → %s", prop.label, prop.values)

        for value in prop.values:
            kwargs: dict[str, str] = {}
            if prop.property == "simCount":
                kwargs["sim_count"] = value
            elif prop.property == "country":
                kwargs["country"] = value

            step2 = self.get_resource(model_name, market_name, **kwargs)
            if not step2:
                continue

            first2 = step2[0]
            if first2.rom_resource or first2.tool_resource:
                all_resources.extend(step2)
                continue

            # Need another selection step (e.g., country after simCount)
            if first2.param_property:
                prop2 = first2.param_property
                logger.info(
                    "  Sub-step: %s → %s", prop2.label, prop2.values
                )
                for value2 in prop2.values:
                    kwargs2 = dict(kwargs)
                    if prop2.property == "country":
                        kwargs2["country"] = value2
                    elif prop2.property == "simCount":
                        kwargs2["sim_count"] = value2

                    step3 = self.get_resource(
                        model_name, market_name, **kwargs2
                    )
                    for r in step3:
                        if r.rom_resource or r.tool_resource:
                            all_resources.append(r)

        return all_resources

    # ── Context manager ─────────────────────────────────────────────

    def close(self) -> None:
        self._session.close()

    def __enter__(self) -> LenovoClient:
        return self

    def __exit__(self, *exc: object) -> None:
        self.close()
