import datetime
from ignis.widgets import Widget
from ignis.utils import Utils

def update_label(clock_label: Widget.Label) -> None:
    text = datetime.datetime.now().strftime("%H:%M:%S")
    clock_label.set_label(text)

def bar(monitor: int) -> Widget.Window:
    clock_label = Widget.Label()

    Utils.Poll(1000, lambda x: update_label(clock_label))

    return Widget.Window(
        namespace=f"some-window-{monitor}",
        monitor=monitor,
        child=Widget.Box(
            vertical=True,
            spacing=10,
            child=[clock_label],
        ),
    )