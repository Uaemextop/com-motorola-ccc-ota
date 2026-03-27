"""Rich interactive terminal UI for the Motorola OTA Downloader.

Launched when ``moto-ota`` is invoked without a subcommand, or
explicitly via ``moto-ota interactive``.
"""

from __future__ import annotations

from pathlib import Path

from rich.console import Console
from rich.panel import Panel
from rich.prompt import Confirm, IntPrompt, Prompt
from rich.table import Table
from rich.text import Text

from moto_ota import __version__
from moto_ota.config.app_config import APP_CONFIG_FIELDS, AppConfig
from moto_ota.config.carriers import CARRIERS, open_carriers
from moto_ota.config.device_config import DEVICE_CONFIG_FIELDS, DeviceConfig
from moto_ota.config.manager import (
    app_config_path,
    device_config_path,
    load_app_config,
    load_device_config,
    save_app_config,
    save_device_config,
)
from moto_ota.config.servers import SERVERS, ServerEnv
from moto_ota.core.client import OTAClient
from moto_ota.core.downloader import download_chain

console = Console()


# -- generic field editor ----------------------------------------------


def _edit_field(field_meta: dict, current_value) -> object:
    """Show the appropriate editor for a config field and return the
    new value, or *current_value* if unchanged.
    """
    ftype = field_meta["type"]
    label = field_meta["label"]
    desc = field_meta["description"]

    console.print(f"\n[bold]{label}[/]")
    console.print(f"[dim]{desc}[/]")
    console.print(f"Current value: [cyan]{current_value}[/]\n")

    # -- choice --------------------------------------------------------
    if ftype == "choice":
        choices = field_meta["choices"]
        for i, c in enumerate(choices, 1):
            marker = "[green]>[/]" if c == str(current_value) else " "
            console.print(f"  [bold]{i}.[/] {marker} {c}")
        console.print(f"  [bold]{len(choices) + 1}.[/]   Keep current")

        pick = IntPrompt.ask(
            "[bold]Select[/]",
            default=len(choices) + 1,
            choices=[str(i) for i in range(1, len(choices) + 2)],
        )
        if pick <= len(choices):
            return choices[pick - 1]
        return current_value

    # -- carrier (special) ---------------------------------------------
    if ftype == "carrier":
        available = open_carriers()
        for i, c in enumerate(available, 1):
            marker = "[green]>[/]" if c.code == current_value else " "
            console.print(
                f"  [bold]{i:>2}.[/] {marker} [cyan]{c.code:<10}[/] "
                f"{c.name}  [dim]{c.region}[/]"
            )
        console.print(f"  [bold]{len(available) + 1:>2}.[/]   Enter custom code")
        console.print(f"  [bold]{len(available) + 2:>2}.[/]   Keep current")

        pick = IntPrompt.ask(
            "[bold]Select[/]",
            default=len(available) + 2,
            choices=[str(i) for i in range(1, len(available) + 3)],
        )
        if pick <= len(available):
            return available[pick - 1].code
        if pick == len(available) + 1:
            return Prompt.ask("[bold]Carrier code[/]")
        return current_value

    # -- bool ----------------------------------------------------------
    if ftype == "bool":
        return Confirm.ask(f"[bold]{label}[/]", default=bool(current_value))

    # -- int -----------------------------------------------------------
    if ftype == "int":
        lo = field_meta.get("min", 0)
        hi = field_meta.get("max", 999999)
        val = Prompt.ask(
            f"[bold]Value[/] ({lo}-{hi})",
            default=str(current_value),
        )
        try:
            num = int(val)
            return max(lo, min(hi, num))
        except ValueError:
            console.print("[red]Invalid number, keeping current value.[/]")
            return current_value

    # -- text (default) ------------------------------------------------
    val = Prompt.ask("[bold]Value[/]", default=str(current_value))
    return val


# -- config menus ------------------------------------------------------


