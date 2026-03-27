"""Typer CLI for the Motorola OTA Downloader.

Commands
--------
* ``moto-ota check``     -- check for a single update
* ``moto-ota chain``     -- walk the full update chain
* ``moto-ota download``  -- download OTA files
* ``moto-ota servers``   -- list available CDS servers
* ``moto-ota carriers``  -- list known carrier codes
* ``moto-ota config``    -- show / edit persistent configuration
* ``moto-ota``           -- (no subcommand) launch interactive TUI
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Optional

import typer
from rich import print as rprint
from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.text import Text

from moto_ota import __version__
from moto_ota.config.app_config import APP_CONFIG_FIELDS
from moto_ota.config.carriers import CARRIERS
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
        status_style = "green" if c.status == "open" else "yellow"
        table.add_row(c.code, c.name, c.region, f"[{status_style}]{c.status}[/]")

    console.print(table)


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
