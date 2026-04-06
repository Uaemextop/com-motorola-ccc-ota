"""LSA API client with cookie-based auth and rotating Bearer tokens.

Authentication flow (OAuth2/PKCE — current)
--------------------------------------------
1. Call ``get_oauth2_login_url()`` → returns Passport authorize URL.
2. User authenticates at Passport → redirects to callback with code.
3. Callback page JS exchanges code → returns ``softwareFix://`` URL with WUST.
4. ``login(wust)`` posts WUST + GUID to ``lenovoIdLogin.jhtml`` → Bearer token.
5. Every subsequent request sends ``Authorization: Bearer <token>``
   and replaces the stored token with the new one from the response.

Authentication flow (cookie bypass — legacy)
----------------------------------------------
1. User provides Lenovo Passport cookies (JSON array of cookie objects).
2. The ``LPSWUST`` cookie carries the WUST token.
3. ``login()`` posts the WUST + a random GUID to
   ``/Interface/user/lenovoIdLogin.jhtml`` and stores the first
   Bearer token from the response ``Authorization`` header.

IP restriction
--------------
- Login accepts ANY WUST value and returns a Bearer token + userId.
- However, tokens are **IP-restricted**: calls from datacenter IPs
  (AWS, Azure, GCP) get ``403 Invalid token`` on all subsequent endpoints.
- Only ``vip/card`` (GET) and unauthenticated endpoints work from any IP.
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
    GET_API_INFO_URL,
    GET_BROADCAST_URL,
    GET_FEEDBACK_ISSUE_INFO_URL,
    GET_MODEL_NAMES_URL,
    GET_NEXT_UPDATE_URL,
    GET_OAUTH2_URL,
    GET_RESOURCE_URL,
    LOGIN_URL,
    MODEL_READ_CONFIG_URL,
    MULTILINGUAL_URL,
    OAUTH2_CALLBACK_URL,
    USER_AGENT,
    VIP_CARD_URL,
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
        # LSA uses at most ~3 parameter steps (simCount, country, etc.)
        # but we allow up to 10 for safety.
        for _ in range(10):
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

    # ── unauthenticated endpoints ────────────────────────────────────

    def get_oauth2_login_url(self) -> str:
        """Get the OAuth2/PKCE authorization URL for Passport login.

        This URL should be opened in a browser.  After authentication,
        Passport redirects to the callback page which extracts the WUST
        token and launches the LSA desktop client via ``softwareFix://``.

        Returns
        -------
        str
            Full OAuth2 authorize URL with state, client_id, code_challenge.
        """
        result = self._post(GET_API_INFO_URL, {"key": "TIP_URL"})
        return result.content if result.success else ""

    def get_oauth2_callback_url(self) -> str:
        """Get the OAuth2 callback endpoint URL.

        Returns
        -------
        str
            URL like ``https://lsa.lenovo.com/Interface/user/oauth2/callback.jhtml``.
        """
        r = self._session.get(GET_OAUTH2_URL, timeout=15)
        data = r.json()
        return data.get("msg", "") if data.get("code") == "0000" else ""

    def exchange_oauth2_code(
        self, code: str, scope: str, state: str,
    ) -> str:
        """Exchange an OAuth2 authorization code for a WUST token.

        Parameters
        ----------
        code : str
            Authorization code from Passport redirect.
        scope : str
            OAuth2 scope (typically ``openid``).
        state : str
            State parameter from the original authorize URL.

        Returns
        -------
        str
            WUST token extracted from ``softwareFix://`` URL, or error string.
        """
        r = self._session.get(
            OAUTH2_CALLBACK_URL,
            params={"code": code, "scope": scope, "state": state},
            timeout=30,
        )
        data = r.json()
        desc = data.get("desc", "")
        # On success: desc = "softwareFix://authcallback?wust=<TOKEN>"
        # On failure: desc = "softwareFix://callback?error=<MSG>"
        return desc

    def get_broadcasts(self) -> list:
        """Get broadcast notices (no auth required)."""
        result = self._post(GET_BROADCAST_URL, None)
        return result.content if result.success else []

    def get_feedback_issues(self) -> list:
        """Get feedback issue tree (no auth required)."""
        result = self._post(GET_FEEDBACK_ISSUE_INFO_URL, None)
        return result.content if result.success else []

    def get_multilingual(self) -> dict[str, Any]:
        """Get multilingual translations for the callback page (no auth).

        Returns 18 languages with flag, name, and page translations.
        """
        r = self._session.get(MULTILINGUAL_URL, timeout=15)
        data = r.json()
        return data.get("msg", {}) if data.get("code") == "0000" else {}

    def check_client_update(self, version_code: int = 0) -> dict[str, Any]:
        """Check for LSA client updates (no auth required)."""
        result = self._post(GET_NEXT_UPDATE_URL, {"versionCode": version_code})
        return result.raw

    def get_vip_card(self) -> dict[str, Any]:
        """Get VIP card info (GET, works without proper auth).

        Returns geo-gated response like ``code=0003 'No open permission - US'``.
        """
        return self._get(VIP_CARD_URL).raw

    def read_model_config(self, model_name: str | None = None) -> dict[str, Any]:
        """Read rescue-device configuration (no auth required)."""
        dparams = {"modelName": model_name} if model_name else None
        result = self._post(MODEL_READ_CONFIG_URL, dparams)
        return result.raw
