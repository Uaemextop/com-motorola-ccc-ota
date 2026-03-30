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
full-screen rendering.  Keyboard input uses ``termios`` on Unix and
``msvcrt`` on Windows.  The starfield animates via non-blocking key
reading with timeouts.
"""

from __future__ import annotations

import random
import sys
import time
from pathlib import Path
from typing import Any

_IS_WINDOWS = sys.platform == "win32"

if _IS_WINDOWS:
    import msvcrt
else:
    import select
    import termios
    import tty

from rich import box
from rich.align import Align
from rich.columns import Columns
from rich.console import Console, Group, RenderableType
from rich.layout import Layout
from rich.live import Live
from rich.padding import Padding
from rich.panel import Panel
from rich.table import Table
from rich.text import Text

from moto_ota import __version__
from moto_ota.config.app_config import APP_CONFIG_FIELDS, REGION_SERVERS
from moto_ota.config.carriers import CARRIERS, open_carriers, carriers_by_region, all_scannable_carriers
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
from moto_ota.models.request import build_check_payload
from moto_ota.models.response import CheckResponse

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
#  Keyboard input  (cross-platform: termios on Unix, msvcrt on Windows)
# =====================================================================


def _read_key() -> str:
    """Read a single keypress (blocking).  Returns ``'up'``, ``'down'``,
    ``'enter'``, ``'escape'``, ``'quit'``, or the literal char.
    """
    if _IS_WINDOWS:
        return _read_key_win()
    return _read_key_unix()


def _read_key_timeout(timeout: float = 0.12) -> str | None:
    """Non-blocking key read with timeout.

    Returns ``None`` if no key was pressed within *timeout* seconds.
    Used for animated screens that need to refresh continuously.
    """
    if _IS_WINDOWS:
        return _read_key_timeout_win(timeout)
    return _read_key_timeout_unix(timeout)


def _flush_stdin() -> None:
    """Drain any buffered stdin so stale keypresses don't skip screens."""
    if _IS_WINDOWS:
        import msvcrt as _m
        while _m.kbhit():
            _m.getch()
    else:
        import termios as _t
        _t.tcflush(sys.stdin.fileno(), _t.TCIFLUSH)


# -- Windows implementations ------------------------------------------

def _read_key_win() -> str:
    """Blocking key read using msvcrt (Windows)."""
    ch = msvcrt.getwch()
    if ch in ("\x00", "\xe0"):
        ch2 = msvcrt.getwch()
        _map = {"H": "up", "P": "down", "K": "left", "M": "right"}
        return _map.get(ch2, "")
    if ch == "\x1b":
        return "escape"
    if ch in ("\r", "\n"):
        return "enter"
    if ch == "q":
        return "quit"
    return ch


def _read_key_raw_win() -> str:
    """Blocking raw key read (Windows) — does NOT map 'q' to 'quit'.
    Used for text input fields where all printable chars are needed.
    Returns 'backspace' for backspace key.
    """
    ch = msvcrt.getwch()
    if ch in ("\x00", "\xe0"):
        ch2 = msvcrt.getwch()
        _map = {"H": "up", "P": "down", "K": "left", "M": "right"}
        return _map.get(ch2, "")
    if ch == "\x1b":
        return "escape"
    if ch in ("\r", "\n"):
        return "enter"
    if ch in ("\x08", "\x7f"):
        return "backspace"
    return ch


def _read_key_timeout_win(timeout: float = 0.12) -> str | None:
    """Non-blocking key read with timeout using msvcrt (Windows)."""
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        if msvcrt.kbhit():
            return _read_key_win()
        time.sleep(0.01)
    return None


def _read_key_raw_timeout_win(timeout: float = 0.12) -> str | None:
    """Non-blocking raw key read with timeout (Windows)."""
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        if msvcrt.kbhit():
            return _read_key_raw_win()
        time.sleep(0.01)
    return None


# -- Unix implementations ---------------------------------------------

def _read_key_unix() -> str:
    """Blocking key read using termios (Unix/macOS)."""
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


