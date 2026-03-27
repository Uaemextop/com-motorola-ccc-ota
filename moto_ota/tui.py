"""Penumbra-style Rich TUI for the Motorola OTA Downloader.

Keyboard-driven interface with split-pane layouts, ASCII art banner,
and purple/blue colour accents.  Uses **only** the ``rich`` library
(no textual, no curses) with ``rich.live.Live`` for real-time display
and raw ``termios`` input for arrow-key navigation.

Launched when ``moto-ota`` is invoked without a subcommand, or
explicitly via ``moto-ota interactive``.
"""

from __future__ import annotations

import select
import sys
import termios
import tty
from pathlib import Path
from typing import Any

from rich.align import Align
from rich.console import Console, Group
from rich.layout import Layout
from rich.live import Live
from rich.panel import Panel
from rich.prompt import Confirm, Prompt
from rich.table import Table
from rich.text import Text

from moto_ota import __version__
from moto_ota.config.app_config import APP_CONFIG_FIELDS
from moto_ota.config.carriers import CARRIERS, open_carriers
from moto_ota.config.device_config import DEVICE_CONFIG_FIELDS
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

# ── colour palette ───────────────────────────────────────────────────
_PURPLE = "#af5fff"
_BLUE = "#5f87ff"
_DIM = "dim"
_BOLD = "bold"

console = Console()

# ── ASCII art logo ───────────────────────────────────────────────────
_LOGO = r"""
 ███╗   ███╗ ██████╗ ████████╗ ██████╗        ██████╗ ████████╗ █████╗
 ████╗ ████║██╔═══██╗╚══██╔══╝██╔═══██╗      ██╔═══██╗╚══██╔══╝██╔══██╗
 ██╔████╔██║██║   ██║   ██║   ██║   ██║█████╗██║   ██║   ██║   ███████║
 ██║╚██╔╝██║██║   ██║   ██║   ██║   ██║╚════╝██║   ██║   ██║   ██╔══██║
 ██║ ╚═╝ ██║╚██████╔╝   ██║   ╚██████╔╝      ╚██████╔╝   ██║   ██║  ██║
 ╚═╝     ╚═╝ ╚═════╝    ╚═╝    ╚═════╝        ╚═════╝    ╚═╝   ╚═╝  ╚═╝
"""

# ── keyboard input ───────────────────────────────────────────────────


def _read_key() -> str:
    """Read a single keypress from stdin in raw mode.

    Returns one of: ``'up'``, ``'down'``, ``'left'``, ``'right'``,
    ``'enter'``, ``'escape'``, ``'quit'``, or the literal character.
    """
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        if ch == "\x1b":
            # Wait briefly for follow-up bytes of an escape sequence
            if select.select([sys.stdin], [], [], 0.05)[0]:
                ch2 = sys.stdin.read(1)
                if ch2 == "[" and select.select([sys.stdin], [], [], 0.05)[0]:
                    ch3 = sys.stdin.read(1)
                    if ch3 == "A":
                        return "up"
                    if ch3 == "B":
                        return "down"
                    if ch3 == "C":
                        return "right"
                    if ch3 == "D":
                        return "left"
            return "escape"
        if ch in ("\r", "\n"):
            return "enter"
        if ch == "q":
            return "quit"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


# ── renderable builders ─────────────────────────────────────────────


def _menu_renderable(
    items: list[str],
    selected: int,
    *,
    title: str = "",
) -> Panel:
    """Build a ``Panel`` showing *items* with a highlighted *selected* row."""
    lines = Text()
    for i, label in enumerate(items):
        if i == selected:
            lines.append("  ▶ ", style=f"bold {_PURPLE}")
            lines.append(f"{label}\n", style=f"bold {_PURPLE}")
        else:
            lines.append(f"    {label}\n", style=_DIM)
    return Panel(
        lines,
        title=f"[bold {_BLUE}]{title}[/]" if title else None,
        border_style=_BLUE,
        padding=(1, 2),
    )


def _description_panel(text: str, *, title: str = "Details") -> Panel:
    """Build a right-side description panel."""
    return Panel(
        Text(text),
        title=f"[bold {_BLUE}]{title}[/]",
        border_style=_BLUE,
        padding=(1, 2),
    )


def _split_layout(
    left: Panel,
    right: Panel,
) -> Layout:
    """Two-column layout (menu | description)."""
    layout = Layout()
    layout.split_row(
        Layout(left, name="menu", ratio=2),
        Layout(right, name="detail", ratio=3),
    )
    return layout


