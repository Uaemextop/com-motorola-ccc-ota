"""Rich interactive terminal UI for the Motorola OTA Downloader.

Launched when ``moto-ota`` is invoked without a subcommand, or
explicitly via ``moto-ota interactive``.
"""

from __future__ import annotations

import json
from pathlib import Path

from rich.console import Console
from rich.panel import Panel
from rich.prompt import Confirm, IntPrompt, Prompt
from rich.table import Table

from moto_ota import __version__
from moto_ota.config.carriers import CARRIERS, open_carriers
from moto_ota.config.servers import SERVERS, ServerEnv
from moto_ota.core.client import OTAClient
from moto_ota.core.downloader import download_chain

console = Console()


# ── helpers ──────────────────────────────────────────────────────────


def _pick_server() -> ServerEnv:
    """Interactive server selector."""
    console.print("\n[bold]Select CDS server:[/]\n")

    items = list(SERVERS.items())
    for i, (env, srv) in enumerate(items, 1):
        marker = "●" if "production" in env.value else "○"
        console.print(f"  [bold]{i}.[/] {marker} {srv.label}  [dim]{srv.host}[/]")

    choice = IntPrompt.ask(
        "\n[bold]Server[/]",
        default=1,
        choices=[str(i) for i in range(1, len(items) + 1)],
    )
    env = items[choice - 1][0]
    console.print(f"  → [green]{SERVERS[env].label}[/]\n")
    return env


def _pick_carrier() -> str:
    """Interactive carrier selector."""
    console.print("[bold]Select carrier:[/]\n")

    available = open_carriers()
    for i, c in enumerate(available, 1):
        console.print(f"  [bold]{i:>2}.[/] [cyan]{c.code:<10}[/] {c.name}  [dim]{c.region}[/]")

    console.print(f"  [bold]{len(available) + 1:>2}.[/] [yellow]Custom…[/]")

    choice = IntPrompt.ask(
        "\n[bold]Carrier[/]",
        default=1,
        choices=[str(i) for i in range(1, len(available) + 2)],
    )

    if choice <= len(available):
        carrier = available[choice - 1].code
    else:
        carrier = Prompt.ask("[bold]Enter carrier code[/]")

    console.print(f"  → [green]{carrier}[/]\n")
    return carrier


def _get_guid() -> str:
    """Prompt for the device GUID."""
    return Prompt.ask("[bold]Device GUID[/] (ro.mot.build.guid)")


def _show_update(resp) -> None:  # noqa: ANN001
    """Display a single update result."""
    if resp.has_update:
        panel = Panel(
            f"[bold green]Source :[/] {resp.source_version}\n"
            f"[bold green]Target :[/] {resp.target_version}\n"
            f"[bold green]Size   :[/] {resp.size_mb} MB\n"
            f"[bold green]Type   :[/] {resp.update_type}\n"
            f"[bold green]MD5    :[/] {resp.md5}\n"
            f"[bold green]GUID   :[/] {resp.target_guid}",
            title="✅ Update Available",
            border_style="green",
        )
    else:
        cds = resp.x_cds_content_exists
        panel = Panel(
            f"proceed = [bold]false[/]\n"
            f"x-cds-content-exists = [yellow]{cds}[/]\n"
            f"poll after {resp.poll_after_seconds}s",
            title="ℹ️  No Update",
            border_style="yellow",
        )
    console.print(panel)


def _show_chain_table(chain) -> None:  # noqa: ANN001
    """Display the chain as a rich table."""
    table = Table(title=f"OTA Update Chain — {len(chain)} step(s)")
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
        f"\n  [bold]Base :[/] {chain[0].source_version}  →  "
        f"[bold]Latest:[/] {chain[-1].target_version}  "
        f"({total:.1f} MB total)"
    )


# ── main TUI loop ───────────────────────────────────────────────────


def _main_menu() -> int:
    """Show the main action menu and return the choice."""
    console.print("\n[bold]What would you like to do?[/]\n")
    options = [
        ("Check for update", "Single OTA check for a GUID + carrier"),
        ("Walk update chain", "Enumerate all updates to latest build"),
        ("Download updates", "Download full chain to disk"),
        ("List servers", "Show available CDS servers"),
        ("List carriers", "Show known carrier codes"),
        ("Exit", ""),
    ]
    for i, (label, desc) in enumerate(options, 1):
        if desc:
            console.print(f"  [bold]{i}.[/] {label}  [dim]— {desc}[/]")
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
            "[dim]Use the menu below or run [bold]moto-ota --help[/dim][bold][/bold] for CLI mode.",
            border_style="blue",
        )
    )

    while True:
        choice = _main_menu()

        # ── 1. Check ─────────────────────────────────────────────
        if choice == 1:
            env = _pick_server()
            guid = _get_guid()
            carrier = _pick_carrier()

            with console.status("[bold]Checking for update…[/]"):
                with OTAClient(env) as client:
                    resp = client.check(guid, carrier)
            _show_update(resp)

        # ── 2. Chain ─────────────────────────────────────────────
        elif choice == 2:
            env = _pick_server()
            guid = _get_guid()
            carrier = _pick_carrier()

            with console.status("[bold]Walking update chain…[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)

            if updates:
                _show_chain_table(updates)
            else:
                console.print("[yellow]No updates found.[/]")

        # ── 3. Download ──────────────────────────────────────────
        elif choice == 3:
            env = _pick_server()
            guid = _get_guid()
            carrier = _pick_carrier()

            out = Prompt.ask(
                "[bold]Output directory[/]", default="downloads"
            )
            output_dir = Path(out)

            with console.status("[bold]Enumerating chain…[/]"):
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

            saved = download_chain(updates, carrier, output_dir)

            console.print(
                f"\n[bold green]✅ Downloaded {len(saved)} file(s)[/] → {output_dir}"
            )
            for p in saved:
                console.print(f"  📦 {p.name}")

        # ── 4. Servers ───────────────────────────────────────────
        elif choice == 4:
            table = Table(title="CDS Servers")
            table.add_column("Name", style="bold")
            table.add_column("Host")
            table.add_column("Description")
            for env, srv in SERVERS.items():
                style = "green" if "production" in env.value else "dim"
                table.add_row(f"[{style}]{env.value}[/]", srv.host, srv.description)
            console.print(table)

        # ── 5. Carriers ──────────────────────────────────────────
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

        # ── 6. Exit ──────────────────────────────────────────────
        elif choice == 6:
            console.print("[bold]Goodbye! 👋[/]")
            break
