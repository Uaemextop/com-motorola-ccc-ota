"""Penumbra-style full-screen TUI for the Motorola OTA Downloader.

Inspired by https://github.com/shomykohai/penumbra — a Rust/ratatui
TUI with:
  · Full-screen alternate buffer with animated starfield background
  · Centred gradient ASCII logo on the welcome page
  · Description-menu component (list left + description right)
  · Status cards showing current config
  · Footer with keyboard-hint bar
  · Rounded borders, accent / muted colour scheme

Uses **only** the ``rich`` library with ``Live(screen=True)`` for
full-screen rendering and raw ``termios`` input for arrow-key
navigation.  The starfield animates via non-blocking key reading
with ``select()`` timeouts.
"""

from __future__ import annotations

import random
import select
import sys
import termios
import tty
from pathlib import Path
from typing import Any

from rich import box
from rich.align import Align
from rich.columns import Columns
from rich.console import Console, Group, RenderableType
from rich.layout import Layout
from rich.live import Live
from rich.padding import Padding
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

# =====================================================================
#  Colour theme  (penumbra-inspired — cyan/blue gradient accent)
# =====================================================================
ACCENT = "bright_cyan"     # primary accent (borders, selected items)
ACCENT2 = "cyan"           # secondary accent
TEXT = "white"             # normal body text
MUTED = "bright_black"    # secondary / disabled text
INFO = "bright_cyan"      # description text
SUCCESS = "green"          # positive status
WARNING = "yellow"         # warning / caution
ERROR = "red"              # errors

# Gradient colours for the ASCII logo (top → bottom)
_LOGO_GRADIENT = [
    "#00e5ff",   # bright cyan
    "#00c8e8",
    "#00aad0",
    "#008cb8",
    "#6070c0",   # blue-ish purple
]

console = Console()

# =====================================================================
#  ASCII logo  (line-by-line for gradient colouring)
# =====================================================================
_LOGO_LINES = [
    " __  __       _              ___  _____  _   ",
    "|  \\/  | ___ | |_ ___       / _ \\|_   _|/ \\  ",
    "| |\\/| |/ _ \\| __/ _ \\ ____| | | | | | / _ \\ ",
    "| |  | | (_) | || (_) |____| |_| | | |/ ___ \\",
    "|_|  |_|\\___/ \\__\\___/      \\___/  |_/_/   \\_\\",
]

# =====================================================================
#  Animated starfield  (penumbra's signature background effect)
# =====================================================================
_STAR_CHARS = ".+*"
_STAR_STYLES = [
    "bold white",       # bright flash
    "#888888",          # medium
    "#666666",          # dim
    "#444444",          # very dim
    "#333333",          # almost invisible
    "#555588",          # blue tint
    "#558888",          # cyan tint
]


def _star_block(width: int, height: int, density: float = 0.018) -> Text:
    """Generate a block of twinkling stars.

    Called on each render frame — random positions create
    the animated twinkling effect.
    """
    text = Text()
    for row in range(height):
        for _ in range(width):
            r = random.random()
            if r < density * 0.15:
                # Bright star (rare)
                text.append(
                    random.choice("+*"),
                    style=random.choice(_STAR_STYLES[:2]),
                )
            elif r < density:
                # Dim star
                text.append(
                    ".",
                    style=random.choice(_STAR_STYLES[2:]),
                )
            else:
                text.append(" ")
        if row < height - 1:
            text.append("\n")
    return text


def _gradient_logo() -> Text:
    """Render the ASCII logo with a vertical colour gradient."""
    text = Text()
    for i, line in enumerate(_LOGO_LINES):
        colour = _LOGO_GRADIENT[i % len(_LOGO_GRADIENT)]
        text.append(line + "\n", style=f"bold {colour}")
    return text


# =====================================================================
#  Keyboard input  (raw termios — blocking and non-blocking)
# =====================================================================


def _read_key() -> str:
    """Read a single keypress (blocking).  Returns ``'up'``, ``'down'``,
    ``'enter'``, ``'escape'``, ``'quit'``, or the literal char.
    """
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        if ch == "\x1b":
            if select.select([sys.stdin], [], [], 0.05)[0]:
                ch2 = sys.stdin.read(1)
                if ch2 == "[" and select.select([sys.stdin], [], [], 0.05)[0]:
                    ch3 = sys.stdin.read(1)
                    _map = {"A": "up", "B": "down", "C": "right", "D": "left"}
                    if ch3 in _map:
                        return _map[ch3]
                    while select.select([sys.stdin], [], [], 0.02)[0]:
                        sys.stdin.read(1)
            return "escape"
        if ch in ("\r", "\n"):
            return "enter"
        if ch == "q":
            return "quit"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