# ── generic selectable menu ──────────────────────────────────────────


def _selectable_menu(
    items: list[str],
    *,
    title: str = "Menu",
    allow_escape: bool = True,
) -> int | None:
    """Show a keyboard-navigated selectable list.

    Returns the chosen index, or ``None`` if the user pressed Escape.
    """
    selected = 0
    with Live(
        _menu_renderable(items, selected, title=title),
        console=console,
        refresh_per_second=30,
        screen=False,
    ) as live:
        while True:
            key = _read_key()
            if key == "up":
                selected = (selected - 1) % len(items)
            elif key == "down":
                selected = (selected + 1) % len(items)
            elif key == "enter":
                return selected
            elif key in ("escape", "quit") and allow_escape:
                return None
            live.update(
                _menu_renderable(items, selected, title=title),
            )


def _description_menu(
    items: list[str],
    descriptions: list[str],
    *,
    title: str = "Menu",
    detail_title: str = "Details",
    allow_escape: bool = True,
) -> int | None:
    """Split-pane menu: list on the left, description on the right.

    Returns the chosen index, or ``None`` on Escape.
    """
    selected = 0

    def _render() -> Layout:
        left = _menu_renderable(items, selected, title=title)
        right = _description_panel(
            descriptions[selected], title=detail_title,
        )
        return _split_layout(left, right)

    with Live(
        _render(),
        console=console,
        refresh_per_second=30,
        screen=False,
    ) as live:
        while True:
            key = _read_key()
            if key == "up":
                selected = (selected - 1) % len(items)
            elif key == "down":
                selected = (selected + 1) % len(items)
            elif key == "enter":
                return selected
            elif key in ("escape", "quit") and allow_escape:
                return None
            live.update(_render())


# ── welcome banner ───────────────────────────────────────────────────


def _welcome_banner() -> Panel:
    """Render the splash banner with logo and version string."""
    logo = Text(_LOGO, style=f"bold {_PURPLE}")
    subtitle = Text.assemble(
        ("Motorola OTA Downloader", f"bold {_BLUE}"),
        ("  v", _DIM),
        (__version__, f"bold {_PURPLE}"),
    )
    hint = Text(
        "↑/↓ Navigate  ·  Enter Select  ·  Esc Back  ·  q Quit",
        style=_DIM,
    )
    body = Group(
        Align.center(logo),
        Align.center(subtitle),
        Text(""),
        Align.center(hint),
    )
    return Panel(body, border_style=_BLUE, padding=(0, 2))


# ── config editing helpers ───────────────────────────────────────────


def _edit_field(field_meta: dict, current_value: Any) -> Any:
    """Show the appropriate editor for a config field.

    For ``choice`` and ``carrier`` types a selectable TUI menu is used;
    for ``bool`` the value is toggled immediately; ``int`` and ``text``
    fall back to ``rich.prompt``.
    """
    ftype = field_meta["type"]
    label = field_meta["label"]

    # -- choice --------------------------------------------------------
    if ftype == "choice":
        choices: list[str] = field_meta["choices"]
        labels = [
            f"{c}  ← current" if c == str(current_value) else c
            for c in choices
        ]
        labels.append("Keep current")
        pick = _selectable_menu(labels, title=f"Select {label}")
        if pick is None or pick >= len(choices):
            return current_value
        return choices[pick]

    # -- carrier -------------------------------------------------------
    if ftype == "carrier":
        available = open_carriers()
        labels = [
            f"{c.code:<10} {c.name}  ({c.region})"
            + ("  ← current" if c.code == current_value else "")
            for c in available
        ]
        labels.append("Enter custom code")
        labels.append("Keep current")
        pick = _selectable_menu(labels, title="Select Carrier")
        if pick is None or pick == len(available) + 1:
            return current_value
        if pick == len(available):
            return Prompt.ask("[bold]Carrier code[/]")
        return available[pick].code

    # -- bool ----------------------------------------------------------
    if ftype == "bool":
        cur = bool(current_value)
        labels = [
            f"True{'  ← current' if cur else ''}",
            f"False{'  ← current' if not cur else ''}",
        ]
        pick = _selectable_menu(labels, title=f"Toggle {label}")
        if pick is None:
            return current_value
        return pick == 0

    # -- int -----------------------------------------------------------
    if ftype == "int":
        lo = field_meta.get("min", 0)
        hi = field_meta.get("max", 999999)
        val = Prompt.ask(
            f"[bold]{label}[/] ({lo}–{hi})",
            default=str(current_value),
        )
        try:
            return max(lo, min(hi, int(val)))
        except ValueError:
            console.print("[red]Invalid number – keeping current value.[/]")
            return current_value

    # -- text ----------------------------------------------------------
    return Prompt.ask(f"[bold]{label}[/]", default=str(current_value))