def _read_key_raw_unix() -> str:
    """Blocking raw key read (Unix) — does NOT map 'q' to 'quit'.
    Returns 'backspace' for backspace/delete key.
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
        if ch in ("\x08", "\x7f"):
            return "backspace"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


def _read_key_timeout_unix(timeout: float = 0.12) -> str | None:
    """Non-blocking key read with timeout using termios (Unix/macOS)."""
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


def _read_key_raw_timeout_unix(timeout: float = 0.12) -> str | None:
    """Non-blocking raw key read with timeout (Unix)."""
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
        if ch in ("\x08", "\x7f"):
            return "backspace"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


def _read_key_raw_timeout(timeout: float = 0.12) -> str | None:
    """Non-blocking raw key read — all printable chars pass through."""
    if _IS_WINDOWS:
        return _read_key_raw_timeout_win(timeout)
    return _read_key_raw_timeout_unix(timeout)


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
#  Full-screen text input  (penumbra-style — stays in alternate buffer)
# =====================================================================


def _fullscreen_input(
    label: str,
    *,
    default: str = "",
    hint: str = "",
) -> str | None:
    """Full-screen single-line text input with animated starfield.

    Returns the entered string, or ``None`` on Escape.
    """
    buf = list(default)

    def _render() -> RenderableType:
        w = console.width or 100
        # Input field display
        cursor_text = Text()
        cursor_text.append("".join(buf), style=f"bold {TEXT}")
        cursor_text.append("_", style=f"blink bold {ACCENT}")

        input_panel = Panel(
            Padding(cursor_text, (0, 1)),
            title=f"[bold {ACCENT}] {label} [/]",
            box=box.ROUNDED,
            border_style=ACCENT2,
            width=min(60, w - 10),
        )

        parts: list[RenderableType] = [input_panel]

        if hint:
            parts.append(Text(f"\n{hint}", style=MUTED, justify="center"))

        footer_text = Text.assemble(
            ("  [", MUTED),
            ("Enter", f"bold {TEXT}"),
            ("] ", MUTED),
            ("Confirm", MUTED),
            ("    ", ""),
            ("[", MUTED),
            ("Esc", f"bold {TEXT}"),
            ("] ", MUTED),
            ("Cancel", MUTED),
        )
        footer = Align.center(footer_text)
        stars = _star_block(w, 1)

        lay = Layout()
        lay.split_column(
            Layout(name="stars", size=1),
            Layout(name="content", ratio=1),
            Layout(name="footer", size=2),
        )
        lay["stars"].update(stars)
        lay["content"].update(Align.center(
            Group(*parts), vertical="middle",
        ))
        lay["footer"].update(footer)
        return lay

    with Live(
        _render(),
        console=console,
        screen=True,
        refresh_per_second=8,
    ) as live:
        while True:
            key = _read_key_raw_timeout(0.15)
            if key is None:
                live.update(_render())
                continue
            if key == "enter":
                return "".join(buf)
            elif key == "escape":
                return None
            elif key == "backspace":
                if buf:
                    buf.pop()
            elif len(key) == 1 and key.isprintable():
                buf.append(key)
            live.update(_render())


def _fullscreen_confirm(
    message: str,
    *,
    default: bool = True,
) -> bool:
    """Full-screen yes/no confirmation with animated starfield."""
    selected = 0 if default else 1
    options = ["Yes", "No"]

    def _render() -> RenderableType:
        w = console.width or 100
        msg = Text(message, style=f"bold {TEXT}", justify="center")

        choice_text = Text()
        for i, opt in enumerate(options):
            if i == selected:
                choice_text.append(f"  >> {opt}  ", style=f"bold {ACCENT}")
            else:
                choice_text.append(f"     {opt}  ", style=MUTED)

        panel = Panel(
            Padding(Group(
                Align.center(msg),
                Text(""),
                Align.center(choice_text),
            ), (1, 2)),
            box=box.ROUNDED,
            border_style=ACCENT2,
            width=min(50, w - 10),
        )

        footer = Align.center(_footer_bar())
        stars = _star_block(w, 1)

        lay = Layout()
        lay.split_column(
            Layout(name="stars", size=1),
            Layout(name="content", ratio=1),
            Layout(name="footer", size=2),
        )
        lay["stars"].update(stars)
        lay["content"].update(Align.center(panel, vertical="middle"))
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
                live.update(_render())
                continue
            if key in ("left", "right", "up", "down"):
                selected = 1 - selected
            elif key == "enter":
                return selected == 0
            elif key in ("escape", "quit"):
                return not default
            live.update(_render())


# =====================================================================
#  Full-screen display  (show any renderable in penumbra style)
# =====================================================================


def _fullscreen_display(
    content: RenderableType,
    *,
    title: str = "",
    footer_hint: str = "Press any key to continue",
) -> None:
    """Show *content* in a full-screen penumbra display with starfield.

    Blocks until the user presses any key, then returns.
    """
    # Drain any buffered keypresses so they don't immediately dismiss
    # this screen (e.g. stale input from a long-running scan).
    try:
        _flush_stdin()
    except Exception:
        pass

    def _render() -> RenderableType:
        w = console.width or 100
        footer_text = Text.assemble(
            ("  [", MUTED),
            ("any key", f"bold {TEXT}"),
            ("] ", MUTED),
            (footer_hint, MUTED),
        )
        footer = Align.center(footer_text)
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
                live.update(_render())
                continue
            # Any key press exits
            break


def _fullscreen_spinner(
    message: str,
):
    """Return a context manager showing a full-screen spinner.

    Use as ``with _fullscreen_spinner("Checking..."):``
    The spinner animates via the starfield redraw.
    """

    def _render() -> RenderableType:
        w = console.width or 100
        # Spinner character cycles
        chars = "⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
        idx = int(time.monotonic() * 10) % len(chars)
        spinner = Text.assemble(
            (f"  {chars[idx]}  ", f"bold {ACCENT}"),
            (message, f"bold {TEXT}"),
        )
        panel = Panel(
            Padding(Align.center(spinner), (1, 2)),
            box=box.ROUNDED,
            border_style=ACCENT2,
            width=min(50, w - 10),
        )
        stars = _star_block(w, 1)

        lay = Layout()
        lay.split_column(
            Layout(name="stars", size=1),
            Layout(name="content", ratio=1),
            Layout(name="footer", size=1),
        )
        lay["stars"].update(stars)
        lay["content"].update(Align.center(panel, vertical="middle"))
        lay["footer"].update(_star_block(w, 1))
        return lay

    return Live(
        _render(),
        console=console,
        screen=True,
        refresh_per_second=8,
    )


# =====================================================================
#  Welcome page  (full-screen with animated starfield)
# =====================================================================

_MAIN_ITEMS = [
    "Check for update",
    "Walk update chain",
    "Scan carriers",
    "Download updates",
    "List servers",
    "List carriers",
    "Configuration",
    "Exit",
]
_MAIN_ICONS = [">", ">", "?", "#", "*", "*", "@", "x"]
_MAIN_DESCS = [
    "Perform a single OTA check for a\nGUID + carrier combination.\n\nThe server will respond with the\nnext available update (if any).",
    "Enumerate all incremental updates\nfrom a base GUID to the latest\navailable build, following the\notaTargetSha1 chain.",
    "Test a GUID against all known\nopen carriers to find which ones\nhave updates available.\n\nShows file name and metadata\npreview for each match.",
    "Walk the full update chain and\ndownload every OTA zip to a local\ndirectory, with MD5 verification.",
    "Show all known CDS server\nendpoints grouped by region\n(Global / China).",
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
            result = _fullscreen_input("Carrier code")
            return result if result else current_value
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
        val = _fullscreen_input(
            f"{label} ({lo}-{hi})",
            default=str(current_value),
        )
        if val is None:
            return current_value
        try:
            return max(lo, min(hi, int(val)))
        except ValueError:
            return current_value

    # -- text ----------------------------------------------------------
    result = _fullscreen_input(label, default=str(current_value))
    return result if result is not None else current_value


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
            msg = Panel(
                f"[bold {SUCCESS}]Configuration saved![/]\n\n"
                f"[{MUTED}]{path}[/]",
                box=box.ROUNDED,
                border_style=SUCCESS,
            )
            _fullscreen_display(msg, title="Saved")
            return
        field_meta = fields[pick]
        current = getattr(cfg, field_meta["key"])
        new_val = _edit_field(field_meta, current)
        setattr(cfg, field_meta["key"], new_val)


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
    """Show both config tables in full-screen display."""
    cfg_app = load_app_config()
    cfg_dev = load_device_config()
    table_app = _build_config_table("App Configuration", APP_CONFIG_FIELDS, cfg_app)
    table_dev = _build_config_table("Device Configuration", DEVICE_CONFIG_FIELDS, cfg_dev)
    content = Group(table_app, Text(""), table_dev)
    _fullscreen_display(content, title="Current Configuration")


def _build_config_table(
    title: str,
    fields: list[dict[str, Any]],
    config_obj: object,
) -> Table:
    """Build a rich Table of current config values (without printing)."""
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
    return table


# =====================================================================
#  Operation helpers
# =====================================================================


def _pick_server() -> ServerEnv | None:
    """Full-screen server selector — filtered by configured region."""
    cfg_app = load_app_config()
    region = cfg_app.region
    allowed = REGION_SERVERS.get(region, [])
    items_list = [
        (env, srv) for env, srv in SERVERS.items()
        if env.value in allowed
    ]
    if not items_list:
        items_list = list(SERVERS.items())
    labels = [f"{srv.label}  ({srv.host})" for _, srv in items_list]
    descs = [
        f"{srv.description}\n\nRegion: {region}"
        for _, srv in items_list
    ]
    pick = _fullscreen_menu(labels, descs, title=f"Select CDS Server  ({region})")
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
        result = _fullscreen_input("Carrier code")
        return result if result else None
    return available[pick].code


def _get_guid() -> str | None:
    return _fullscreen_input(
        "Device GUID",
        hint="ro.mot.build.guid  (16-char hex string)",
    )


def _get_guid_and_carrier() -> tuple[str, str, ServerEnv] | None:
    """Return (guid, carrier, server_env) -- uses saved config directly
    if both guid and carrier are set, without asking."""
    cfg_dev = load_device_config()
    cfg_app = load_app_config()

    # If both critical routing fields are configured, use them directly
    if cfg_dev.guid and cfg_dev.carrier:
        return cfg_dev.guid, cfg_dev.carrier, cfg_app.server_env

    # Otherwise, prompt for missing values
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
        fname = f"{resp.target_version}_{resp.update_type}.zip"
        body = (
            f"[bold {SUCCESS}]Source  :[/] {resp.source_version}\n"
            f"[bold {SUCCESS}]Target  :[/] {resp.target_version}\n"
            f"[bold {SUCCESS}]Size    :[/] {resp.size_mb} MB\n"
            f"[bold {SUCCESS}]Type    :[/] {resp.update_type}\n"
            f"[bold {SUCCESS}]MD5     :[/] {resp.md5}\n"
            f"[bold {SUCCESS}]GUID    :[/] {resp.target_guid}\n"
            f"[bold {MUTED}]File    :[/] [{MUTED}]{fname}[/]"
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
    _fullscreen_display(panel, title="Check Result")


def _show_chain_table(chain) -> None:
    table = Table(
        title=f"OTA Update Chain — {len(chain)} step(s)",
        border_style=ACCENT2, box=box.ROUNDED,
        title_style=f"bold {ACCENT}",
    )
    table.add_column("Install\nOrder", style="bold", width=7, justify="center")
    table.add_column("Source Version", style=ACCENT)
    table.add_column("Target Version", style=SUCCESS)
    table.add_column("Size", justify="right")
    table.add_column("Type")
    table.add_column("Filename Preview", style=MUTED)
    for i, u in enumerate(chain, 1):
        fname = f"step{i:02d}_{u.target_version}_{u.update_type}.zip"
        table.add_row(
            f"#{i}",
            u.source_version or "—",
            u.target_version or "—",
            f"{u.size_mb:.1f} MB",
            u.update_type or "—",
            fname,
        )
    total = sum(u.size_mb for u in chain)

    # Summary block
    summary_parts = [
        Text.assemble(
            ("\n  Install order: ", f"bold {TEXT}"),
            (f"#{1}", f"bold {ACCENT}"),
            (" → ", MUTED),
            (f"#{len(chain)}", f"bold {SUCCESS}"),
            ("  (sequential, each step requires the previous)", MUTED),
        ),
        Text.assemble(
            ("  Base firmware : ", f"bold {TEXT}"),
            (chain[0].source_version, ACCENT),
        ),
        Text.assemble(
            ("  Final firmware: ", f"bold {TEXT}"),
            (chain[-1].target_version, SUCCESS),
        ),
        Text.assemble(
            ("  Total size    : ", f"bold {TEXT}"),
            (f"{total:.1f} MB across {len(chain)} file(s)", MUTED),
        ),
    ]
    content = Group(table, *summary_parts)
    _fullscreen_display(content, title="Update Chain")


def _show_servers() -> None:
    cfg_app = load_app_config()
    table = Table(title="CDS Servers", border_style=ACCENT2, box=box.ROUNDED)
    table.add_column("Name", style="bold")
    table.add_column("Host")
    table.add_column("Region")
    table.add_column("Description")
    for env, srv in SERVERS.items():
        style = SUCCESS if "production" in env.value else MUTED
        # Determine which region this server belongs to
        srv_region = "Global"
        for region, envs in REGION_SERVERS.items():
            if env.value in envs:
                srv_region = region
                break
        # Highlight current server
        current = " ←" if env.value == cfg_app.server else ""
        table.add_row(
            f"[{style}]{env.value}{current}[/]",
            srv.host,
            srv_region,
            srv.description,
        )
    _fullscreen_display(table, title="CDS Servers")


def _show_carriers() -> None:
    table = Table(title="Known Carriers", border_style=ACCENT2, box=box.ROUNDED)
    table.add_column("Code", style=f"bold {ACCENT}")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")
    for c in CARRIERS:
        st = SUCCESS if c.status == "open" else WARNING
        table.add_row(c.code, c.name, c.region, f"[{st}]{c.status}[/]")
    _fullscreen_display(table, title="Known Carriers")


def _scan_carriers(guid: str, env: ServerEnv) -> None:
    """Test a GUID against **all** carriers with auto-detection.

    For each carrier the server is queried.  The result is classified
    automatically — no pre-defined status is used:

      · **open**        — ``proceed=true`` (update returned directly)
      · **whitelisted** — ``proceed=false`` but ``x-cds-content-exists=true``
                          (content exists but needs serial whitelisting)
      · *no content*    — ``proceed=false`` and no content flag (skipped)

    Uses parallel requests (20 threads) for fast scanning.
    The scan shows a live progress bar inside the full-screen TUI.
    """
    import concurrent.futures

    available = all_scannable_carriers()
    total = len(available)
    srv = SERVERS[env]

    # (code, name, region, detected_status, target_ver, size, fname)
    results_open: list[tuple] = []
    results_wl: list[tuple] = []
    scanned = 0

    def _progress_render() -> RenderableType:
        w = console.width or 100
        pct = int(scanned / total * 100) if total else 0
        bar_done = int(pct * 0.3)
        bar_todo = 30 - bar_done
        bar_str = f"[{SUCCESS}]{'█' * bar_done}[/][{MUTED}]{'░' * bar_todo}[/]"
        body = (
            f"[bold {ACCENT}]Scanning carriers…[/]\n\n"
            f"  {bar_str}  {pct}%\n\n"
            f"  [{TEXT}]{scanned}[/][{MUTED}] / {total} carriers tested[/]\n"
            f"  [{SUCCESS}]{len(results_open)} open[/]  "
            f"[{WARNING}]{len(results_wl)} whitelisted[/]"
        )
        panel = Panel(
            Padding(body, (1, 2)),
            box=box.ROUNDED, border_style=ACCENT2,
            width=min(55, w - 10),
        )
        stars = _star_block(w, 1)
        lay = Layout()
        lay.split_column(
            Layout(name="stars", size=1),
            Layout(name="content", ratio=1),
            Layout(name="bottom_stars", size=1),
        )
        lay["stars"].update(stars)
        lay["content"].update(Align.center(panel, vertical="middle"))
        lay["bottom_stars"].update(_star_block(w, 1))
        return lay

    def _check_one(carrier):
        """Check a single carrier (runs in thread pool)."""
        import requests as _req

        url = srv.check_url(guid, "ota")
        body = build_check_payload(guid, carrier.code)
        try:
            resp = _req.post(
                url, json=body, timeout=10,
                headers={"User-Agent": "com.motorola.ccc.ota"},
            )
            resp.raise_for_status()
            cr = CheckResponse.from_dict(resp.json(), headers=dict(resp.headers))
            return (carrier, cr, None)
        except Exception as exc:
            return (carrier, None, exc)

    with Live(
        _progress_render(),
        console=console,
        screen=True,
        refresh_per_second=4,
    ) as live:
        with concurrent.futures.ThreadPoolExecutor(max_workers=20) as pool:
            futures = {pool.submit(_check_one, c): c for c in available}
            for future in concurrent.futures.as_completed(futures):
                carrier, resp, exc = future.result()
                if resp is not None and exc is None:
                    if resp.has_update:
                        fname = f"{resp.target_version}_{carrier.code}.zip"
                        results_open.append((
                            carrier.code, carrier.name, carrier.region,
                            "open",
                            resp.target_version or "—",
                            f"{resp.size_mb:.1f} MB",
                            fname,
                        ))
                    elif resp.x_cds_content_exists:
                        # Whitelisted — content exists but proceed=false;
                        # server returns minimal content (updateType only,
                        # no displayVersion / size / URLs).
                        tv = resp.target_version
                        ver = tv if tv and tv != "?" else "—"
                        sz = f"{resp.size_mb:.1f} MB" if resp.size_bytes else "—"
                        results_wl.append((
                            carrier.code, carrier.name, carrier.region,
                            "whitelisted",
                            ver, sz, "—",
                        ))
                scanned += 1
                live.update(_progress_render())

    found = len(results_open) + len(results_wl)

    if found == 0:
        _fullscreen_display(
            Panel(
                f"[{WARNING}]No carriers returned updates for GUID {guid}.[/]\n\n"
                f"[{MUTED}]Tested {total} carriers.\n"
                f"The OTA package may have expired or the GUID is invalid.[/]",
                box=box.ROUNDED, border_style=WARNING,
            ),
            title="Carrier Scan Results",
        )
        return

    # --- Build results table ------------------------------------------
    table = Table(
        title=f"Carrier Scan — {found} carrier(s) for GUID {guid[:15]}",
        border_style=ACCENT2, box=box.ROUNDED,
        title_style=f"bold {ACCENT}",
    )
    table.add_column("Carrier", style=f"bold {ACCENT}")
    table.add_column("Name")
    table.add_column("Region")
    table.add_column("Status")
    table.add_column("OTA Version", style=SUCCESS)
    table.add_column("Size", justify="right")
    table.add_column("Filename Preview", style=MUTED)

    for row in results_open:
        code, name, region, status, target, size, fname = row
        table.add_row(
            code, name, region,
            f"[{SUCCESS}]{status}[/]",
            target, size, fname,
        )
    for row in results_wl:
        code, name, region, status, target, size, fname = row
        table.add_row(
            code, name, region,
            f"[{WARNING}]{status}[/]",
            target, size, fname,
        )

    # Sort results for clean display
    results_open.sort(key=lambda r: (r[2], r[0]))  # region, code
    results_wl.sort(key=lambda r: (r[2], r[0]))

    summary = Text.assemble(
        (f"\n  Scanned {total} carriers: ", MUTED),
        (f"{len(results_open)} open", f"bold {SUCCESS}"),
        (", ", MUTED),
        (f"{len(results_wl)} whitelisted", f"bold {WARNING}"),
        (f", {total - found} no content", MUTED),
    )

    # Version comparison line
    versions = {row[4] for row in results_open if row[4] and row[4] != "—"}
    if len(versions) > 1:
        ver_line = Text.assemble(
            ("\n  ⚠ Multiple OTA versions: ", f"bold {WARNING}"),
            (", ".join(sorted(versions)), f"{TEXT}"),
        )
    elif len(versions) == 1:
        ver_line = Text.assemble(
            ("\n  All open carriers: ", MUTED),
            (versions.pop(), f"bold {SUCCESS}"),
        )
    else:
        ver_line = Text("")

    content = Group(table, summary, ver_line)
    _fullscreen_display(content, title="Carrier Scan Results")


# =====================================================================
#  Main TUI loop
# =====================================================================


def run_tui() -> None:
    """Entry point for the interactive terminal UI."""
    if not sys.stdin.isatty():
        console.print(f"[{ERROR}]Interactive TUI requires a terminal (TTY).[/]")
        console.print("Use CLI mode instead: [bold]moto-ota --help[/]")
        return

    if _IS_WINDOWS:
        # Windows: msvcrt handles terminal state automatically
        try:
            _run_tui_inner()
        except (KeyboardInterrupt, EOFError):
            pass
        finally:
            console.print(f"\n[bold {ACCENT}]Goodbye![/]")
    else:
        # Unix: save/restore terminal attributes for safety
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
            with _fullscreen_spinner("Checking for update..."):
                with OTAClient(env) as client:
                    resp = client.check(guid, carrier)
            _show_update(resp)

        # -- Walk update chain -----------------------------------------
        elif pick == 1:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            with _fullscreen_spinner("Walking update chain..."):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if updates:
                _show_chain_table(updates)
            else:
                _fullscreen_display(
                    Panel(
                        f"[{WARNING}]No updates found for this GUID.[/]",
                        box=box.ROUNDED, border_style=WARNING,
                    ),
                    title="No Updates",
                )

        # -- Scan carriers ---------------------------------------------
        elif pick == 2:
            cfg_app = load_app_config()
            cfg_dev = load_device_config()
            if cfg_dev.guid:
                guid = cfg_dev.guid
                env = cfg_app.server_env
            else:
                env = _pick_server()
                if env is None:
                    continue
                guid = _get_guid()
                if not guid:
                    continue
            n = len(all_scannable_carriers())
            if not _fullscreen_confirm(
                f"Scan {n} carriers against GUID {guid}?\n\n"
                f"This will send {n} HTTP requests and\n"
                f"may take several minutes.",
                default=True,
            ):
                continue
            _scan_carriers(guid, env)

        # -- Download updates ------------------------------------------
        elif pick == 3:
            result = _get_guid_and_carrier()
            if result is None:
                continue
            guid, carrier, env = result
            out = _fullscreen_input("Output directory", default="downloads")
            if out is None:
                continue
            output_dir = Path(out)
            with _fullscreen_spinner("Enumerating chain..."):
                with OTAClient(env) as client:
                    updates = client.walk_chain(guid, carrier)
            if not updates:
                _fullscreen_display(
                    Panel(
                        f"[{WARNING}]No updates to download.[/]",
                        box=box.ROUNDED, border_style=WARNING,
                    ),
                    title="No Updates",
                )
                continue
            total = sum(u.size_mb for u in updates)
            if not _fullscreen_confirm(
                f"Download {len(updates)} file(s), {total:.1f} MB total?",
                default=True,
            ):
                continue
            app_cfg = load_app_config()
            saved = download_chain(
                updates, carrier, output_dir,
                verify=app_cfg.verify_md5,
                console=console,
            )
            file_list = "\n".join(f"  {p.name}" for p in saved)
            result_body = (
                f"[bold {SUCCESS}]Downloaded {len(saved)} file(s)[/]\n"
                f"[{MUTED}]-> {output_dir}[/]\n\n"
                f"{file_list}"
            )
            _fullscreen_display(
                Panel(result_body, box=box.ROUNDED, border_style=SUCCESS),
                title="Download Complete",
            )

        # -- List servers ----------------------------------------------
        elif pick == 4:
            _show_servers()

        # -- List carriers ---------------------------------------------
        elif pick == 5:
            _show_carriers()

        # -- Configuration ---------------------------------------------
        elif pick == 6:
            _config_menu()

        # -- Exit ------------------------------------------------------
        elif pick == 7:
            break
