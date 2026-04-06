"""Camoufox browser session manager for Lenovo Passport login.

Uses Camoufox (anti-detect Firefox via Playwright) with:
- TLS fingerprint spoofing
- Real Windows 11 hardware simulation
- Persistent cookies
- Real User-Agent strings

The browser automates the full Lenovo Passport login flow:
  1. Navigate to passport.lenovo.com preLogin page
  2. Fill username + password
  3. Handle reCAPTCHA (enterprise, auto-solved by browser)
  4. Submit form → redirect to lsa.lenovo.com/Tips/lenovoIdSuccess.html
  5. Extract WUST token from the redirect URL
"""

from __future__ import annotations

import logging
import re
import json
from pathlib import Path
from typing import Optional
from urllib.parse import parse_qs, urlparse

logger = logging.getLogger(__name__)

# Default directory for persistent browser data
_DATA_DIR = Path.home() / ".config" / "moto-ota" / "lenovo-browser"
_COOKIES_FILE = _DATA_DIR / "cookies.json"


def _ensure_data_dir() -> Path:
    """Create and return the persistent data directory."""
    _DATA_DIR.mkdir(parents=True, exist_ok=True)
    return _DATA_DIR


def _load_cookies(path: Path | None = None) -> list[dict]:
    """Load saved cookies from disk."""
    fp = path or _COOKIES_FILE
    if fp.exists():
        try:
            return json.loads(fp.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError):
            logger.warning("Could not load cookies from %s", fp)
    return []


def _save_cookies(cookies: list[dict], path: Path | None = None) -> None:
    """Persist cookies to disk."""
    fp = path or _COOKIES_FILE
    fp.parent.mkdir(parents=True, exist_ok=True)
    fp.write_text(json.dumps(cookies, indent=2), encoding="utf-8")
    logger.debug("Saved %d cookies to %s", len(cookies), fp)


def passport_login(
    username: str,
    password: str,
    *,
    lang: str = "en_US",
    headless: bool = True,
    timeout_ms: int = 60_000,
    data_dir: Path | None = None,
) -> str:
    """Perform Lenovo Passport login using Camoufox and return the WUST token.

    Parameters
    ----------
    username:
        Lenovo ID (email address).
    password:
        Account password (will be encrypted client-side by the login page JS).
    lang:
        Language code for the login page.
    headless:
        Whether to run the browser in headless mode.
    timeout_ms:
        Maximum time in milliseconds to wait for the login flow.
    data_dir:
        Directory for persistent browser data (cookies, storage).

    Returns
    -------
    str
        The WUST token extracted from the success redirect URL.

    Raises
    ------
    RuntimeError
        If login fails or WUST token cannot be extracted.
    ImportError
        If camoufox is not installed.
    """
    try:
        from camoufox.sync_api import Camoufox
    except ImportError:
        raise ImportError(
            "camoufox is required for Lenovo login.  "
            "Install it with: pip install camoufox && python -m camoufox fetch"
        )

    _ensure_data_dir()
    browser_data = data_dir or _DATA_DIR
    saved_cookies = _load_cookies()

    login_url = (
        "https://passport.lenovo.com/glbwebauthnv6/preLogin"
        "?lenovoid.action=uilogin"
        "&lenovoid.realm=lmsaclient"
        "&lenovoid.cb=https://lsa.lenovo.com/Tips/lenovoIdSuccess.html"
        f"&lenovoid.lang={lang}"
    )

    wust: Optional[str] = None

    with Camoufox(
        os="windows",
        humanize=True,
        headless=headless,
        persistent_context=str(browser_data / "profile"),
    ) as browser:
        page = browser.new_page()

        # Restore cookies if available
        if saved_cookies:
            try:
                page.context.add_cookies(saved_cookies)
                logger.debug("Restored %d cookies", len(saved_cookies))
            except Exception:
                logger.warning("Could not restore cookies")

        # Navigate to passport login
        logger.info("Navigating to Lenovo Passport login...")
        page.goto(login_url, wait_until="networkidle", timeout=timeout_ms)

        # Fill credentials
        logger.info("Filling login credentials...")

        # Wait for username field
        username_sel = 'input[name="username"], input[id="username"]'
        page.wait_for_selector(username_sel, timeout=timeout_ms)
        page.fill(username_sel, username)

        # Wait a bit for the username to be processed
        page.wait_for_timeout(1000)

        # Fill password
        password_sel = 'input[name="password"], input[id="password"], input[type="password"]'
        page.wait_for_selector(password_sel, timeout=timeout_ms)
        page.fill(password_sel, password)

        # Click the login button
        login_btn_sel = (
            'button[type="submit"], '
            'input[type="submit"], '
            '#login-btn, '
            '.login-btn, '
            'button:has-text("Sign In"), '
            'button:has-text("Log In")'
        )
        page.wait_for_selector(login_btn_sel, timeout=timeout_ms)
        page.click(login_btn_sel)

        # Wait for redirect to lenovoIdSuccess.html
        logger.info("Waiting for login redirect...")
        try:
            page.wait_for_url(
                "**/Tips/lenovoIdSuccess.html*",
                timeout=timeout_ms,
            )
        except Exception:
            # Try to detect error messages
            error_el = page.query_selector(".error-msg, .login-error, #errorMsg")
            if error_el:
                error_text = error_el.text_content() or "Unknown login error"
                raise RuntimeError(f"Lenovo login failed: {error_text}")
            raise RuntimeError(
                "Lenovo login timed out — check credentials or network"
            )

        # Extract WUST from the redirect URL
        current_url = page.url
        parsed = urlparse(current_url)
        params = parse_qs(parsed.query)

        wust_values = params.get("lenovoid.wust", [])
        if wust_values:
            wust = wust_values[0]
        else:
            # Try to find it in the page content or cookies
            match = re.search(r"lenovoid\.wust=([^&\"']+)", current_url)
            if match:
                wust = match.group(1)

        # Save cookies for future sessions
        cookies = page.context.cookies()
        _save_cookies(cookies)
        logger.info("Login successful, saved %d cookies", len(cookies))

    if not wust:
        raise RuntimeError("Could not extract WUST token from login redirect")

    logger.info("Obtained WUST token: %s...", wust[:30])
    return wust