def _config_fields_labels(
    fields: list[dict[str, Any]],
    cfg: object,
) -> tuple[list[str], list[str]]:
    """Build display labels and descriptions for config field lists."""
    labels: list[str] = []
    descs: list[str] = []
    for f in fields:
        val = getattr(cfg, f["key"], "")
        display_val = str(val) if val != "" else "(empty)"
        labels.append(f"{f['label']:.<24} {display_val}")
        descs.append(
            f"{f['description']}\n\n"
            f"Current value: {display_val}\n"
            f"Type: {f['type']}"
        )
    return labels, descs


def _edit_config_page(
    title: str,
    fields: list[dict[str, Any]],
    cfg: object,
    save_fn,
) -> None:
    """Interactive split-pane config editor."""
    while True:
        labels, descs = _config_fields_labels(fields, cfg)
        labels += ["Save and go back", "Discard and go back"]
        descs += [
            "Persist all changes to disk.",
            "Discard all changes made in this session.",
        ]
        pick = _description_menu(
            labels,
            descs,
            title=title,
            detail_title="Setting Info",
        )
        if pick is None or pick == len(fields) + 1:
            return
        if pick == len(fields):
            path = save_fn(cfg)
            console.print(f"\n[green]Saved to {path}[/]")
            return
        field_meta = fields[pick]
        current = getattr(cfg, field_meta["key"])
        new_val = _edit_field(field_meta, current)
        setattr(cfg, field_meta["key"], new_val)
        console.print(
            f"  → [green]{field_meta['label']}[/] = [bold]{new_val}[/]",
        )


def _config_menu() -> None:
    """Top-level configuration menu (also called from ``cli.py``)."""
    items = [
        "App Configuration",
        "Device Configuration",
        "Show current configs",
        "Back to main menu",
    ]
    descs = [
        f"Server, HTTP headers, timeouts, region.\n\nFile: {app_config_path()}",
        f"GUID, carrier, device parameters.\n\nFile: {device_config_path()}",
        "Display both configs side-by-side in a table.",
        "Return to the main menu.",
    ]
    while True:
        pick = _description_menu(
            items, descs, title="Configuration", detail_title="Info",
        )
        if pick is None or pick == 3:
            return
        if pick == 0:
            cfg = load_app_config()
            _edit_config_page(
                "App Configuration",
                APP_CONFIG_FIELDS,
                cfg,
                save_app_config,
            )
        elif pick == 1:
            cfg = load_device_config()
            _edit_config_page(
                "Device Configuration",
                DEVICE_CONFIG_FIELDS,
                cfg,
                save_device_config,
            )
        elif pick == 2:
            _show_both_configs()


def _show_both_configs() -> None:
    """Print both config tables."""
    cfg_app = load_app_config()
    cfg_dev = load_device_config()
    _show_config_table("App Configuration", APP_CONFIG_FIELDS, cfg_app)
    console.print()
    _show_config_table("Device Configuration", DEVICE_CONFIG_FIELDS, cfg_dev)
    console.print(f"\n[{_DIM}]Press any key to continue…[/]")
    _read_key()


def _show_config_table(
    title: str,
    fields: list[dict[str, Any]],
    config_obj: object,
) -> None:
    """Display a table of current config values."""
    table = Table(title=title, show_lines=True, border_style=_BLUE)
    table.add_column("Setting", style=f"bold {_PURPLE}", min_width=18)
    table.add_column("Value", style="green", min_width=20)
    table.add_column("Description", style=_DIM)
    for f in fields:
        val = getattr(config_obj, f["key"], "")
        table.add_row(
            f["label"],
            str(val) if val != "" else "[dim](empty)[/]",
            Text(f["description"]),
        )
    console.print(table)


# ── operation helpers ────────────────────────────────────────────────


