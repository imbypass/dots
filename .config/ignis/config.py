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
from ignis.services.upower import UPowerService

from modules.apps import Apps
from modules.battery import Battery
from modules.borders import Borders
from modules.launcher import Launcher
from modules.network import Network
from modules.notifications import Notifications
from modules.workspaces import Workspaces
from modules.osd import OSD

css_manager = CssManager.get_default()
audio = AudioService.get_default()
system_tray = SystemTrayService.get_default()
hyprland = HyprlandService.get_default()
mpris = MprisService.get_default()
network = NetworkService.get_default()
window_manager = WindowManager.get_default()
upower = UPowerService.get_default()

css_manager.apply_css(
    CssInfoPath(
        name="main",
        compiler_function=lambda path: utils.sass_compile(path=path),
        path=os.path.join(utils.get_current_dir(), "./scss/style.scss"),
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
            pixel_size=20,
            css_classes=["harmony-icon"],
        ),
        on_click=lambda x: create_exec_task("walker -n"),
        on_right_click=lambda x: create_exec_task("~/.local/share/harmony/bin/harmonyctl expose"),
    )

def power_icon() -> widgets.Box:
    return widgets.EventBox(
        css_classes=["indicators", "indicators-power"],
        on_click=lambda x: create_exec_task("walker -H -m mainmenu"),
        tooltip_text="Power Menu",
        child=[
            widgets.Label(
                css_classes=["indicators-power"],
                label='',
                use_markup=False,
                justify='left',
                wrap=True,
                wrap_mode='word',
                ellipsize='end',
                max_width_chars=1
            )
        ]
    )

def clock() -> widgets.EventBox:
    clock_box = widgets.EventBox(
        css_classes=["clock"],
        child=[
            widgets.Label(
                css_classes=["clock-hours"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%I")
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["clock-minutes"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%M")
                ).bind("output"),
            )
       ],
    )
    clock_box.set_orientation(1)
    return clock_box

def speaker_volume() -> widgets.Box:
    return widgets.EventBox(
        css_classes=["indicators", "indicators-speaker"],
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_click=lambda x: create_exec_task("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol -t 3"),
        tooltip_text=audio.speaker.bind("volume", transform=lambda value: "Volume: " + str(value) + "%"),
        child=[
            widgets.Icon(
                image=audio.speaker.bind("icon_name"),
                pixel_size=14,
            )
        ]
    )

def microphone_volume() -> widgets.Box:
    return widgets.EventBox(
        css_classes=["indicators", "indicators-microphone"],
        on_scroll_up=lambda x: scroll_volume("up"),
        on_scroll_down=lambda x: scroll_volume("down"),
        on_click=lambda x: create_exec_task("pamixer --default-source -t"),
        on_right_click=lambda x: create_exec_task("GTK_THEME=FOURdotZERO pavucontrol -t 4"),
        tooltip_text=audio.microphone.bind("volume", transform=lambda value: "Mic Gain: " + str(value) + "%"),
        child=[
            widgets.Icon(
                image=audio.microphone.bind("icon_name"),
                pixel_size=14,
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
                widgets.Icon(image=item.bind("icon"), pixel_size=14),
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


def left(monitor_name: str) -> widgets.Box:
    left = widgets.Box(
        child=[
            harmony_icon(),
            Workspaces(monitor_name),
        ],
        spacing=10
    )
    left.set_orientation(1)
    return left

def center(monitor_name: str) -> widgets.Box:
    center_box = widgets.Box(
        child=[
            # Apps(),
        ],
        spacing=10,
    )
    center_box.set_orientation(1)
    return center_box

def right(monitor_name: str) -> widgets.Box:
    right = widgets.Box(
        child=[
            tray(),
            speaker_volume(),
            microphone_volume(),
            Network(),
            Battery(),
            clock(),
            power_icon(),
        ],
        spacing=10,
    )
    right.set_orientation(1)
    return right

def bar(monitor_id: int = 0) -> widgets.Window:
    monitor_name = utils.get_monitor(monitor_id).get_connector()  # type: ignore
    widget_box = widgets.CenterBox(
        css_classes=["bar"],
        start_widget=left(monitor_name),  # type: ignore
        center_widget=center(monitor_name),
        end_widget=right(monitor_name),
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


for monitor in range(utils.get_n_monitors()):
    Notifications(monitor)

OSD()
Launcher()
# Borders()
