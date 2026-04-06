"""Typer CLI for the Motorola OTA Downloader.

Commands
--------
* ``moto-ota check``     -- check for a single update
* ``moto-ota chain``     -- walk the full update chain
* ``moto-ota download``  -- download OTA files
* ``moto-ota servers``   -- list available CDS servers
* ``moto-ota carriers``  -- list known carrier codes
* ``moto-ota scan``      -- scan carriers against a GUID to detect status & OTA versions
* ``moto-ota config``    -- show / edit persistent configuration
* ``moto-ota``           -- (no subcommand) launch interactive TUI
* ``moto-ota lenovo login``     -- login to LSA with cookies
* ``moto-ota lenovo models``    -- list Motorola models available for rescue
* ``moto-ota lenovo firmware``  -- get firmware download links for a model
"""

from __future__ import annotations

import concurrent.futures
import json
from pathlib import Path
from typing import Optional

import requests
import typer
from rich import print as rprint
from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.text import Text

from moto_ota import __version__
from moto_ota.config.app_config import APP_CONFIG_FIELDS
from moto_ota.config.carriers import CARRIERS, Carrier, all_scannable_carriers
from moto_ota.config.device_config import DEVICE_CONFIG_FIELDS
from moto_ota.config.manager import (
    app_config_path,
    device_config_path,
    load_app_config,
    load_device_config,
)
from moto_ota.config.servers import DEFAULT_SERVER, SERVERS, ServerEnv
from moto_ota.core.client import OTAClient
from moto_ota.core.downloader import download_chain
from moto_ota.models.request import build_check_payload
from moto_ota.models.response import CheckResponse

console = Console()

app = typer.Typer(
    name="moto-ota",
    help="Download Motorola OTA updates from CDS servers.",
    add_completion=False,
    no_args_is_help=False,
    rich_markup_mode="rich",
)


def _resolve_server(name: str) -> ServerEnv:
    """Resolve a server name to a ServerEnv."""
    try:
        return ServerEnv(name)
    except ValueError:
        for env in ServerEnv:
            if env.value.startswith(name):
                return env
        raise typer.BadParameter(
            f"Unknown server '{name}'.  "
            f"Valid: {', '.join(e.value for e in ServerEnv)}"
        )


# -- commands ----------------------------------------------------------


@app.command()
def check(
    guid: str = typer.Option(..., "--guid", "-g", help="Device GUID (ro.mot.build.guid)"),
    carrier: str = typer.Option(..., "--carrier", "-c", help="Carrier code (e.g. amxmx)"),
    server: str = typer.Option(
        DEFAULT_SERVER.value,
        "--server",
        "-s",
        help="CDS server environment",
    ),
    output_json: Optional[Path] = typer.Option(
        None, "--output", "-o", help="Save full response to JSON file"
    ),
) -> None:
    """Check for an OTA update."""
    env = _resolve_server(server)

    with OTAClient(env) as client:
        console.print(
            f"[bold]Checking[/] {SERVERS[env].label}  "
            f"guid=[cyan]{guid}[/]  carrier=[green]{carrier}[/]"
        )
        resp = client.check(guid, carrier)

    if resp.has_update:
        panel = Panel(
            f"[bold green]Source:[/] {resp.source_version}\n"
            f"[bold green]Target:[/] {resp.target_version}\n"
            f"[bold green]Size  :[/] {resp.size_mb} MB\n"
            f"[bold green]Type  :[/] {resp.update_type}\n"
            f"[bold green]MD5   :[/] {resp.md5}\n"
            f"[bold green]GUID  :[/] {resp.target_guid}",
            title="Update Available",
            border_style="green",
        )
        console.print(panel)
        if resp.download_urls:
            console.print(f"\n[bold]Download URLs[/] ({len(resp.download_urls)}):")
            for url in resp.download_urls:
                console.print(f"  [dim]{url[:100]}...[/]")
    else:
        cds = resp.x_cds_content_exists
        console.print(
            Panel(
                f"Server returned [bold]proceed=false[/]\n"
                f"x-cds-content-exists: [yellow]{cds}[/]\n"
                f"poll after: {resp.poll_after_seconds}s",
                title="No Update",
                border_style="yellow",
            )
        )

    if output_json:
        output_json.write_text(json.dumps(resp.raw or {}, indent=2, ensure_ascii=False))
        console.print(f"\n[dim]Saved to {output_json}[/]")


