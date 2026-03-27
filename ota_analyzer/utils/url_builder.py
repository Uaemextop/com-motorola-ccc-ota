"""URL construction logic derived from CheckUrlConstructor.smali.

The CDS API encodes routing context directly in the URL path rather than
using query parameters.  The pattern is::

    {scheme}://{host}/{basePath}/ctx/{context}/key/{contextKey}

For resources and state endpoints an additional ``/t/{trackingId}`` (and
optionally ``/s/{state}``) segment is inserted.
"""

from __future__ import annotations

from urllib.parse import quote

from ota_analyzer.config import ServerConfig
from ota_analyzer.config.settings import OTASettings


class URLBuilder:
    """Build CDS API endpoint URLs.

    Mirrors the logic found in:
      - CheckUrlConstructor.smali
      - ResourcesUrlConstructor.smali
      - StateUrlConstructor.smali
    """

    def __init__(self, server: ServerConfig, settings: OTASettings) -> None:
        self._server = server
        self._settings = settings

    # -- public API --------------------------------------------------------

    def check_url(self, context_key: str = "") -> str:
        """URL for the *check-for-upgrade* endpoint.

        Pattern: ``/cds/upgrade/1/check/ctx/{ctx}/key/{key}``
        """
        return self._build(
            self._settings.check_url,
            context_key=context_key,
        )

    def resources_url(
        self,
        tracking_id: str,
        context_key: str = "",
    ) -> str:
        """URL for the *download-descriptor* endpoint.

        Pattern: ``/cds/upgrade/1/resources/t/{tid}/ctx/{ctx}/key/{key}``
        """
        return self._build(
            self._settings.resources_url,
            tracking_id=tracking_id,
            context_key=context_key,
        )

    def state_url(
        self,
        tracking_id: str,
        state: str,
        context_key: str = "",
    ) -> str:
        """URL for the *upgrade-state* endpoint.

        Pattern:
        ``/cds/upgrade/1/state/t/{tid}/s/{state}/ctx/{ctx}/key/{key}``
        """
        return self._build(
            self._settings.state_url,
            tracking_id=tracking_id,
            state=state,
            context_key=context_key,
        )

    # -- internal ----------------------------------------------------------

    def _build(
        self,
        path: str,
        *,
        tracking_id: str = "",
        state: str = "",
        context_key: str = "",
    ) -> str:
        base = f"{self._server.base_url}/{path}"
        if tracking_id:
            base += f"/t/{quote(tracking_id, safe='')}"
        if state:
            base += f"/s/{quote(state, safe='')}"
        base += f"/ctx/{quote(self._settings.ota_context, safe='')}"
        if context_key:
            base += f"/key/{quote(context_key, safe='')}"
        return base