def _read_key_timeout(timeout: float = 0.12) -> str | None:
    """Non-blocking key read with timeout.

    Returns ``None`` if no key was pressed within *timeout* seconds.
    Used for animated screens that need to refresh continuously.
    """
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ready, _, _ = select.select([sys.stdin], [], [], timeout)
        if not ready:
            return None
        ch = sys.stdin.read(1)
        if ch == "\x1b":
            if select.select([sys.stdin], [], [], 0.05)[0]:
                ch2 = sys.stdin.read(1)
                if ch2 == "[" and select.select([sys.stdin], [], [], 0.05)[0]:
                    ch3 = sys.stdin.read(1)
                    _map = {"A": "up", "B": "down", "C": "right", "D": "left"}
                    if ch3 in _map:
                        return _map[ch3]
                    while select.select([sys.stdin], [], [], 0.02)[0]:
                        sys.stdin.read(1)
            return "escape"
        if ch in ("\r", "\n"):
            return "enter"
        if ch == "q":
            return "quit"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


# =====================================================================
#  Reusable UI components  (penumbra-style)
# =====================================================================


def _card(label: str, value: str, width: int = 34) -> Panel:
    """Small rounded card — like penumbra's DA / PL status cards."""
    if value:
        body = Text.assemble(
            (f"{label}  ", f"bold {ACCENT}"),
            (value, TEXT),
        )
    else:
        body = Text.assemble(
            (f"{label}  ", f"bold {ACCENT}"),
            ("Not configured", MUTED),
        )
    return Panel(
        body,
        box=box.ROUNDED,
        border_style=ACCENT2,
        width=width,
        padding=(0, 1),
    )


def _footer_bar() -> Text:
    """Centred keyboard-hints bar — penumbra-style footer."""
    return Text.assemble(
        ("  [", MUTED),
        ("\u2191\u2193", f"bold {TEXT}"),
        ("] ", MUTED),
        ("Navigate", MUTED),
        ("    ", ""),
        ("[", MUTED),
        ("Enter", f"bold {TEXT}"),
        ("] ", MUTED),
        ("Select", MUTED),
        ("    ", ""),
        ("[", MUTED),
        ("Esc", f"bold {TEXT}"),
        ("] ", MUTED),
        ("Back", MUTED),
    )


def _menu_list(
    items: list[str],
    selected: int,
    *,
    icons: list[str] | None = None,
) -> Text:
    """Selectable list — selected item bold + accent, others text."""
    out = Text()
    for i, label in enumerate(items):
        ico = (icons[i] + "  ") if icons and i < len(icons) else ""
        if i == selected:
            out.append("  >> ", style=f"bold {TEXT}")
            out.append(f"{ico}{label}\n", style=f"bold {ACCENT}")
        else:
            out.append(f"     {ico}{label}\n", style=MUTED)
    return out


def _description_box(text: str) -> Panel:
    """Right-side description panel — rounded border, italic text."""
    body = Text(text, style=f"italic {INFO}")
    return Panel(
        Padding(body, (1, 2)),
        box=box.ROUNDED,
        border_style=MUTED,
    )


# =====================================================================
#  Welcome page  (full-screen with animated starfield)
# =====================================================================

_MAIN_ITEMS = [
    "Check for update",
    "Walk update chain",
    "Download updates",
    "List servers",
    "List carriers",
    "Configuration",
    "Exit",
]
_MAIN_ICONS = [">", ">", "#", "*", "*", "@", "x"]
_MAIN_DESCS = [
    "Perform a single OTA check for a\nGUID + carrier combination.\n\nThe server will respond with the\nnext available update (if any).",
    "Enumerate all incremental updates\nfrom a base GUID to the latest\navailable build, following the\notaTargetSha1 chain.",
    "Walk the full update chain and\ndownload every OTA zip to a local\ndirectory, with MD5 verification.",
    "Show all known CDS server\nendpoints and their current\nstatus.",
    "Display the full list of known\ncarrier codes, their names,\nregions, and open/whitelisted\nstatus.",
    "Edit application and device\nconfiguration files.\n\nSettings include server, region,\nHTTP headers, timeouts, GUID,\ncarrier, and device metadata.",
    "Quit the application.",
]


