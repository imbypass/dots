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
from modules.borders.borders import Borders
from modules.launcher import Launcher
from modules.network import NetworkIndicator

css_manager = CssManager.get_default()
audio = AudioService.get_default()
system_tray = SystemTrayService.get_default()
hyprland = HyprlandService.get_default()
mpris = MprisService.get_default()
network = NetworkService.get_default()
window_manager = WindowManager.get_default()

css_manager.apply_css(
    CssInfoPath(
        name="main",
        compiler_function=lambda path: utils.sass_compile(path=path),
        path=os.path.join(utils.get_current_dir(), "style.scss"),
    )
)

def create_exec_task(cmd: str) -> None:
    asyncio.create_task(utils.exec_sh_async(cmd))

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
            pixel_size=24,
            css_classes=["harmony-icon"],
        ),
        on_click=lambda x: window_manager.toggle_window("ignis_LAUNCHER"),
        on_right_click=lambda x: create_exec_task("~/.local/bin/harmonyctl expose"),
    )

def clock() -> widgets.EventBox:
    clock_box = widgets.EventBox(
        child=[
            widgets.Label(
                css_classes=["clock"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%I\n%M")
                ).bind("output"),
            )
       ],
       on_right_click=lambda x: create_exec_task("walker -m mainmenu"),
    )
    clock_box.set_orientation(1)
    return clock_box


def speaker_volume() -> widgets.Box:
    return widgets.EventBox(
        css_classes=["indicators"],
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_click=lambda x: create_exec_task("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol"),
        tooltip_text=audio.speaker.bind("volume", transform=lambda value: str(value)),
        child=[
            widgets.Icon(
                image=audio.speaker.bind("icon_name"),
                pixel_size=12,
            )
        ]
    )

def microphone_volume() -> widgets.Box:
    return widgets.EventBox(
        css_classes=["indicators"],
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_click=lambda x: create_exec_task("pamixer --default-source -t"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol -t 4"),
        tooltip_text=audio.microphone.bind("volume", transform=lambda value: str(value)),
        child=[
            widgets.Icon(
                image=audio.microphone.bind("icon_name"),
                pixel_size=12,
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
                widgets.Icon(image=item.bind("icon"), pixel_size=12),
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
    tray_box = widgets.Box(
        setup=lambda self: system_tray.connect(
            "added", lambda x, item: self.append(tray_item(item))
        ),
        spacing=12,
        css_classes=["system-tray"]
    )
    tray_box.set_orientation(1)
    return tray_box


def left() -> widgets.Box:
    left = widgets.Box(
        child=[
            harmony_icon(),
            Apps(),
        ],
        spacing=10
    )
    left.set_orientation(1)
    return left

def center() -> widgets.Box:
    center_box = widgets.Box(
        child=[
        ],
        spacing=10,
    )
    center_box.set_orientation(1)
    return center_box

def right() -> widgets.Box:
    right = widgets.Box(
        child=[
            tray(),
            speaker_volume(),
            microphone_volume(),
            NetworkIndicator(),
            Battery(),
            clock(),
        ],
        spacing=10,
    )
    right.set_orientation(1)
    return right

def bar(monitor_id: int = 0) -> widgets.Window:
    widget_box = widgets.CenterBox(
        css_classes=["bar"],
        start_widget=left(),  # type: ignore
        center_widget=center(),
        end_widget=right(),
    )
    widget_box.set_orientation(1)
    return widgets.Window(
        namespace=f"ignis_bar_{monitor_id}",
        monitor=monitor_id,
        anchor=["top", "left", "bottom"],
        exclusivity="exclusive",
        child=widget_box,

        margin_top=0,
        margin_right=0
    )



# this will display bar on all monitors
for i in range(utils.get_n_monitors()):
    bar(i)

Launcher()
Borders()
