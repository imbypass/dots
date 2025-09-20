from ignis import widgets
from ignis.services.hyprland import HyprlandService, HyprlandWorkspace

hyprland = HyprlandService.get_default()


def workspace_button(workspace: HyprlandWorkspace) -> widgets.Button:
    widget = widgets.Button(
        css_classes=["workspace"],
        on_click=lambda x: workspace.switch_to(),
    )
    if workspace.id == hyprland.active_workspace.id:
        widget.add_css_class("active")

    if workspace.id != -99:
        return widget
    else:
        return None

def scroll_workspaces(direction: str, monitor_name: str = "") -> None:
    current = hyprland.active_workspace.id
    if direction == "down":
        HyprlandService.get_default().send_command(f"dispatch workspace e-1")
    else:
        HyprlandService.get_default().send_command(f"dispatch workspace e+1")

def workspaces(monitor_name: str) -> widgets.EventBox:
    hl_workspaces = widgets.EventBox(
        on_scroll_up=lambda x: scroll_workspaces("up"),
        on_scroll_down=lambda x: scroll_workspaces("down"),
        css_classes=["workspaces"],
        spacing=5,
        child=hyprland.bind_many(
            ["workspaces", "active_workspace"],
            transform=lambda workspaces, active_workspace: [
                workspace_button(i) for i in workspaces
            ],
        ),
    )
    hl_workspaces.set_orientation(1)
    return hl_workspaces

class Workspaces(widgets.Box):
    def __init__(self, monitor_name: str):
        super().__init__(

            child=[
                workspaces(monitor_name),
            ],
            spacing=10,
        )
