"""Data models for Lenovo LSA firmware resources.

These dataclasses mirror the JSON responses from the LSA API.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Optional


@dataclass
class LenovoModel:
    """A device model as returned by ``getModelNames``."""

    category: str
    brand: str
    model_name: str
    market_name: str
    platform: str
    read_support: bool = False
    read_flow: str = ""

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LenovoModel:
        return cls(
            category=data.get("category", ""),
            brand=data.get("brand", ""),
            model_name=data.get("modelName", ""),
            market_name=data.get("marketName", ""),
            platform=data.get("platform", ""),
            read_support=data.get("readSupport", False),
            read_flow=data.get("readFlow", ""),
        )


@dataclass
class FileResource:
    """A downloadable resource (ROM, tool, flash flow, etc.)."""

    id: int = 0
    from_s3: bool = True
    name: str = ""
    uri: str = ""
    resource_type: str = ""
    un_zip: bool = False
    md5: str = ""
    description: str = ""
    publish_date: str = ""

    @classmethod
    def from_dict(cls, data: dict[str, Any] | None) -> FileResource | None:
        if not data:
            return None
        return cls(
            id=data.get("id", 0),
            from_s3=data.get("fromS3", True),
            name=data.get("name", ""),
            uri=data.get("uri", ""),
            resource_type=data.get("type", ""),
            un_zip=data.get("unZip", False),
            md5=data.get("md5", ""),
            description=data.get("description", ""),
            publish_date=data.get("publishDate", ""),
        )


@dataclass
class ParamProperty:
    """A selection parameter (simCount, country, etc.)."""

    label: str = ""
    property: str = ""
    values: list[str] = field(default_factory=list)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> ParamProperty | None:
        prop = data.get("paramProperty")
        if not prop:
            return None
        return cls(
            label=prop.get("label", ""),
            property=prop.get("property", ""),
            values=data.get("paramValues") or [],
        )


@dataclass
class FirmwareResource:
    """Complete firmware resource with all metadata."""

    brand: str = ""
    category: str = ""
    model_name: str = ""
    real_model_name: str = ""
    market_name: str = ""
    carrier: str = ""
    platform: str = ""
    fingerprint: str = ""
    comments: str = ""
    fastboot: bool = False
    backup_popup: bool = False
    rom_match_id: str = ""

    # Nested resources
    rom_resource: Optional[FileResource] = None
    tool_resource: Optional[FileResource] = None
    flash_flow: str = ""
    ota_resource: Optional[FileResource] = None

    # Selection parameters (for multi-step queries)
    param_property: Optional[ParamProperty] = None

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> FirmwareResource:
        return cls(
            brand=data.get("brand") or "",
            category=data.get("category") or "",
            model_name=data.get("modelName") or "",
            real_model_name=data.get("realModelName") or "",
            market_name=data.get("marketName") or "",
            carrier=data.get("carrier") or "",
            platform=data.get("platform") or "",
            fingerprint=data.get("fingerPrint") or "",
            comments=data.get("comments") or "",
            fastboot=data.get("fastboot", False),
            backup_popup=data.get("backUpPopup", False),
            rom_match_id=data.get("romMatchId") or "",
            rom_resource=FileResource.from_dict(data.get("romResource")),
            tool_resource=FileResource.from_dict(data.get("toolResource")),
            flash_flow=data.get("flashFlow") or "",
            ota_resource=FileResource.from_dict(data.get("otaResource")),
            param_property=ParamProperty.from_dict(data),
        )


@dataclass
class LenovoLoginResult:
    """Result of a successful Lenovo ID login."""

    user_id: str = ""
    name: str = ""
    full_name: str = ""
    wust: str = ""
    bearer_token: str = ""
    success: bool = False

    @classmethod
    def from_dict(cls, data: dict[str, Any], wust: str = "") -> LenovoLoginResult:
        content = data.get("content") or {}
        return cls(
            user_id=str(content.get("userId", "")),
            name=content.get("name", ""),
            full_name=content.get("fullName", ""),
            wust=wust,
            bearer_token="",
            success=data.get("code") == "0000",
        )


@dataclass
class LSAResponse:
    """Generic LSA API response wrapper."""

    code: str = ""
    desc: str = ""
    content: Any = None

    @property
    def is_success(self) -> bool:
        return self.code == "0000"

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LSAResponse:
        return cls(
            code=data.get("code", ""),
            desc=data.get("desc", ""),
            content=data.get("content"),
        )
