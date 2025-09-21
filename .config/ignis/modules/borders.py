from ignis.widgets.window import Window
from gi.repository import Gtk # pyright: ignore[reportMissingModuleSource]
from ignis.services.hyprland import HyprlandService
from .border_style.style_manager import StyleManager
import cairo

pi = 3.14
deg_2_rad = pi/180

StyleManager.get_default().initialize("/home/bypass/.config/ignis/config.json")

class Borders(Window):
    def __init__(self):
        super().__init__(
            namespace="border",
            anchor=["top", "left", "right", "bottom"],
            exclusivity="normal",
            layer="top",
            css_classes=["bg-none", "borders"]
        )

        self.input_width = 1
        self.input_height = 1

        self.child = Gtk.DrawingArea()
        self.child.set_draw_func(self.draw_shape)
        StyleManager.get_default().connect("style_modified", self.refresh)
        self.refresh()

    def refresh(self, *_):
        self.set_hyprland_margins()
        self.child.queue_draw()

    def set_hyprland_margins(self):
        style = StyleManager.get_default().style
        top = style.borders.size + style.borders.gap
        right = style.borders.size + style.borders.gap
        left = style.borders.size + style.borders.gap - 2
        bottom = style.borders.gap + style.borders.gap

        radius = style.borders.gap - style.borders.size

        HyprlandService.get_default().send_command(
            f"keyword decoration:rounding {radius}")
        HyprlandService.get_default().send_command(
            f"keyword general:gaps_out {top},{right},{bottom},{left}")

    def hex_to_rgba(self, hex: str):
        h = hex.lstrip('#')
        if len(h) == 6:
            r, g, b = tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4))
            return (r, g, b, 1.0)
        elif len(h) == 8:
            return tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4, 6))
        else:
            raise ValueError("invalid format")


    def draw_background(self, widget, ctx: cairo.Context, width, height):
        style = StyleManager.get_default().style
        r, g, b, a = self.hex_to_rgba(StyleManager.get_default().style.borders.color)
        ctx.set_source_rgba(r, g, b, a)
        ctx.rectangle(0, 0, width, height)
        ctx.fill()

    def draw_topleft_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 2
        y = style.borders.size
        r = style.borders.size + style.borders.gap
        ctx.arc(x+r, y+r, r, 180*deg_2_rad, 270*deg_2_rad)

    def draw_topright_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = style.borders.size
        y = style.borders.size
        w = width - style.borders.size - x
        r = style.borders.size + style.borders.gap
        ctx.arc(x+w-r, y+r, r, -90*deg_2_rad, 0*deg_2_rad)

    def draw_bottomright_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = style.borders.size
        y = style.borders.size
        w = width - style.borders.size - x
        h = height - style.borders.size - y
        r = style.borders.size + style.borders.gap
        ctx.arc(x+w-r, y+h-r, r, 0*deg_2_rad, 90*deg_2_rad)

    def draw_bottomleft_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 2
        y = style.borders.size
        w = width - style.borders.size - x
        h = height - style.borders.size - y
        r = style.borders.size + style.borders.gap
        ctx.arc(x+r, y+h-r, r, 90*deg_2_rad, 180*deg_2_rad)

    def draw_shape(self, widget, ctx: cairo.Context, width, height):
        self.draw_background(widget, ctx, width, height)

        ctx.set_operator(cairo.Operator.CLEAR)
        ctx.new_sub_path()

        self.draw_topleft_corner(widget, ctx, width, height)
        self.draw_topright_corner(widget, ctx, width, height)
        self.draw_bottomright_corner(widget, ctx, width, height)
        self.draw_bottomleft_corner(widget, ctx, width, height)

        ctx.close_path()
        ctx.fill()
        ctx.set_operator(cairo.Operator.OVER)