@app.command()
def chain(
    guid: str = typer.Option(..., "--guid", "-g", help="Starting GUID"),
    carrier: str = typer.Option(..., "--carrier", "-c", help="Carrier code"),
    server: str = typer.Option(DEFAULT_SERVER.value, "--server", "-s"),
    max_steps: int = typer.Option(50, "--max-steps", "-n"),
    output_json: Optional[Path] = typer.Option(None, "--output", "-o"),
) -> None:
    """Walk the full OTA update chain from a starting GUID."""
    env = _resolve_server(server)

    with OTAClient(env) as client:
        console.print(
            f"[bold]Walking chain[/] on {SERVERS[env].label}  "
            f"guid=[cyan]{guid}[/]  carrier=[green]{carrier}[/]"
        )
        updates = client.walk_chain(guid, carrier, max_steps=max_steps)

    if not updates:
        console.print("[yellow]No updates found in chain.[/]")
        raise typer.Exit(1)

    table = Table(title=f"OTA Chain -- {len(updates)} update(s)")
    table.add_column("#", style="bold", width=4)
    table.add_column("Source", style="cyan")
    table.add_column("Target", style="green")
    table.add_column("Size", justify="right")
    table.add_column("Type")
    table.add_column("Target GUID", style="dim")

    for i, u in enumerate(updates, 1):
        table.add_row(
            str(i),
            u.source_version,
            u.target_version,
            f"{u.size_mb} MB",
            u.update_type,
            u.target_guid[:15],
        )
    console.print(table)

    total_mb = sum(u.size_mb for u in updates)
    console.print(
        f"\n[bold]Base:[/] {updates[0].source_version}  ->  "
        f"[bold]Latest:[/] {updates[-1].target_version}  "
        f"([bold]{total_mb:.1f} MB[/] total)"
    )

    if output_json:
        data = [
            {
                "step": i,
                "source": u.source_version,
                "target": u.target_version,
                "size_mb": u.size_mb,
                "type": u.update_type,
                "target_guid": u.target_guid,
                "md5": u.md5,
                "urls": u.download_urls,
            }
            for i, u in enumerate(updates, 1)
        ]
        output_json.write_text(json.dumps(data, indent=2, ensure_ascii=False))
        console.print(f"[dim]Saved to {output_json}[/]")


@app.command()
def download(
    guid: str = typer.Option(..., "--guid", "-g", help="Starting GUID"),
    carrier: str = typer.Option(..., "--carrier", "-c", help="Carrier code"),
    server: str = typer.Option(DEFAULT_SERVER.value, "--server", "-s"),
    output_dir: Path = typer.Option(
        Path("downloads"), "--output-dir", "-d", help="Save directory"
    ),
    max_steps: int = typer.Option(50, "--max-steps", "-n"),
    no_verify: bool = typer.Option(False, "--no-verify", help="Skip MD5 check"),
) -> None:
    """Download OTA files for the full update chain."""
    env = _resolve_server(server)

    with OTAClient(env) as client:
        console.print(
            f"[bold]Enumerating chain[/] on {SERVERS[env].label}  "
            f"guid=[cyan]{guid}[/]  carrier=[green]{carrier}[/]"
        )
        updates = client.walk_chain(guid, carrier, max_steps=max_steps)

    if not updates:
        console.print("[yellow]No updates to download.[/]")
        raise typer.Exit(1)

    total_mb = sum(u.size_mb for u in updates)
    console.print(
        f"\n[bold]{len(updates)}[/] update(s), "
        f"[bold]{total_mb:.1f} MB[/] total\n"
    )

    saved = download_chain(
        updates, carrier, output_dir, verify=not no_verify
    )

    console.print(f"\n[bold green]Downloaded {len(saved)} file(s)[/] -> {output_dir}")
    for p in saved:
        console.print(f"  {p.name}")


