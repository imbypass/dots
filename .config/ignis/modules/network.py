import datetime
import asyncio
from ignis import widgets
from ignis import utils
from ignis.services.network import NetworkService, Ethernet, Wifi
from ignis.options import options


class IndicatorIcon(widgets.Icon):
    def __init__(self, css_classes: list[str] = [], **kwargs):
        super().__init__(
            style="margin-left: -3px; margin-bottom: -2px; margin-right: 4px;",
            pixel_size=13,
            css_classes=["unset"] + css_classes, **kwargs
        )


class NetworkIndicatorIcon(IndicatorIcon):
    def __init__(
        self, device_type: Ethernet | Wifi, other_device_type: Wifi | Ethernet
    ):
        self._device_type = device_type
        self._other_device_type = other_device_type

        super().__init__(icon_name=device_type.bind("icon-name"))

        for binding in (
            device_type.bind("devices", self.__check_visibility),
            other_device_type.bind("is_connected", self.__check_visibility),
            device_type.bind("is_connected", self.__check_visibility),
        ):
            self.visible = binding  # type: ignore

    def __check_visibility(self, *args) -> bool:
        return len(self._device_type.devices) > 0 and (
            not self._other_device_type.is_connected or self._device_type.is_connected
        )

network = NetworkService.get_default()

class WifiIcon(NetworkIndicatorIcon):
    def __init__(self):
        super().__init__(device_type=network.wifi, other_device_type=network.ethernet)


class EthernetIcon(NetworkIndicatorIcon):
    def __init__(self):
        super().__init__(device_type=network.ethernet, other_device_type=network.wifi)

class NetworkIndicator(widgets.EventBox):
    def __init__(self):
        super().__init__(
            child=[
                WifiIcon(),
                EthernetIcon()
            ],
            on_click=lambda x: asyncio.create_task(utils.exec_sh_async("nm-connection-editor"))
        )
