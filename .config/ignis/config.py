import gi,os, datetime

gi.require_version("GioUnix", "2.0")
gi.require_version("Gtk", "4.0")

from ignis import widgets
from ignis import utils
from ignis.css_manager import CssManager, CssInfoPath
css_manager = CssManager.get_default()
css_manager.apply_css(
    CssInfoPath(
        name="main",
        compiler_function=lambda path: utils.sass_compile(path=path),
        path=os.path.join(utils.get_current_dir(), "./style.scss"),
    )
)

def clock_widget() -> widgets.EventBox:
    clock_box = widgets.EventBox(
        css_classes=["clock"],
        child=[
            widgets.Label(
                css_classes=["clock-hours"],
                justify="center",
                label=utils.Poll(
                    10_000, lambda self: datetime.datetime.now().strftime("%-I")
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["clock-discrim"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: ":"
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["clock-minutes"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%M")
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["clock-ampm"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: datetime.datetime.now().strftime("%p")
                ).bind("output"),
            )
       ],
    )
    return clock_box
def date_widget() -> widgets.EventBox:
    date_box = widgets.EventBox(
        css_classes=["date"],
        child=[
            widgets.Label(
                css_classes=["date-day"],
                justify="center",
                label=utils.Poll(
                    10_000, lambda self: datetime.datetime.now().strftime("%a")
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["date-discrim"],
                justify="center",
                label=utils.Poll(
                    1_000, lambda self: ", "
                ).bind("output"),
            ),
            widgets.Label(
                css_classes=["date-day"],
                justify="center",
                label=utils.Poll(
                    10_000, lambda self: datetime.datetime.now().strftime("%m/%d")
                ).bind("output"),
            ),
        ],
    )
    date_box.halign = "end"
    return date_box
def clock(monitor_id: int = 0) -> widgets.Window:
    widget_box = widgets.Box(
        css_classes=["widget"],
        child=[clock_widget(), date_widget()])
    widget_box.vertical = True
    return widgets.Window(
        namespace=f"ignis_clock_{monitor_id}",
        monitor=monitor_id,
        anchor=["top", "right"],
        halign="end",
        exclusivity="ignore",
        layer="background",
        child=widget_box,
        margin_top=0,
        margin_right=0
    )
for i in range(utils.get_n_monitors()):
    clock(i)