@app.command()
def servers() -> None:
    """List available CDS servers."""
    table = Table(title="CDS Servers")
    table.add_column("Name", style="bold")
    table.add_column("Host")
    table.add_column("Description")

    for env, srv in SERVERS.items():
        style = "green" if "production" in env.value else "dim"
        table.add_row(f"[{style}]{env.value}[/]", srv.host, srv.description)

    console.print(table)


@app.command()
def carriers(
    region: Optional[str] = typer.Option(None, "--region", "-r", help="Filter by region"),
    show_all: bool = typer.Option(False, "--all", "-a", help="Include whitelisted"),
) -> None:
    """List known carrier codes."""
    table = Table(title="Known Carriers")
    table.add_column("Code", style="bold cyan")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")

    for c in CARRIERS:
        if region and c.region.lower() != region.lower():
            continue
        if not show_all and c.status == "whitelisted":
            continue
        if c.status == "open":
            status_style = "green"
        elif c.status == "whitelisted":
            status_style = "yellow"
        else:
            status_style = "dim"
        table.add_row(c.code, c.name, c.region, f"[{status_style}]{c.status}[/]")

    console.print(table)
    console.print(
        "\n[dim]Tip: use [bold]moto-ota scan --guid <GUID>[/dim] "
        "to auto-detect carrier status and OTA versions.[/]"
    )


@app.command()
def scan(
    guid: str = typer.Option(..., "--guid", "-g", help="Device GUID (ro.mot.build.guid)"),
    server: str = typer.Option(
        DEFAULT_SERVER.value,
        "--server",
        "-s",
        help="CDS server environment",
    ),
    output_json: Optional[Path] = typer.Option(
        None, "--output", "-o", help="Save results to JSON file"
    ),
) -> None:
    """Scan all carriers against a GUID to auto-detect status and OTA versions.

    Tests every known carrier code against the CDS server and classifies each
    as **open** (proceed=true), **whitelisted** (x-cds-content-exists but
    proceed=false), or no content.  Open carriers show OTA version info for
    cross-carrier comparison.

    Uses parallel requests for fast scanning (~30 seconds for 400+ carriers).
    """
    env = _resolve_server(server)
    srv = SERVERS[env]
    available = all_scannable_carriers()
    total = len(available)

    results_open: list[dict] = []
    results_wl: list[dict] = []
    errors = 0

    console.print(
        f"[bold]Scanning {total} carriers[/] on {srv.label}  "
        f"guid=[cyan]{guid}[/]\n"
    )

    def _check_one(carrier: Carrier) -> tuple:
        """Check a single carrier (runs in thread pool)."""
        url = srv.check_url(guid, "ota")
        body = build_check_payload(guid, carrier.code)
        try:
            resp = requests.post(
                url, json=body, timeout=10,
                headers={"User-Agent": "com.motorola.ccc.ota"},
            )
            resp.raise_for_status()
            cr = CheckResponse.from_dict(resp.json(), headers=dict(resp.headers))
            return (carrier, cr, None)
        except Exception as exc:
            return (carrier, None, exc)

    with console.status("[bold cyan]Scanning carriers…[/]") as status:
        with concurrent.futures.ThreadPoolExecutor(max_workers=20) as pool:
            futures = {pool.submit(_check_one, c): c for c in available}
            done = 0
            for future in concurrent.futures.as_completed(futures):
                done += 1
                carrier, resp, exc = future.result()

                if exc is not None:
                    errors += 1
                elif resp is not None:
                    if resp.has_update:
                        results_open.append({
                            "code": carrier.code,
                            "name": carrier.name,
                            "region": carrier.region,
                            "status": "open",
                            "version": resp.target_version or "—",
                            "size": f"{resp.size_mb:.1f} MB",
                            "filename": f"{resp.target_version}_{carrier.code}.zip",
                        })
                    elif resp.x_cds_content_exists:
                        results_wl.append({
                            "code": carrier.code,
                            "name": carrier.name,
                            "region": carrier.region,
                            "status": "whitelisted",
                            "version": "—",
                            "size": "—",
                            "filename": "—",
                        })

                if done % 25 == 0 or done == total:
                    status.update(
                        f"[bold cyan]Scanning carriers…[/]  "
                        f"{done}/{total}  "
                        f"[green]{len(results_open)} open[/]  "
                        f"[yellow]{len(results_wl)} whitelisted[/]"
                    )

    found = len(results_open) + len(results_wl)
    no_content = total - found - errors

    if found == 0:
        console.print(
            Panel(
                f"[yellow]No carriers returned updates for GUID {guid}.[/]\n\n"
                f"[dim]Tested {total} carriers ({errors} errors).\n"
                f"The OTA package may have expired or the GUID is invalid.[/]",
                title="Carrier Scan Results",
                border_style="yellow",
            )
        )
        raise typer.Exit(1)

    # --- Build results table ---
    results_open.sort(key=lambda r: (r["region"], r["code"]))
    results_wl.sort(key=lambda r: (r["region"], r["code"]))

    table = Table(
        title=f"Carrier Scan — {found} carrier(s) for GUID {guid}",
        border_style="cyan",
    )
    table.add_column("Carrier", style="bold cyan")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")
    table.add_column("OTA Version", style="green")
    table.add_column("Size", justify="right")

    for row in results_open:
        table.add_row(
            row["code"], row["name"], row["region"],
            f"[green]{row['status']}[/]",
            row["version"], row["size"],
        )
    for row in results_wl:
        table.add_row(
            row["code"], row["name"], row["region"],
            f"[yellow]{row['status']}[/]",
            row["version"], row["size"],
        )

    console.print(table)
    console.print(
        f"\n  Scanned {total} carriers: "
        f"[bold green]{len(results_open)} open[/], "
        f"[bold yellow]{len(results_wl)} whitelisted[/], "
        f"{no_content} no content"
        + (f", {errors} errors" if errors else "")
    )

    # Version comparison
    versions = {r["version"] for r in results_open if r["version"] != "—"}
    if len(versions) > 1:
        console.print(
            f"\n  [bold yellow]⚠ Multiple OTA versions detected:[/] "
            + ", ".join(sorted(versions))
        )
    elif len(versions) == 1:
        console.print(f"\n  All open carriers have version: [bold green]{versions.pop()}[/]")

    if output_json:
        data = {"guid": guid, "server": env.value, "open": results_open, "whitelisted": results_wl}
        output_json.write_text(json.dumps(data, indent=2, ensure_ascii=False))
        console.print(f"\n[dim]Saved to {output_json}[/]")