def _pick_server() -> ServerEnv | None:
    """Interactive server selector using selectable menu."""
    items_list = list(SERVERS.items())
    labels = [
        f"{srv.label}  ({srv.host})" for _, srv in items_list
    ]
    descs = [srv.description for _, srv in items_list]
    pick = _description_menu(
        labels, descs, title="Select CDS Server", detail_title="Server Info",
    )
    if pick is None:
        return None
    return items_list[pick][0]


def _pick_carrier() -> str | None:
    """Interactive carrier selector using selectable menu."""
    available = open_carriers()
    labels = [
        f"{c.code:<10} {c.name}  ({c.region})" for c in available
    ]
    labels.append("Custom…")
    descs = [
        f"Code: {c.code}\nName: {c.name}\nRegion: {c.region}\nStatus: {c.status}"
        for c in available
    ]
    descs.append("Enter a custom carrier code manually.")
    pick = _description_menu(
        labels, descs, title="Select Carrier", detail_title="Carrier Info",
    )
    if pick is None:
        return None
    if pick == len(available):
        return Prompt.ask("[bold]Enter carrier code[/]")
    return available[pick].code


def _get_guid() -> str:
    return Prompt.ask("[bold]Device GUID[/] (ro.mot.build.guid)")


def _get_guid_and_carrier() -> tuple[str, str, ServerEnv] | None:
    """Ask for server, GUID, and carrier – or use saved device config.

    Returns ``None`` if the user cancels at any step.
    """
    cfg_dev = load_device_config()
    cfg_app = load_app_config()

    has_saved = bool(cfg_dev.guid and cfg_dev.carrier)
    if has_saved:
        console.print(
            f"\n[{_DIM}]Saved config: guid=[cyan]{cfg_dev.guid}[/] "
            f"carrier=[green]{cfg_dev.carrier}[/] "
            f"server=[{_BLUE}]{cfg_app.server}[/][/]",
        )
        if Confirm.ask("Use saved configuration?", default=True):
            return cfg_dev.guid, cfg_dev.carrier, cfg_app.server_env

    env = _pick_server()
    if env is None:
        return None
    guid = _get_guid()
    if not guid:
        return None
    carrier = _pick_carrier()
    if carrier is None:
        return None
    return guid, carrier, env


# ── result display ───────────────────────────────────────────────────


def _show_update(resp) -> None:
    if resp.has_update:
        body = (
            f"[bold green]Source :[/] {resp.source_version}\n"
            f"[bold green]Target :[/] {resp.target_version}\n"
            f"[bold green]Size   :[/] {resp.size_mb} MB\n"
            f"[bold green]Type   :[/] {resp.update_type}\n"
            f"[bold green]MD5    :[/] {resp.md5}\n"
            f"[bold green]GUID   :[/] {resp.target_guid}"
        )
        panel = Panel(body, title="Update Available", border_style="green")
    else:
        cds = resp.x_cds_content_exists
        body = (
            f"proceed = [bold]false[/]\n"
            f"x-cds-content-exists = [yellow]{cds}[/]\n"
            f"poll after {resp.poll_after_seconds}s"
        )
        panel = Panel(body, title="No Update", border_style="yellow")
    console.print(panel)
    console.print(f"\n[{_DIM}]Press any key to continue…[/]")
    _read_key()


def _show_chain_table(chain) -> None:
    table = Table(
        title=f"OTA Update Chain — {len(chain)} step(s)",
        border_style=_BLUE,
    )
    table.add_column("#", style=_BOLD, width=4)
    table.add_column("Source", style="cyan")
    table.add_column("Target", style="green")
    table.add_column("Size", justify="right")
    table.add_column("Type")
    table.add_column("Target GUID", style=_DIM)
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
        f"\n  [{_BOLD}]Base :[/] {chain[0].source_version}  →  "
        f"[{_BOLD}]Latest:[/] {chain[-1].target_version}  "
        f"({total:.1f} MB total)",
    )
    console.print(f"\n[{_DIM}]Press any key to continue…[/]")
    _read_key()


# ── server / carrier list views ──────────────────────────────────────


def _show_servers() -> None:
    table = Table(title="CDS Servers", border_style=_BLUE)
    table.add_column("Name", style=_BOLD)
    table.add_column("Host")
    table.add_column("Description")
    for env, srv in SERVERS.items():
        style = "green" if "production" in env.value else _DIM
        table.add_row(f"[{style}]{env.value}[/]", srv.host, srv.description)
    console.print(table)
    console.print(f"\n[{_DIM}]Press any key to continue…[/]")
    _read_key()


