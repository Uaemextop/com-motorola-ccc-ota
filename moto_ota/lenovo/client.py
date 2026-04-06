"""LSA API client with cookie-based auth and rotating Bearer tokens.

Authentication flow (cookie bypass)
------------------------------------
1. User provides Lenovo Passport cookies exported from a browser
   session (JSON array of cookie objects).
2. The ``LPSWUST`` cookie carries the WUST token.  If the user
   provides cookies from a *different* session (e.g. from
   ``passport.lenovo.com`` after re-login), the ``lenovoid.wust``
   query parameter from the callback URL can also be used directly.
3. ``login()`` posts the WUST + a random GUID to
   ``/Interface/user/lenovoIdLogin.jhtml`` and stores the first
   Bearer token from the response ``Authorization`` header.
4. Every subsequent request sends ``Authorization: Bearer <token>``
   and replaces the stored token with the new one from the response.
"""

from __future__ import annotations

import json
import uuid
from pathlib import Path
from typing import Any, Optional

import requests

from moto_ota.lenovo.config import (
    CLIENT_VERSION,
    DEFAULT_LANGUAGE,
    GET_MODEL_NAMES_URL,
    GET_RESOURCE_URL,
    LOGIN_URL,
    USER_AGENT,
    WINDOWS_INFO,
)
from moto_ota.lenovo.models import (
    LSAFirmware,
    LSAModel,
    LSAResponse,
    ParamChoice,
)