@app.command(name="config")
def config_cmd(
    show: bool = typer.Option(False, "--show", help="Display current config"),
    edit: bool = typer.Option(False, "--edit", help="Launch interactive config editor"),
    paths: bool = typer.Option(False, "--paths", help="Show config file paths"),
) -> None:
    """Show or edit persistent configuration."""
    if paths:
        console.print(f"App config:    {app_config_path()}")
        console.print(f"Device config: {device_config_path()}")
        return

    if show or not edit:
        cfg_app = load_app_config()
        cfg_dev = load_device_config()

        # App config table
        t1 = Table(title="App Configuration", show_lines=True)
        t1.add_column("Setting", style="bold cyan", min_width=18)
        t1.add_column("Value", style="green", min_width=20)
        t1.add_column("Description", style="dim")
        for f in APP_CONFIG_FIELDS:
            val = getattr(cfg_app, f["key"], "")
            t1.add_row(f["label"], str(val) if val != "" else "(empty)", f["description"])
        console.print(t1)

        console.print()

        # Device config table
        t2 = Table(title="Device Configuration", show_lines=True)
        t2.add_column("Setting", style="bold cyan", min_width=18)
        t2.add_column("Value", style="green", min_width=20)
        t2.add_column("Description", style="dim")
        for f in DEVICE_CONFIG_FIELDS:
            val = getattr(cfg_dev, f["key"], "")
            t2.add_row(f["label"], str(val) if val != "" else "(empty)", f["description"])
        console.print(t2)

        console.print(f"\n[dim]Config dir: {app_config_path().parent}[/]")

    if edit:
        from moto_ota.tui import _config_menu
        _config_menu()