def _show_carriers() -> None:
    table = Table(title="Known Carriers", border_style=_BLUE)
    table.add_column("Code", style=f"bold {_PURPLE}")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")
    for c in CARRIERS:
        st = "green" if c.status == "open" else "yellow"
        table.add_row(c.code, c.name, c.region, f"[{st}]{c.status}[/]")
    console.print(table)
    console.print(f"\n[{_DIM}]Press any key to continue…[/]")
    _read_key()


# ── main TUI loop ────────────────────────────────────────────────────

_MAIN_ITEMS = [
    "Check for update",
    "Walk update chain",
    "Download updates",
    "List servers",
    "List carriers",
    "Configuration",
    "Exit",
]

_MAIN_DESCS = [
    "Perform a single OTA check for a GUID + carrier combination.\n\n"
    "The server will respond with the next available update (if any).",
    "Enumerate all incremental updates from a base GUID to the\n"
    "latest available build, following the otaTargetSha1 chain.",
    "Walk the full update chain and download every OTA zip\n"
    "to a local directory, with MD5 verification.",
    "Show all known CDS (Content Delivery Service) server\n"
    "endpoints and their current status.",
    "Display the full list of known carrier codes, their names,\n"
    "regions, and whether they are open or whitelisted.",
    "Edit application and device configuration files.\n\n"
    "Settings include server, region, HTTP headers, timeouts,\n"
    "GUID, carrier, and device metadata.",
    "Quit the application.",
]


def run_tui() -> None:
    """Entry point for the interactive terminal UI."""
    fd = sys.stdin.fileno()
    original_attr = termios.tcgetattr(fd)
    try:
        _run_tui_inner()
    except (KeyboardInterrupt, EOFError):
        pass
    finally:
        # Always restore the terminal to a sane state.
        termios.tcsetattr(fd, termios.TCSADRAIN, original_attr)
        console.print(f"\n[bold {_PURPLE}]Goodbye![/]")


def _run_tui_inner() -> None:
    """Core TUI loop (wrapped by ``run_tui`` for terminal safety)."""
    console.print(_welcome_banner())

    while True:
        pick = _description_menu(
            _MAIN_ITEMS,
            _MAIN_DESCS,
            title="Main Menu",
            detail_title="Description",
            allow_escape=False,
        )

        # -- Check for update ------------------------------------------
        if pick == 0:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            with console.status(f"[bold {_PURPLE}]Checking for update…[/]"):
                with OTAClient(env) as client:
                    resp = client.check(guid, carrier)
            _show_update(resp)

        # -- Walk update chain -----------------------------------------
        elif pick == 1:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            with console.status(f"[bold {_PURPLE}]Walking update chain…[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if updates:
                _show_chain_table(updates)
            else:
                console.print("[yellow]No updates found.[/]")
                console.print(f"\n[{_DIM}]Press any key to continue…[/]")
                _read_key()

        # -- Download updates ------------------------------------------
        elif pick == 2:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            out = Prompt.ask("[bold]Output directory[/]", default="downloads")
            output_dir = Path(out)
            with console.status(f"[bold {_PURPLE}]Enumerating chain…[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if not updates:
                console.print("[yellow]No updates to download.[/]")
                console.print(f"\n[{_DIM}]Press any key to continue…[/]")
                _read_key()
                continue
            total = sum(u.size_mb for u in updates)
            console.print(
                f"\n[bold]{len(updates)}[/] update(s), "
                f"[bold]{total:.1f} MB[/] total\n",
            )
            if not Confirm.ask("Start download?", default=True):
                continue
            app_cfg = load_app_config()
            saved = download_chain(
                updates,
                carrier,
                output_dir,
                verify=app_cfg.verify_md5,
            )
            console.print(
                f"\n[bold green]Downloaded {len(saved)} file(s)[/] → {output_dir}",
            )
            for p in saved:
                console.print(f"  {p.name}")
            console.print(f"\n[{_DIM}]Press any key to continue…[/]")
            _read_key()

        # -- List servers ----------------------------------------------
        elif pick == 3:
            _show_servers()

        # -- List carriers ---------------------------------------------
        elif pick == 4:
            _show_carriers()

        # -- Configuration ---------------------------------------------
        elif pick == 5:
            _config_menu()

        # -- Exit ------------------------------------------------------
        elif pick == 6:
            break
