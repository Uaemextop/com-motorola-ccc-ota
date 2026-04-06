"""Data models for LSA API responses.

Structured from the HAR capture of ``lsa.lenovo.com`` API calls.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Optional


@dataclass
class LSAResource:
    """A downloadable resource (ROM, tool, or flash-flow JSON)."""

    id: int
    name: str
    uri: str
    resource_type: str  # ROM, TOOL, etc.
    from_s3: bool = True
    md5: str = ""
    description: str = ""
    publish_date: str = ""
    un_zip: bool = False

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LSAResource:
        return cls(
            id=data.get("id", 0),
            name=data.get("name", ""),
            uri=data.get("uri", ""),
            resource_type=data.get("type", ""),
            from_s3=data.get("fromS3", True),
            md5=data.get("md5", ""),
            description=data.get("description", ""),
            publish_date=data.get("publishDate", "") or "",
            un_zip=data.get("unZip", False),
        )


@dataclass
class LSAModel:
    """A device model entry from getModelNames."""

    model_name: str
    market_name: str
    brand: str = ""
    category: str = ""
    platform: str = ""
    read_support: bool = False

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LSAModel:
        return cls(
            model_name=data.get("modelName", ""),
            market_name=data.get("marketName", ""),
            brand=data.get("brand", ""),
            category=data.get("category", ""),
            platform=data.get("platform", ""),
            read_support=data.get("readSupport", False),
        )


@dataclass
class ParamChoice:
    """A parameter choice returned by getResource (e.g. SIM count, country)."""

    label: str
    property_name: str
    values: list[str] = field(default_factory=list)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> Optional[ParamChoice]:
        prop = data.get("paramProperty")
        vals = data.get("paramValues")
        if not prop or not vals:
            return None
        return cls(
            label=prop.get("label", ""),
            property_name=prop.get("property", ""),
            values=vals,
        )


@dataclass
class LSAFirmware:
    """Full firmware resource data for a specific model variant."""

    brand: str
    model_name: str
    market_name: str
    carrier: str
    platform: str
    fingerprint: str
    comments: str
    fastboot: bool
    flash_flow: str = ""
    rom_resource: Optional[LSAResource] = None
    tool_resource: Optional[LSAResource] = None
    ota_resource: Optional[LSAResource] = None
    backup_popup: bool = False

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LSAFirmware:
        rom = None
        tool = None
        ota = None
        if data.get("romResource"):
            rom = LSAResource.from_dict(data["romResource"])
        if data.get("toolResource"):
            tool = LSAResource.from_dict(data["toolResource"])
        if data.get("otaResource"):
            ota = LSAResource.from_dict(data["otaResource"])

        return cls(
            brand=data.get("brand", "") or "",
            model_name=data.get("modelName", "") or "",
            market_name=data.get("marketName", "") or "",
            carrier=data.get("carrier", "") or "",
            platform=data.get("platform", "") or "",
            fingerprint=data.get("fingerPrint", "") or "",
            comments=data.get("comments", "") or "",
            fastboot=data.get("fastboot", False),
            flash_flow=data.get("flashFlow", "") or "",
            rom_resource=rom,
            tool_resource=tool,
            ota_resource=ota,
            backup_popup=data.get("backUpPopup", False),
        )


@dataclass
class LSAResponse:
    """Generic LSA API response wrapper."""

    code: str
    desc: str
    content: Any = None
    raw: dict[str, Any] = field(default_factory=dict)

    @property
    def success(self) -> bool:
        return self.code == "0000"

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> LSAResponse:
        return cls(
            code=data.get("code", ""),
            desc=data.get("desc", ""),
            content=data.get("content"),
            raw=data,
        )