class LenovoLSAClient:
    """HTTP client for the Lenovo Smart Assistant (LSA) firmware API.

    Parameters
    ----------
    cookies_json : str | Path | list[dict]
        Either a path to a JSON file containing exported browser cookies
        (array of cookie objects), a JSON string, or a pre-parsed list.

    Examples
    --------
    >>> client = LenovoLSAClient("cookies.json")
    >>> client.login()
    >>> models = client.get_model_names("Mexico", "Phone")
    >>> fw = client.get_firmware("XT2523-2", "Moto g05", simCount="Single", country="Mexico")
    """

    def __init__(
        self,
        cookies_json: str | Path | list[dict[str, Any]] | None = None,
        wust: str | None = None,
    ) -> None:
        self._session = requests.Session()
        self._session.headers.update({
            "User-Agent": USER_AGENT,
            "Content-Type": "application/json",
            "Request-Tag": "lmsa",
            "Cache-Control": "no-store,no-cache",
            "Pragma": "no-cache",
            "Connection": "Close",
        })
        self._bearer: str = ""
        self._guid: str = str(uuid.uuid4())
        self._wust: str = wust or ""
        self._user_info: dict[str, Any] = {}

        if cookies_json is not None:
            self._load_cookies(cookies_json)

    # ── cookie loading ───────────────────────────────────────────────

    def _load_cookies(self, source: str | Path | list[dict[str, Any]]) -> None:
        """Load cookies from a JSON file, string, or pre-parsed list."""
        if isinstance(source, list):
            cookies = source
        else:
            path = Path(source)
            if path.is_file():
                cookies = json.loads(path.read_text(encoding="utf-8"))
            else:
                cookies = json.loads(str(source))

        for c in cookies:
            name = c.get("name", "")
            value = c.get("value", "")
            domain = c.get("domain", "")

            # Extract WUST from LPSWUST cookie if not explicitly provided
            if name == "LPSWUST" and not self._wust:
                self._wust = value

            # Set cookies on the session for matching domains
            if domain:
                self._session.cookies.set(
                    name, value, domain=domain.lstrip(".")
                )

    # ── request envelope ─────────────────────────────────────────────

    def _envelope(self, dparams: Any = None) -> dict[str, Any]:
        """Build the standard LSA request envelope."""
        return {
            "client": {"version": CLIENT_VERSION},
            "dparams": dparams,
            "language": DEFAULT_LANGUAGE,
            "windowsInfo": WINDOWS_INFO,
        }

    def _post(self, url: str, dparams: Any = None) -> LSAResponse:
        """POST to an LSA endpoint with rotating Bearer auth."""
        headers: dict[str, str] = {
            "guid": self._guid,
            "clientVersion": CLIENT_VERSION,
        }
        if self._bearer:
            headers["Authorization"] = f"Bearer {self._bearer}"

        resp = self._session.post(
            url,
            json=self._envelope(dparams),
            headers=headers,
            timeout=30,
        )
        resp.raise_for_status()

        # Rotate Bearer token from response header
        new_auth = resp.headers.get("Authorization", "")
        if new_auth:
            self._bearer = new_auth.removeprefix("Bearer ").strip()

        # Update GUID if server returns a new one
        new_guid = resp.headers.get("Guid", "")
        if new_guid:
            self._guid = new_guid

        return LSAResponse.from_dict(resp.json())

    def _get(self, url: str) -> LSAResponse:
        """GET from an LSA endpoint with rotating Bearer auth."""
        headers: dict[str, str] = {
            "guid": self._guid,
            "clientVersion": CLIENT_VERSION,
        }
        if self._bearer:
            headers["Authorization"] = f"Bearer {self._bearer}"

        resp = self._session.get(url, headers=headers, timeout=30)
        resp.raise_for_status()

        new_auth = resp.headers.get("Authorization", "")
        if new_auth:
            self._bearer = new_auth.removeprefix("Bearer ").strip()

        new_guid = resp.headers.get("Guid", "")
        if new_guid:
            self._guid = new_guid

        return LSAResponse.from_dict(resp.json())

    # ── auth ─────────────────────────────────────────────────────────

    def login(self, wust: str | None = None) -> dict[str, Any]:
        """Exchange a WUST token for a Bearer token.

        Parameters
        ----------
        wust : str, optional
            WUST token.  Falls back to the token extracted from cookies.

        Returns
        -------
        dict
            User info dict (userId, name, fullName, etc.).

        Raises
        ------
        ValueError
            If no WUST token is available.
        RuntimeError
            If the login request fails.
        """
        token = wust or self._wust
        if not token:
            raise ValueError(
                "No WUST token available.  Provide it via cookies (LPSWUST) "
                "or the 'wust' parameter."
            )

        result = self._post(LOGIN_URL, {"wust": token, "guid": self._guid})

        if not result.success:
            raise RuntimeError(
                f"LSA login failed: [{result.code}] {result.desc}"
            )

        self._user_info = result.content or {}
        return self._user_info

    @property
    def logged_in(self) -> bool:
        """Whether a Bearer token is available."""
        return bool(self._bearer)

    @property
    def user_info(self) -> dict[str, Any]:
        """User info from the last successful login."""
        return self._user_info

    # ── firmware API ─────────────────────────────────────────────────

    def get_model_names(
        self,
        country: str = "Mexico",
        category: str = "Phone",
    ) -> list[LSAModel]:
        """List device models available for firmware download.

        Parameters
        ----------
        country : str
            Country name (e.g. "Mexico", "Brazil", "United States").
        category : str
            Device category (e.g. "Phone", "Tablet").

        Returns
        -------
        list[LSAModel]
            List of device models.
        """
        result = self._post(
            GET_MODEL_NAMES_URL,
            {"country": country, "category": category},
        )
        if not result.success or not result.content:
            return []

        models_data = result.content.get("models", [])
        return [LSAModel.from_dict(m) for m in models_data]

    def get_resource(
        self,
        model_name: str,
        market_name: str,
        **params: str,
    ) -> LSAFirmware | ParamChoice | None:
        """Get firmware resource for a model, or the next parameter choice.

        The LSA API uses a step-by-step parameter selection:
        ``modelName`` → ``simCount`` → ``country`` → final firmware.

        Each step either returns a ``ParamChoice`` (asking the user to
        choose a value) or the final ``LSAFirmware`` with download URLs.

        Parameters
        ----------
        model_name : str
            Device model (e.g. "XT2523-2").
        market_name : str
            Marketing name (e.g. "Moto g05").
        **params : str
            Additional parameters from previous steps
            (e.g. ``simCount="Single"``, ``country="Mexico"``).

        Returns
        -------
        LSAFirmware | ParamChoice | None
            Final firmware data, the next parameter choice, or None on error.
        """
        dparams = {"modelName": model_name, "marketName": market_name}
        dparams.update(params)

        result = self._post(GET_RESOURCE_URL, dparams)

        if not result.success or not result.content:
            return None

        items = result.content
        if not isinstance(items, list) or len(items) == 0:
            return None

        item = items[0]

        # If there's a paramProperty, the API is asking for a choice
        choice = ParamChoice.from_dict(item)
        if choice is not None:
            return choice

        # Otherwise it's the final firmware data
        return LSAFirmware.from_dict(item)

    def get_firmware(
        self,
        model_name: str,
        market_name: str,
        **params: str,
    ) -> LSAFirmware | None:
        """Convenience wrapper that walks through all parameter choices.

        Automatically selects the first available value for each
        parameter step until the final firmware data is reached.
        Use ``get_resource()`` for interactive selection.

        Parameters
        ----------
        model_name : str
            Device model (e.g. "XT2523-2").
        market_name : str
            Marketing name (e.g. "Moto g05").
        **params : str
            Pre-selected parameters (e.g. ``country="Mexico"``).

        Returns
        -------
        LSAFirmware | None
            Firmware data or None if not found.
        """
        current_params = dict(params)
        for _ in range(10):  # max steps safety
            result = self.get_resource(model_name, market_name, **current_params)
            if result is None:
                return None
            if isinstance(result, LSAFirmware):
                return result
            if isinstance(result, ParamChoice):
                # If the required param is already provided, skip
                if result.property_name in current_params:
                    continue
                # Auto-select first value
                if result.values:
                    current_params[result.property_name] = result.values[0]
                else:
                    return None
        return None

    # ── cleanup ──────────────────────────────────────────────────────

    def close(self) -> None:
        """Close the HTTP session."""
        self._session.close()

    def __enter__(self) -> LenovoLSAClient:
        return self

    def __exit__(self, *exc: Any) -> None:
        self.close()