def _show_config_table(
    title: str,
    fields: list[dict],
    config_obj: object,
) -> None:
    """Display a table of current config values."""
    table = Table(title=title, show_lines=True)
    table.add_column("#", style="bold", width=4)
    table.add_column("Setting", style="bold cyan", min_width=18)
    table.add_column("Value", style="green", min_width=20)
    table.add_column("Description", style="dim")

    for i, f in enumerate(fields, 1):
        val = getattr(config_obj, f["key"], "")
        table.add_row(
            str(i),
            f["label"],
            str(val) if val != "" else "[dim](empty)[/]",
            Text(f["description"]),
        )
    console.print(table)


def _edit_app_config() -> None:
    """Interactive editor for app configuration."""
    cfg = load_app_config()

    while True:
        console.print()
        _show_config_table("App Configuration", APP_CONFIG_FIELDS, cfg)

        n = len(APP_CONFIG_FIELDS)
        console.print(f"\n  [bold]{n + 1}.[/] Save and go back")
        console.print(f"  [bold]{n + 2}.[/] Discard and go back")

        pick = IntPrompt.ask(
            "\n[bold]Edit setting[/]",
            default=n + 1,
            choices=[str(i) for i in range(1, n + 3)],
        )

        if pick == n + 1:
            path = save_app_config(cfg)
            console.print(f"\n[green]Saved to {path}[/]")
            return
        if pick == n + 2:
            console.print("[yellow]Changes discarded.[/]")
            return

        field_meta = APP_CONFIG_FIELDS[pick - 1]
        current = getattr(cfg, field_meta["key"])
        new_val = _edit_field(field_meta, current)
        setattr(cfg, field_meta["key"], new_val)
        console.print(f"  -> [green]{field_meta['label']}[/] = [bold]{new_val}[/]")


def _edit_device_config() -> None:
    """Interactive editor for device configuration."""
    cfg = load_device_config()

    while True:
        console.print()
        _show_config_table("Device Configuration", DEVICE_CONFIG_FIELDS, cfg)

        n = len(DEVICE_CONFIG_FIELDS)
        console.print(f"\n  [bold]{n + 1}.[/] Save and go back")
        console.print(f"  [bold]{n + 2}.[/] Discard and go back")

        pick = IntPrompt.ask(
            "\n[bold]Edit setting[/]",
            default=n + 1,
            choices=[str(i) for i in range(1, n + 3)],
        )

        if pick == n + 1:
            path = save_device_config(cfg)
            console.print(f"\n[green]Saved to {path}[/]")
            return
        if pick == n + 2:
            console.print("[yellow]Changes discarded.[/]")
            return

        field_meta = DEVICE_CONFIG_FIELDS[pick - 1]
        current = getattr(cfg, field_meta["key"])
        new_val = _edit_field(field_meta, current)
        setattr(cfg, field_meta["key"], new_val)
        console.print(f"  -> [green]{field_meta['label']}[/] = [bold]{new_val}[/]")


def _config_menu() -> None:
    """Top-level configuration menu."""
    while True:
        app_path = app_config_path()
        dev_path = device_config_path()

        console.print(
            Panel(
                f"[bold]Configuration Files[/]\n"
                f"  App:    {app_path}\n"
                f"  Device: {dev_path}",
                title="Configuration",
                border_style="blue",
            )
        )

        console.print("  [bold]1.[/] App Configuration     [dim]-- Server, headers, timeouts, region[/]")
        console.print("  [bold]2.[/] Device Configuration  [dim]-- GUID, carrier, device parameters[/]")
        console.print("  [bold]3.[/] Show current configs  [dim]-- Display both configs side by side[/]")
        console.print("  [bold]4.[/] Back to main menu")

        pick = IntPrompt.ask(
            "\n[bold]Choice[/]", default=4, choices=["1", "2", "3", "4"]
        )

        if pick == 1:
            _edit_app_config()
        elif pick == 2:
            _edit_device_config()
        elif pick == 3:
            cfg_app = load_app_config()
            cfg_dev = load_device_config()
            _show_config_table("App Configuration", APP_CONFIG_FIELDS, cfg_app)
            console.print()
            _show_config_table("Device Configuration", DEVICE_CONFIG_FIELDS, cfg_dev)
        else:
            return


# -- operation helpers -------------------------------------------------


