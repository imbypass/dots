from ignis.widgets.window import Window
from gi.repository import Gtk # pyright: ignore[reportMissingModuleSource]
from styling.style_manager import StyleManager
from styling import utils
from ignis.services.hyprland import HyprlandService
import cairo

pi = 3.14
deg_2_rad = pi/180


class Border(Window):
    def __init__(self):
        super().__init__(
            namespace="border",
            anchor=["top", "left", "right", "bottom"],
            exclusivity="normal",
            layer="top",
            css_classes=["bg-none"]
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
        top = style.borders.top.height if style.borders.enabled and style.borders.top.enabled else 0
        right = style.borders.right.width if style.borders.enabled and style.borders.right.enabled else 0
        bottom = 0
        left = style.borders.left.width if style.borders.enabled and style.borders.left.enabled else 0

        top += style.borders.gap
        right += style.borders.gap
        bottom += style.borders.gap
        left += style.borders.gap

        HyprlandService.get_default().send_command(
            f"keyword general:gaps_out {top},{right},{bottom},{left}")

    def draw_background(self, widget, ctx: cairo.Context, width, height):
        style = StyleManager.get_default().style
        r, g, b, a = utils.hex_to_rgba(
            StyleManager.get_default().style.borders.color)
        ctx.set_source_rgba(r, g, b, a)
        ctx.rectangle(0, 0, width, height)
        ctx.fill()

    def draw_topleft_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 0
        if style.borders.left.enabled:
            x = style.borders.left.width

        y = 0
        if style.borders.top.enabled:
            y = style.borders.top.height

        r = style.borders.corners.topleft.radius if style.borders.corners.topleft.radius is not None else style.borders.corners.radius

        if style.borders.corners.enabled and style.borders.corners.topleft.enabled:
            ctx.arc(x+r, y+r, r, 180*deg_2_rad, 270*deg_2_rad)
        else:
            ctx.move_to(x, y)

    def draw_topright_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 0
        if style.borders.left.enabled:
            x = style.borders.left.width

        y = 0
        if style.borders.top.enabled:
            y = style.borders.top.height

        w = width - x
        if style.borders.right.enabled:
            w -= style.borders.right.width

        r = style.borders.corners.topright.radius if style.borders.corners.topright.radius is not None else style.borders.corners.radius

        if style.borders.corners.enabled and style.borders.corners.topright.enabled:
            ctx.arc(x+w-r, y+r, r, -90*deg_2_rad, 0*deg_2_rad)
        else:
            ctx.line_to(x+w, y)

    def draw_bottomright_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 0
        if style.borders.left.enabled:
            x = style.borders.left.width

        y = 0
        if style.borders.top.enabled:
            y = style.borders.top.height

        w = width - x
        if style.borders.right.enabled:
            w -= style.borders.right.width

        h = height - y
        if style.borders.bottom.enabled:
            h -= style.borders.bottom.height

        r = style.borders.corners.bottomright.radius if style.borders.corners.bottomright.radius is not None else style.borders.corners.radius

        if style.borders.corners.enabled and style.borders.corners.bottomright.enabled:
            ctx.arc(x+w-r, y+h-r, r, 0*deg_2_rad, 90*deg_2_rad)
        else:
            ctx.line_to(x+w, y+h)

    def draw_bottomleft_corner(self, widget, ctx, width, height):
        style = StyleManager.get_default().style
        x = 0
        if style.borders.left.enabled:
            x = style.borders.left.width

        y = 0
        if style.borders.top.enabled:
            y = style.borders.top.height

        w = width - x
        if style.borders.right.enabled:
            w -= style.borders.right.width

        h = height - y
        if style.borders.bottom.enabled:
            h -= style.borders.bottom.height

        r = style.borders.corners.bottomleft.radius if style.borders.corners.bottomleft.radius is not None else style.borders.corners.radius

        if style.borders.corners.enabled and style.borders.corners.bottomleft.enabled:
            ctx.arc(x+r, y+h-r, r, 90*deg_2_rad, 180*deg_2_rad)
        else:
            ctx.line_to(x, y+h)

    def draw_shape(self, widget, ctx: cairo.Context, width, height):
        if not StyleManager.get_default().style.borders.enabled:
            return

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