def _welcome_screen(selected: int) -> RenderableType:
    """Build the full welcome page with animated starfield."""
    w = console.width or 100
    h = console.height or 40

    # -- Gradient logo -------------------------------------------------
    logo = _gradient_logo()

    # -- Subtitle ------------------------------------------------------
    subtitle = Text.assemble(
        ("Motorola OTA Downloader", f"bold {ACCENT}"),
        ("  v", MUTED),
        (__version__, f"bold {ACCENT2}"),
    )

    # -- Menu (left) + Description (right) -----------------------------
    menu_text = _menu_list(_MAIN_ITEMS, selected, icons=_MAIN_ICONS)
    menu_panel = Panel(
        Padding(menu_text, (1, 1)),
        box=box.ROUNDED,
        border_style=ACCENT2,
        width=min(40, w // 2 - 2),
    )

    desc_panel = _description_box(_MAIN_DESCS[selected])

    menu_row = Columns(
        [menu_panel, desc_panel],
        align="center",
        padding=(0, 2),
    )

    # -- Status cards --------------------------------------------------
    cfg_dev = load_device_config()
    card_guid = _card("GUID", cfg_dev.guid)
    card_carrier = _card("Carrier", cfg_dev.carrier)
    cards = Columns([card_guid, card_carrier], align="center", padding=(0, 2))

    # -- Footer --------------------------------------------------------
    footer = Align.center(_footer_bar())

    # -- Animated star rows (twinkle on each frame) --------------------
    stars_top = _star_block(w, 2)
    stars_mid = _star_block(w, 1)
    stars_low = _star_block(w, 1)

    # -- Compose layout ------------------------------------------------
    layout = Layout()
    layout.split_column(
        Layout(name="stars_top", size=2),
        Layout(name="logo", size=7),
        Layout(name="subtitle", size=2),
        Layout(name="stars_mid", size=1),
        Layout(name="menu", ratio=1, minimum_size=14),
        Layout(name="stars_low", size=1),
        Layout(name="cards", size=3),
        Layout(name="footer", size=2),
    )
    layout["stars_top"].update(stars_top)
    layout["logo"].update(Align.center(logo, vertical="bottom"))
    layout["subtitle"].update(Align.center(subtitle, vertical="middle"))
    layout["stars_mid"].update(stars_mid)
    layout["menu"].update(Align.center(menu_row, vertical="middle"))
    layout["stars_low"].update(stars_low)
    layout["cards"].update(Align.center(cards, vertical="middle"))
    layout["footer"].update(footer)

    return layout


# =====================================================================
#  Generic full-screen selectable menu (with subtle stars)
# =====================================================================


def _fullscreen_menu(
    items: list[str],
    descriptions: list[str] | None = None,
    *,
    title: str = "",
    icons: list[str] | None = None,
    allow_escape: bool = True,
) -> int | None:
    """Full-screen menu with optional description pane.
    Returns chosen index or ``None`` on escape.
    """
    selected = 0

    def _render() -> RenderableType:
        w = console.width or 100
        menu_text = _menu_list(items, selected, icons=icons)
        menu_panel = Panel(
            Padding(menu_text, (1, 1)),
            box=box.ROUNDED,
            border_style=ACCENT2,
            title=f"[bold {ACCENT}] {title} [/]" if title else None,
            width=min(44, w // 2 - 2),
        )

        if descriptions:
            desc_panel = _description_box(descriptions[selected])
            content: RenderableType = Columns(
                [menu_panel, desc_panel],
                align="center",
                padding=(0, 2),
            )
        else:
            content = Align.center(menu_panel)

        footer = Align.center(_footer_bar())
        stars = _star_block(w, 1)

        lay = Layout()
        lay.split_column(
            Layout(name="stars", size=1),
            Layout(name="top", size=2),
            Layout(name="content", ratio=1),
            Layout(name="footer", size=2),
        )
        lay["stars"].update(stars)
        if title:
            heading = Align.center(
                Text(f"  {title}  ", style=f"bold {ACCENT}"),
            )
            lay["top"].update(heading)
        else:
            lay["top"].update(Text(""))
        lay["content"].update(Align.center(content, vertical="middle"))
        lay["footer"].update(footer)
        return lay

    with Live(
        _render(),
        console=console,
        screen=True,
        refresh_per_second=8,
    ) as live:
        while True:
            key = _read_key_timeout(0.15)
            if key is None:
                # No key — just refresh for star animation
                live.update(_render())
                continue
            if key == "up":
                selected = (selected - 1) % len(items)
            elif key == "down":
                selected = (selected + 1) % len(items)
            elif key == "enter":
                return selected
            elif key in ("escape", "quit") and allow_escape:
                return None
            live.update(_render())


# =====================================================================
#  Config editing helpers
# =====================================================================


def _edit_field(field_meta: dict, current_value: Any) -> Any:
    """Edit a single config field.  Choice / carrier / bool use the
    full-screen selectable menu; int / text fall back to rich.prompt.
    """
    ftype = field_meta["type"]
    label = field_meta["label"]

    # -- choice --------------------------------------------------------
    if ftype == "choice":
        choices: list[str] = field_meta["choices"]
        labels = [
            f"{c}  <- current" if c == str(current_value) else c
            for c in choices
        ]
        labels.append("Keep current")
        pick = _fullscreen_menu(labels, title=f"Select {label}")
        if pick is None or pick >= len(choices):
            return current_value
        return choices[pick]

    # -- carrier -------------------------------------------------------
    if ftype == "carrier":
        available = open_carriers()
        labels = [
            f"{c.code:<10} {c.name}  ({c.region})"
            + ("  <- current" if c.code == current_value else "")
            for c in available
        ]
        labels.append("Enter custom code")
        labels.append("Keep current")
        pick = _fullscreen_menu(labels, title="Select Carrier")
        if pick is None or pick == len(available) + 1:
            return current_value
        if pick == len(available):
            return Prompt.ask("[bold]Carrier code[/]")
        return available[pick].code

    # -- bool ----------------------------------------------------------
    if ftype == "bool":
        cur = bool(current_value)
        labels = [
            f"True{'  <- current' if cur else ''}",
            f"False{'  <- current' if not cur else ''}",
        ]
        pick = _fullscreen_menu(labels, title=f"Toggle {label}")
        if pick is None:
            return current_value
        return pick == 0

    # -- int -----------------------------------------------------------
    if ftype == "int":
        lo = field_meta.get("min", 0)
        hi = field_meta.get("max", 999999)
        val = Prompt.ask(
            f"[bold]{label}[/] ({lo}-{hi})",
            default=str(current_value),
        )
        try:
            return max(lo, min(hi, int(val)))
        except ValueError:
            console.print("[red]Invalid number -- keeping current value.[/]")
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
    """Interactive full-screen config editor."""
    while True:
        labels, descs = _config_fields_labels(fields, cfg)
        labels += ["Save and go back", "Discard and go back"]
        descs += [
            "Persist all changes to disk.",
            "Discard all changes made in\nthis session.",
        ]
        pick = _fullscreen_menu(labels, descs, title=title)
        if pick is None or pick == len(fields) + 1:
            return
        if pick == len(fields):
            path = save_fn(cfg)
            console.print(f"\n[{SUCCESS}]Saved to {path}[/]")
            return
        field_meta = fields[pick]
        current = getattr(cfg, field_meta["key"])
        new_val = _edit_field(field_meta, current)
        setattr(cfg, field_meta["key"], new_val)
        console.print(
            f"  -> [{SUCCESS}]{field_meta['label']}[/] = [bold]{new_val}[/]",
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
        f"Server, HTTP headers, timeouts,\nregion.\n\nFile: {app_config_path()}",
        f"GUID, carrier, device parameters.\n\nFile: {device_config_path()}",
        "Display both configs side-by-side\nin a table.",
        "Return to the main menu.",
    ]
    icons = ["@", "@", "*", "<"]
    while True:
        pick = _fullscreen_menu(
            items, descs, title="Configuration", icons=icons,
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
    console.print(f"\n[{MUTED}]Press any key to continue...[/]")
    _read_key()


def _show_config_table(
    title: str,
    fields: list[dict[str, Any]],
    config_obj: object,
) -> None:
    """Display a table of current config values."""
    table = Table(
        title=title, show_lines=True,
        box=box.ROUNDED, border_style=ACCENT2,
    )
    table.add_column("Setting", style=f"bold {ACCENT}", min_width=18)
    table.add_column("Value", style=SUCCESS, min_width=20)
    table.add_column("Description", style=MUTED)
    for f in fields:
        val = getattr(config_obj, f["key"], "")
        table.add_row(
            f["label"],
            str(val) if val != "" else f"[{MUTED}](empty)[/]",
            Text(f["description"]),
        )
    console.print(table)


# =====================================================================
#  Operation helpers
# =====================================================================


def _pick_server() -> ServerEnv | None:
    """Full-screen server selector."""
    items_list = list(SERVERS.items())
    labels = [f"{srv.label}  ({srv.host})" for _, srv in items_list]
    descs = [srv.description for _, srv in items_list]
    pick = _fullscreen_menu(labels, descs, title="Select CDS Server")
    if pick is None:
        return None
    return items_list[pick][0]


def _pick_carrier() -> str | None:
    """Full-screen carrier selector."""
    available = open_carriers()
    labels = [f"{c.code:<10} {c.name}  ({c.region})" for c in available]
    labels.append("Custom...")
    descs = [
        f"Code: {c.code}\nName: {c.name}\nRegion: {c.region}\nStatus: {c.status}"
        for c in available
    ]
    descs.append("Enter a custom carrier code\nmanually.")
    pick = _fullscreen_menu(labels, descs, title="Select Carrier")
    if pick is None:
        return None
    if pick == len(available):
        return Prompt.ask("[bold]Enter carrier code[/]")
    return available[pick].code


def _get_guid() -> str:
    return Prompt.ask("[bold]Device GUID[/] (ro.mot.build.guid)")


def _get_guid_and_carrier() -> tuple[str, str, ServerEnv] | None:
    """Ask for server, GUID, and carrier -- or use saved config."""
    cfg_dev = load_device_config()
    cfg_app = load_app_config()

    has_saved = bool(cfg_dev.guid and cfg_dev.carrier)
    if has_saved:
        console.print(
            f"\n[{MUTED}]Saved config: guid=[{ACCENT}]{cfg_dev.guid}[/] "
            f"carrier=[{SUCCESS}]{cfg_dev.carrier}[/] "
            f"server=[{INFO}]{cfg_app.server}[/][/]",
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


# =====================================================================
#  Result display
# =====================================================================


def _show_update(resp) -> None:
    if resp.has_update:
        body = (
            f"[bold {SUCCESS}]Source :[/] {resp.source_version}\n"
            f"[bold {SUCCESS}]Target :[/] {resp.target_version}\n"
            f"[bold {SUCCESS}]Size   :[/] {resp.size_mb} MB\n"
            f"[bold {SUCCESS}]Type   :[/] {resp.update_type}\n"
            f"[bold {SUCCESS}]MD5    :[/] {resp.md5}\n"
            f"[bold {SUCCESS}]GUID   :[/] {resp.target_guid}"
        )
        panel = Panel(body, title="Update Available",
                      border_style=SUCCESS, box=box.ROUNDED)
    else:
        cds = resp.x_cds_content_exists
        body = (
            f"proceed = [bold]false[/]\n"
            f"x-cds-content-exists = [{WARNING}]{cds}[/]\n"
            f"poll after {resp.poll_after_seconds}s"
        )
        panel = Panel(body, title="No Update",
                      border_style=WARNING, box=box.ROUNDED)
    console.print(panel)
    console.print(f"\n[{MUTED}]Press any key to continue...[/]")
    _read_key()


def _show_chain_table(chain) -> None:
    table = Table(
        title=f"OTA Update Chain -- {len(chain)} step(s)",
        border_style=ACCENT2, box=box.ROUNDED,
    )
    table.add_column("#", style="bold", width=4)
    table.add_column("Source", style=ACCENT)
    table.add_column("Target", style=SUCCESS)
    table.add_column("Size", justify="right")
    table.add_column("Type")
    table.add_column("Target GUID", style=MUTED)
    for i, u in enumerate(chain, 1):
        table.add_row(
            str(i), u.source_version, u.target_version,
            f"{u.size_mb} MB", u.update_type, u.target_guid[:15],
        )
    console.print(table)
    total = sum(u.size_mb for u in chain)
    console.print(
        f"\n  [bold]Base :[/] {chain[0].source_version}  ->  "
        f"[bold]Latest:[/] {chain[-1].target_version}  "
        f"({total:.1f} MB total)",
    )
    console.print(f"\n[{MUTED}]Press any key to continue...[/]")
    _read_key()


def _show_servers() -> None:
    table = Table(title="CDS Servers", border_style=ACCENT2, box=box.ROUNDED)
    table.add_column("Name", style="bold")
    table.add_column("Host")
    table.add_column("Description")
    for env, srv in SERVERS.items():
        style = SUCCESS if "production" in env.value else MUTED
        table.add_row(f"[{style}]{env.value}[/]", srv.host, srv.description)
    console.print(table)
    console.print(f"\n[{MUTED}]Press any key to continue...[/]")
    _read_key()


def _show_carriers() -> None:
    table = Table(title="Known Carriers", border_style=ACCENT2, box=box.ROUNDED)
    table.add_column("Code", style=f"bold {ACCENT}")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")
    for c in CARRIERS:
        st = SUCCESS if c.status == "open" else WARNING
        table.add_row(c.code, c.name, c.region, f"[{st}]{c.status}[/]")
    console.print(table)
    console.print(f"\n[{MUTED}]Press any key to continue...[/]")
    _read_key()


# =====================================================================
#  Main TUI loop
# =====================================================================


def run_tui() -> None:
    """Entry point for the interactive terminal UI."""
    if not sys.stdin.isatty():
        console.print(f"[{ERROR}]Interactive TUI requires a terminal (TTY).[/]")
        console.print("Use CLI mode instead: [bold]moto-ota --help[/]")
        return

    fd = sys.stdin.fileno()
    original_attr = termios.tcgetattr(fd)
    try:
        _run_tui_inner()
    except (KeyboardInterrupt, EOFError):
        pass
    finally:
        try:
            termios.tcsetattr(fd, termios.TCSADRAIN, original_attr)
        except termios.error:
            pass
        console.print(f"\n[bold {ACCENT}]Goodbye![/]")


def _run_tui_inner() -> None:
    """Core TUI loop -- full-screen welcome with animated starfield."""
    selected = 0

    while True:
        # Show full-screen welcome page with animated stars
        with Live(
            _welcome_screen(selected),
            console=console,
            screen=True,
            refresh_per_second=8,
        ) as live:
            while True:
                key = _read_key_timeout(0.12)
                if key is None:
                    # No key pressed -- refresh for star animation
                    live.update(_welcome_screen(selected))
                    continue
                if key == "up":
                    selected = (selected - 1) % len(_MAIN_ITEMS)
                elif key == "down":
                    selected = (selected + 1) % len(_MAIN_ITEMS)
                elif key == "enter":
                    break
                elif key in ("escape", "quit"):
                    selected = len(_MAIN_ITEMS) - 1  # point to Exit
                    break
                live.update(_welcome_screen(selected))

        pick = selected

        # -- Check for update ------------------------------------------
        if pick == 0:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            with console.status(f"[bold {ACCENT}]Checking for update...[/]"):
                with OTAClient(env) as client:
                    resp = client.check(guid, carrier)
            _show_update(resp)

        # -- Walk update chain -----------------------------------------
        elif pick == 1:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            with console.status(f"[bold {ACCENT}]Walking update chain...[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if updates:
                _show_chain_table(updates)
            else:
                console.print(f"[{WARNING}]No updates found.[/]")
                console.print(f"\n[{MUTED}]Press any key to continue...[/]")
                _read_key()

        # -- Download updates ------------------------------------------
        elif pick == 2:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            out = Prompt.ask("[bold]Output directory[/]", default="downloads")
            output_dir = Path(out)
            with console.status(f"[bold {ACCENT}]Enumerating chain...[/]"):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if not updates:
                console.print(f"[{WARNING}]No updates to download.[/]")
                console.print(f"\n[{MUTED}]Press any key to continue...[/]")
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
                updates, carrier, output_dir,
                verify=app_cfg.verify_md5,
            )
            console.print(
                f"\n[bold {SUCCESS}]Downloaded {len(saved)} file(s)[/] -> {output_dir}",
            )
            for p in saved:
                console.print(f"  {p.name}")
            console.print(f"\n[{MUTED}]Press any key to continue...[/]")
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