def _pick_server() -> ServerEnv:
    """Interactive server selector."""
    console.print("\n[bold]Select CDS server:[/]\n")
    items = list(SERVERS.items())
    for i, (env, srv) in enumerate(items, 1):
        marker = "*" if "production" in env.value else " "
        console.print(f"  [bold]{i}.[/] {marker} {srv.label}  [dim]{srv.host}[/]")
    choice = IntPrompt.ask(
        "\n[bold]Server[/]",
        default=1,
        choices=[str(i) for i in range(1, len(items) + 1)],
    )
    env = items[choice - 1][0]
    console.print(f"  -> [green]{SERVERS[env].label}[/]\n")
    return env


def _pick_carrier() -> str:
    """Interactive carrier selector."""
    console.print("[bold]Select carrier:[/]\n")
    available = open_carriers()
    for i, c in enumerate(available, 1):
        console.print(
            f"  [bold]{i:>2}.[/] [cyan]{c.code:<10}[/] {c.name}  [dim]{c.region}[/]"
        )
    console.print(f"  [bold]{len(available) + 1:>2}.[/] [yellow]Custom...[/]")
    choice = IntPrompt.ask(
        "\n[bold]Carrier[/]",
        default=1,
        choices=[str(i) for i in range(1, len(available) + 2)],
    )
    if choice <= len(available):
        carrier = available[choice - 1].code
    else:
        carrier = Prompt.ask("[bold]Enter carrier code[/]")
    console.print(f"  -> [green]{carrier}[/]\n")
    return carrier


def _get_guid() -> str:
    """Prompt for the device GUID."""
    return Prompt.ask("[bold]Device GUID[/] (ro.mot.build.guid)")


def _show_update(resp) -> None:
    if resp.has_update:
        panel = Panel(
            f"[bold green]Source :[/] {resp.source_version}\n"
            f"[bold green]Target :[/] {resp.target_version}\n"
            f"[bold green]Size   :[/] {resp.size_mb} MB\n"
            f"[bold green]Type   :[/] {resp.update_type}\n"
            f"[bold green]MD5    :[/] {resp.md5}\n"
            f"[bold green]GUID   :[/] {resp.target_guid}",
            title="Update Available",
            border_style="green",
        )
    else:
        cds = resp.x_cds_content_exists
        panel = Panel(
            f"proceed = [bold]false[/]\n"
            f"x-cds-content-exists = [yellow]{cds}[/]\n"
            f"poll after {resp.poll_after_seconds}s",
            title="No Update",
            border_style="yellow",
        )
    console.print(panel)


def _show_chain_table(chain) -> None:
    table = Table(title=f"OTA Update Chain -- {len(chain)} step(s)")
    table.add_column("#", style="bold", width=4)
    table.add_column("Source", style="cyan")
    table.add_column("Target", style="green")
    table.add_column("Size", justify="right")
    table.add_column("Type")
    table.add_column("Target GUID", style="dim")
    for i, u in enumerate(chain, 1):
        table.add_row(
            str(i),
            u.source_version,
            u.target_version,
            f"{u.size_mb} MB",
            u.update_type,
            u.target_guid[:15],
        )
    console.print(table)
    total = sum(u.size_mb for u in chain)
    console.print(
        f"\n  [bold]Base :[/] {chain[0].source_version}  ->  "
        f"[bold]Latest:[/] {chain[-1].target_version}  "
        f"({total:.1f} MB total)"
    )


def _get_guid_and_carrier() -> tuple[str, str, ServerEnv]:
    """Ask for server, GUID, and carrier -- or use saved device config."""
    cfg_dev = load_device_config()
    cfg_app = load_app_config()

    has_saved = bool(cfg_dev.guid and cfg_dev.carrier)
    if has_saved:
        console.print(
            f"\n[dim]Saved config: guid=[cyan]{cfg_dev.guid}[/] "
            f"carrier=[green]{cfg_dev.carrier}[/] "
            f"server=[blue]{cfg_app.server}[/][/]"
        )
        if Confirm.ask("Use saved configuration?", default=True):
            return cfg_dev.guid, cfg_dev.carrier, cfg_app.server_env

    env = _pick_server()
    guid = _get_guid()
    carrier = _pick_carrier()
    return guid, carrier, env