@app.command()
def interactive() -> None:
    """Launch the interactive terminal UI."""
    from moto_ota.tui import run_tui

    run_tui()


# -- Lenovo LSA sub-commands ------------------------------------------

lenovo_app = typer.Typer(
    name="lenovo",
    help="Lenovo Software Assist (LSA) — Motorola rescue firmware downloads.",
    no_args_is_help=True,
)
app.add_typer(lenovo_app)


def _load_lenovo_cookies(cookies_file: Path) -> list[dict]:
    """Load cookies from a JSON file."""
    if not cookies_file.is_file():
        console.print(f"[red]Cookie file not found:[/] {cookies_file}")
        raise typer.Exit(1)
    try:
        data = json.loads(cookies_file.read_text(encoding="utf-8"))
        if not isinstance(data, list):
            raise ValueError("Expected a JSON array of cookie objects")
        return data
    except (json.JSONDecodeError, ValueError) as exc:
        console.print(f"[red]Invalid cookie file:[/] {exc}")
        raise typer.Exit(1)


@lenovo_app.command(name="login")
def lenovo_login(
    cookies_file: Path = typer.Option(
        ..., "--cookies", "-k",
        help="Path to exported Lenovo Passport cookies (JSON array)",
    ),
) -> None:
    """Login to LSA using exported Lenovo Passport cookies.

    Export cookies from passport.lenovo.com + .lenovo.com in your browser
    (e.g. via EditThisCookie extension) and save as a JSON file.
    The LPSWUST cookie carries the WUST token for authentication.
    """
    from moto_ota.lenovo.client import LenovoLSAClient

    cookies = _load_lenovo_cookies(cookies_file)

    with LenovoLSAClient(cookies) as client:
        console.print("[bold]Logging in to LSA…[/]")
        try:
            user = client.login()
        except (ValueError, RuntimeError) as exc:
            console.print(f"[red]Login failed:[/] {exc}")
            raise typer.Exit(1)

        panel = Panel(
            f"[bold green]User ID :[/] {user.get('userId', '—')}\n"
            f"[bold green]Name    :[/] {user.get('fullName', '—')}\n"
            f"[bold green]Account :[/] {user.get('name', '—')}",
            title="✓ LSA Login Successful",
            border_style="green",
        )
        console.print(panel)


@lenovo_app.command(name="models")
def lenovo_models(
    cookies_file: Path = typer.Option(
        ..., "--cookies", "-k",
        help="Path to exported Lenovo Passport cookies (JSON array)",
    ),
    country: str = typer.Option("Mexico", "--country", "-c", help="Country name"),
    category: str = typer.Option("Phone", "--category", help="Device category"),
    brand: Optional[str] = typer.Option(None, "--brand", "-b", help="Filter by brand"),
    output_json: Optional[Path] = typer.Option(None, "--output", "-o"),
) -> None:
    """List Motorola/Lenovo models available for rescue firmware download."""
    from moto_ota.lenovo.client import LenovoLSAClient

    cookies = _load_lenovo_cookies(cookies_file)

    with LenovoLSAClient(cookies) as client:
        console.print("[bold]Logging in to LSA…[/]")
        try:
            client.login()
        except (ValueError, RuntimeError) as exc:
            console.print(f"[red]Login failed:[/] {exc}")
            raise typer.Exit(1)

        console.print(f"[bold]Fetching models[/] (country={country}, category={category})…")
        models = client.get_model_names(country, category)

    if brand:
        models = [m for m in models if m.brand.lower() == brand.lower()]

    if not models:
        console.print("[yellow]No models found.[/]")
        raise typer.Exit(1)

    table = Table(title=f"LSA Models — {country} / {category} ({len(models)})")
    table.add_column("Model", style="bold cyan")
    table.add_column("Market Name", style="green")
    table.add_column("Brand")
    table.add_column("Platform", style="dim")

    for m in models:
        table.add_row(m.model_name, m.market_name, m.brand, m.platform)

    console.print(table)

    if output_json:
        data = [
            {
                "modelName": m.model_name,
                "marketName": m.market_name,
                "brand": m.brand,
                "platform": m.platform,
            }
            for m in models
        ]
        output_json.write_text(json.dumps(data, indent=2, ensure_ascii=False))
        console.print(f"[dim]Saved to {output_json}[/]")


