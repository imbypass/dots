
from watchdog.events import FileModifiedEvent, FileSystemEventHandler
from watchdog.observers import Observer
from ignis.gobject import IgnisGObject, IgnisSignal
from ignis.singleton import IgnisSingleton
from .style import Style
import json
import threading


class StyleManager(IgnisSingleton, IgnisGObject, FileSystemEventHandler):
    __path: str | None
    __lock: threading.Lock | None

    def initialize(self, path: str):
        self.__lock = threading.Lock()
        self.__path = path
        self.__setup_watcher()
        self.__reload()

    def on_modified(self, event: FileModifiedEvent) -> None:
        self.__reload()
        self.emit("style_modified")

    def __setup_watcher(self):
        __observer = Observer()
        __observer.schedule(self, self.__path)
        __observer.start()

    def __reload(self):
        self.__lock.acquire()
        try:
            with open(self.__path, 'r') as f:
                data = json.load(f)
                self.style = Style(**data)
        except Exception as e:
            print(f"failed to load style: {e}")
            self.style = None
        finally:
            self.__lock.release()

    def save(self):
        self.__lock.acquire()
        try:
            if self.style is None:
                return
            with open(self.__path, 'w') as f:
                j = self.style.model_dump_json(exclude_defaults=True, indent=4)
                f.write(j)
        except Exception as e:
            print(f"failed to save style: {e}")
        finally:
            self.__lock.release()

    @IgnisSignal
    def style_modified(self):
        """
        Emitted when anything changes the style
        """

    style: Style