# -- main TUI loop -----------------------------------------------------


def _main_menu() -> int:
    """Show the main action menu and return the choice."""
    console.print("\n[bold]What would you like to do?[/]\n")
    options = [
        ("Check for update", "Single OTA check for a GUID + carrier"),
        ("Walk update chain", "Enumerate all updates to latest build"),
        ("Download updates", "Download full chain to disk"),
        ("List servers", "Show available CDS servers"),
        ("List carriers", "Show known carrier codes"),
        ("Configuration", "Edit app & device settings"),
        ("Exit", ""),
    ]
    for i, (label, desc) in enumerate(options, 1):
        if desc:
            console.print(f"  [bold]{i}.[/] {label}  [dim]-- {desc}[/]")
        else:
            console.print(f"  [bold]{i}.[/] {label}")

    return IntPrompt.ask(
        "\n[bold]Choice[/]",
        default=1,
        choices=[str(i) for i in range(1, len(options) + 1)],
    )


def run_tui() -> None:
    """Entry point for the interactive terminal UI."""
    console.print(
        Panel(
            f"[bold]Motorola OTA Downloader[/]  v{__version__}\n"
            "Download OTA updates from Motorola CDS servers\n\n"
            "[dim]Use the menu below or run "
            "moto-ota --help for CLI mode.[/dim]",
            border_style="blue",
        )
    )

    while True:
        choice = _main_menu()

        # -- 1. Check --------------------------------------------------
        if choice == 1:
            guid, carrier, env = _get_guid_and_carrier()
            with console.status("[bold]Checking for update...[/]"):
                with OTAClient(env) as client:
                    resp = client.check(guid, carrier)
            _show_update(resp)

        # -- 2. Chain --------------------------------------------------
        elif choice == 2:
            guid, carrier, env = _get_guid_and_carrier()
            with console.status("[bold]Walking update chain...[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if updates:
                _show_chain_table(updates)
            else:
                console.print("[yellow]No updates found.[/]")

        # -- 3. Download -----------------------------------------------
        elif choice == 3:
            guid, carrier, env = _get_guid_and_carrier()
            out = Prompt.ask("[bold]Output directory[/]", default="downloads")
            output_dir = Path(out)

            with console.status("[bold]Enumerating chain...[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)

            if not updates:
                console.print("[yellow]No updates to download.[/]")
                continue

            total = sum(u.size_mb for u in updates)
            console.print(
                f"\n[bold]{len(updates)}[/] update(s), "
                f"[bold]{total:.1f} MB[/] total\n"
            )
            if not Confirm.ask("Start download?", default=True):
                continue

            app_cfg = load_app_config()
            saved = download_chain(
                updates, carrier, output_dir,
                verify=app_cfg.verify_md5,
            )
            console.print(f"\n[bold green]Downloaded {len(saved)} file(s)[/] -> {output_dir}")
            for p in saved:
                console.print(f"  {p.name}")

        # -- 4. Servers ------------------------------------------------
        elif choice == 4:
            table = Table(title="CDS Servers")
            table.add_column("Name", style="bold")
            table.add_column("Host")
            table.add_column("Description")
            for env, srv in SERVERS.items():
                style = "green" if "production" in env.value else "dim"
                table.add_row(f"[{style}]{env.value}[/]", srv.host, srv.description)
            console.print(table)

        # -- 5. Carriers -----------------------------------------------
        elif choice == 5:
            table = Table(title="Known Carriers")
            table.add_column("Code", style="bold cyan")
            table.add_column("Name")
            table.add_column("Region")
            table.add_column("Status")
            for c in CARRIERS:
                st = "green" if c.status == "open" else "yellow"
                table.add_row(c.code, c.name, c.region, f"[{st}]{c.status}[/]")
            console.print(table)

        # -- 6. Configuration ------------------------------------------
        elif choice == 6:
            _config_menu()

        # -- 7. Exit ---------------------------------------------------
        elif choice == 7:
            console.print("[bold]Goodbye![/]")
            break