@lenovo_app.command(name="firmware")
def lenovo_firmware(
    cookies_file: Path = typer.Option(
        ..., "--cookies", "-k",
        help="Path to exported Lenovo Passport cookies (JSON array)",
    ),
    model: str = typer.Option(..., "--model", "-m", help="Model name (e.g. XT2523-2)"),
    market_name: str = typer.Option(..., "--name", "-n", help="Market name (e.g. 'Moto g05')"),
    sim_count: Optional[str] = typer.Option(None, "--sim", help="SIM count (Single/Dual)"),
    country: Optional[str] = typer.Option(None, "--country", "-c", help="Country variant"),
    output_json: Optional[Path] = typer.Option(None, "--output", "-o"),
) -> None:
    """Get firmware download links for a specific Motorola model.

    The LSA API uses a step-by-step parameter selection.  If --sim and
    --country are not provided, the command shows available choices.
    """
    from moto_ota.lenovo.client import LenovoLSAClient
    from moto_ota.lenovo.models import LSAFirmware, ParamChoice

    cookies = _load_lenovo_cookies(cookies_file)

    with LenovoLSAClient(cookies) as client:
        console.print("[bold]Logging in to LSA…[/]")
        try:
            client.login()
        except (ValueError, RuntimeError) as exc:
            console.print(f"[red]Login failed:[/] {exc}")
            raise typer.Exit(1)

        # Build params
        params: dict[str, str] = {}
        if sim_count:
            params["simCount"] = sim_count
        if country:
            params["country"] = country

        console.print(f"[bold]Querying firmware[/] for {model} ({market_name})…")
        result = client.get_resource(model, market_name, **params)

    if result is None:
        console.print("[yellow]No firmware found.[/]")
        raise typer.Exit(1)

    if isinstance(result, ParamChoice):
        console.print(
            Panel(
                f"[bold yellow]Select {result.label}[/] "
                f"(--{result.property_name.lower()}):\n\n"
                + "\n".join(f"  • {v}" for v in result.values),
                title="Parameter Required",
                border_style="yellow",
            )
        )
        raise typer.Exit(0)

    if isinstance(result, LSAFirmware):
        _URI_TRUNC = 120
        lines = [
            f"[bold green]Brand      :[/] {result.brand}",
            f"[bold green]Model      :[/] {result.model_name}",
            f"[bold green]Market     :[/] {result.market_name}",
            f"[bold green]Platform   :[/] {result.platform}",
            f"[bold green]Fingerprint:[/] {result.fingerprint}",
            f"[bold green]Comments   :[/] {result.comments}",
        ]

        if result.rom_resource:
            rom = result.rom_resource
            lines.append(f"\n[bold cyan]ROM:[/] {rom.name}")
            lines.append(f"  URI: [dim]{rom.uri[:_URI_TRUNC]}…[/]")
            if rom.publish_date:
                lines.append(f"  Published: {rom.publish_date}")

        if result.tool_resource:
            tool = result.tool_resource
            lines.append(f"\n[bold cyan]Flash Tool:[/] {tool.name}")
            lines.append(f"  URI: [dim]{tool.uri[:_URI_TRUNC]}…[/]")

        if result.flash_flow:
            lines.append(f"\n[bold cyan]Flash Flow:[/] [dim]{result.flash_flow[:_URI_TRUNC]}…[/]")

        console.print(
            Panel("\n".join(lines), title="Firmware Available", border_style="green")
        )

        if output_json:
            rom = result.rom_resource
            tool = result.tool_resource
            data = {
                "brand": result.brand,
                "modelName": result.model_name,
                "marketName": result.market_name,
                "platform": result.platform,
                "fingerprint": result.fingerprint,
                "comments": result.comments,
                "rom": {
                    "name": rom.name,
                    "uri": rom.uri,
                    "md5": rom.md5,
                    "publishDate": rom.publish_date,
                } if rom else None,
                "tool": {
                    "name": tool.name,
                    "uri": tool.uri,
                } if tool else None,
                "flashFlow": result.flash_flow,
            }
            output_json.write_text(json.dumps(data, indent=2, ensure_ascii=False))
            console.print(f"[dim]Saved to {output_json}[/]")


