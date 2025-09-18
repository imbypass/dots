import gi,os, datetime, asyncio

gi.require_version("GioUnix", "2.0")
gi.require_version("Gtk", "4.0")


from ignis import widgets
from ignis import utils

from ignis.app import IgnisApp
from ignis.css_manager import CssManager, CssInfoPath
from ignis.menu_model import IgnisMenuModel, IgnisMenuItem, IgnisMenuSeparator
from ignis.services.audio import AudioService
from ignis.services.system_tray import SystemTrayService, SystemTrayItem
from ignis.services.hyprland import HyprlandService, HyprlandWorkspace
from ignis.services.mpris import MprisService, MprisPlayer
from ignis.services.network import NetworkService
from ignis.window_manager import WindowManager

from modules.apps import Apps
from modules.battery import Battery
from modules.border import Border
from modules.launcher import Launcher
from modules.network import NetworkIndicator

from styling.style_manager import StyleManager

css_manager = CssManager.get_default()
audio = AudioService.get_default()
system_tray = SystemTrayService.get_default()
hyprland = HyprlandService.get_default()
mpris = MprisService.get_default()
network = NetworkService.get_default()
window_manager = WindowManager.get_default()

StyleManager.get_default().initialize("/home/bypass/.config/ignis/style.json")

css_manager.apply_css(
    CssInfoPath(
        name="main",
        compiler_function=lambda path: utils.sass_compile(path=path),
        path=os.path.join(utils.get_current_dir(), "style.scss"),
    )
)

def create_exec_task(cmd: str) -> None:
    asyncio.create_task(utils.exec_sh_async(cmd))

def logout() -> None:
    if hyprland.is_available:
        create_exec_task("hyprctl dispatch exit 0")
    else:
        pass

def scroll_volume(direction: str) -> None:
    if direction == "up":
        create_exec_task("pamixer -d 1")
    elif direction == "down":
        create_exec_task("pamixer -i 1")
    else:
        raise ValueError("Invalid direction")

def harmony_icon() -> widgets.Button:
    return widgets.Button(
        child=widgets.Icon(
            image="/home/bypass/.local/share/harmony/logo.svg",
            pixel_size=28,
            css_classes=["harmony-icon"],
        ),
        on_click=lambda x: window_manager.toggle_window("ignis_LAUNCHER"),
    )

def clock() -> widgets.EventBox:
    return widgets.EventBox(
        child=[
            widgets.Label(
                css_classes=["clock"],
                justify="right",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%I:%M %p\n%m/%d/%Y")
                ).bind("output"),
            )
       ],
       on_right_click=lambda x: create_exec_task("walker -m mainmenu"),
    )


def speaker_volume() -> widgets.Box:
    return widgets.EventBox(
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol"),
        tooltip_text=audio.speaker.bind("volume", transform=lambda value: str(value)),
        child=[
            widgets.Icon(
                image=audio.speaker.bind("icon_name"),
                pixel_size=12,
                style="margin-right: 5px;"
            )
        ]
    )

def microphone_volume() -> widgets.Box:
    return widgets.EventBox(
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol -t 4"),
        tooltip_text=audio.microphone.bind("volume", transform=lambda value: str(value)),
        child=[
            widgets.Icon(
                image=audio.microphone.bind("icon_name"),
                pixel_size=12,
                style="margin-right: 0;"
            )
        ]
    )




def tray_item(item: SystemTrayItem) -> widgets.Button:
    if item.menu:
        menu = item.menu.copy()
    else:
        menu = None

    return widgets.Button(
        child=widgets.Box(
            child=[
                widgets.Icon(image=item.bind("icon"), pixel_size=11),
                menu,
            ]
        ),
        setup=lambda self: item.connect("removed", lambda x: self.unparent()),
        tooltip_text=item.bind("tooltip"),
        on_click=lambda x: menu.popup() if menu else None,
        on_right_click=lambda x: menu.popup() if menu else None,
        css_classes=["tray-item"],
    )

def tray():
    return widgets.Box(
        setup=lambda self: system_tray.connect(
            "added", lambda x, item: self.append(tray_item(item))
        ),
        spacing=10,
    )






def left() -> widgets.Box:
    return widgets.Box(
        child=[
            harmony_icon(),
            Apps(),
        ],
        spacing=10
    )


def center() -> widgets.Box:
    return widgets.Box(
        child=[
        ],
        spacing=10,
    )


def right() -> widgets.Box:
    return widgets.Box(
        child=[
            tray(),
            microphone_volume(),
            speaker_volume(),
            NetworkIndicator(),
            Battery(),
            clock(),
        ],
        spacing=10,
    )



def bar(monitor_id: int = 0) -> widgets.Window:
    return widgets.Window(
        namespace=f"ignis_bar_{monitor_id}",
        monitor=monitor_id,
        anchor=["bottom", "left", "right"],
        exclusivity="exclusive",
        child=widgets.CenterBox(
            css_classes=["bar"],
            start_widget=left(),  # type: ignore
            center_widget=center(),
            end_widget=right(),
        ),
        margin_top=0,
        margin_right=0
    )


# this will display bar on all monitors
for i in range(utils.get_n_monitors()):
    bar(i)

Launcher()
Border()