@lenovo_app.command(name="debug")
def lenovo_debug(
    output_json: Optional[Path] = typer.Option(None, "--output", "-o"),
) -> None:
    """Probe all LSA endpoints and show infrastructure info (no auth needed)."""
    from moto_ota.lenovo.client import LenovoLSAClient

    with LenovoLSAClient() as client:
        results: dict[str, Any] = {}

        # OAuth2 login URL
        console.print("[bold]Probing unauthenticated endpoints…[/]\n")
        oauth_url = client.get_oauth2_login_url()
        console.print(f"[green]OAuth2 URL:[/] {oauth_url[:120]}…")
        results["oauth2_url"] = oauth_url

        # OAuth2 callback URL
        cb_url = client.get_oauth2_callback_url()
        console.print(f"[green]Callback URL:[/] {cb_url}")
        results["callback_url"] = cb_url

        # Broadcasts
        broadcasts = client.get_broadcasts()
        console.print(f"[green]Broadcasts:[/] {len(broadcasts)} items")
        results["broadcasts"] = broadcasts

        # Feedback issues
        issues = client.get_feedback_issues()
        console.print(f"[green]Feedback issues:[/] {len(issues)} root items")

        # Multilingual
        multi = client.get_multilingual()
        langs = multi.get("languages", [])
        console.print(f"[green]Languages:[/] {len(langs)}")
        for lang in langs:
            console.print(f"  {lang.get('flag','?')} {lang.get('code')}: {lang.get('nativeName')}")
        results["languages"] = langs

        # VIP card
        vip = client.get_vip_card()
        console.print(f"[green]VIP card:[/] {vip.get('code')} {vip.get('desc')}")
        results["vip_card"] = vip

        # Client update
        update = client.check_client_update()
        console.print(f"[green]Client update:[/] {update.get('code')} {update.get('desc')}")

        # Login test (any WUST)
        console.print("\n[bold]Testing login with dummy WUST…[/]")
        try:
            user = client.login(wust="debug_probe")
            console.print(
                f"[green]Login OK:[/] userId={user.get('userId')} "
                f"name={user.get('fullName', user.get('name', '—'))}"
            )
            console.print(f"  Bearer token: {client._bearer[:60]}… ({len(client._bearer)} chars)")
            console.print(f"  GUID: {client._guid}")
            results["login"] = {"userId": user.get("userId"), "bearer_length": len(client._bearer)}

            # Test auth on getModelNames
            console.print("\n[bold]Testing authenticated endpoint…[/]")
            models = client.get_model_names("Mexico", "Phone")
            if models:
                console.print(f"[green]getModelNames:[/] {len(models)} models found!")
                results["auth_works"] = True
            else:
                console.print("[yellow]getModelNames:[/] returned empty (403 Invalid token — datacenter IP)")
                results["auth_works"] = False
        except Exception as exc:
            console.print(f"[red]Login failed:[/] {exc}")
            results["login_error"] = str(exc)

        if output_json:
            output_json.write_text(json.dumps(results, indent=2, ensure_ascii=False))
            console.print(f"\n[dim]Saved to {output_json}[/]")


# -- default callback -> launch TUI when no subcommand is given --------


@app.callback(invoke_without_command=True)
def _main(
    ctx: typer.Context,
    version: bool = typer.Option(
        False, "--version", "-V", help="Show version and exit"
    ),
) -> None:
    if version:
        rprint(f"moto-ota [bold]{__version__}[/]")
        raise typer.Exit()
    if ctx.invoked_subcommand is None:
        from moto_ota.tui import run_tui

        run_tui()
