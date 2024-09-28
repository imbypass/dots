import os
import sys
import importlib.util
import argparse
import fcntl
import subprocess
import asyncio
import random as _random
import colorsys
import json

lock_file_path = '/tmp/wallpaper.lock'

def acquire_lock():
    global lock_file
    lock_file = open(lock_file_path, 'w')
    try:
        fcntl.flock(lock_file, fcntl.LOCK_EX | fcntl.LOCK_NB)
        lock_file.write(str(os.getpid()))
        lock_file.flush()
    except IOError:
        print("Another instance of the script is already running.")
        sys.exit(1)


def release_lock():
    fcntl.flock(lock_file, fcntl.LOCK_UN)
    lock_file.close()
    os.remove(lock_file_path)


def hue_to_numeric_hex(hue):
    hue = hue / 360.0
    rgb = colorsys.hls_to_rgb(hue, 0.5, 1.0)
    hex_color_str = '#{:02x}{:02x}{:02x}'.format(
        int(rgb[0] * 255), int(rgb[1] * 255), int(rgb[2] * 255)
    )
    numeric_hex_color = int(hex_color_str.lstrip('#'), 16)
    return numeric_hex_color


parser = argparse.ArgumentParser()
group = parser.add_mutually_exclusive_group(required=True)
group.add_argument('-I', '--image', type=str, help="Image")
group.add_argument('-P', '--prev', help="Use last used wallpaper for color generation", action='store_true')
group.add_argument('-R', '--random', help="Random image from folder", action='store_true')
parser.add_argument('-n', '--notify', help="Send notifications", action='store_true')
parser.add_argument('--status', type=str, help="Status file", default="/tmp/wallpaper.status")

args = parser.parse_args()

random = args.random
prev = args.prev
image = args.image
notify = args.notify
status = args.status

HOME = os.path.expanduser("~")

cache_file = f"{HOME}/.cache/current_wallpaper"
square = f"{HOME}/.cache/square_wallpaper.png"
png = f"{HOME}/.cache/current_wallpaper.png"


def current_state(state_str: str):
    with open(status, 'w') as f:
        f.write(state_str)


def send_notify(label: str, desc: str):
    if not notify:
        return
    subprocess.run(["notify-send", label, desc])


def state(name: str | None, label: str | None, desc: str | None):
    if name is not None:
        current_state(name)
    if label is not None:
        send_notify(label, desc or "")


def join(*args):
    return os.path.join(*args)


async def main():
    global color_scheme, custom_color, generation_scheme, swww_animation, wallpaper_engine, hyprpaper_tpl

    state("init", None, None)
    new_wallpaper = f"{HOME}/dotfiles/wallpapers/default.jpg"

    if random:
        files = [f for f in os.listdir(f"{HOME}/Pictures/Wallpapers") if f.endswith(('.png', '.jpg', '.jpeg'))]
        if files:
            new_wallpaper = join(f"{HOME}/Pictures/Wallpapers", _random.choice(files))
    elif prev:
        try:
            with open(cache_file) as f:
                new_wallpaper = f.read().strip()
        except FileNotFoundError:
            ...
    elif image is not None:
        new_wallpaper = os.path.abspath(image)

    print(f":: Changing wallpaper to \"{new_wallpaper}\"...")

    with open(cache_file, 'w') as f:
        f.write(new_wallpaper)

    with_image = f"{new_wallpaper}"

    # -----------------------------------------------------
    # Set the new wallpaper
    # -----------------------------------------------------
    state("changing", "Changing wallpaper...", with_image)
    
    cursor_pos = subprocess.getoutput('hyprctl cursorpos').replace(", ", ",")

    subprocess.run([
        'swww', 'img', new_wallpaper,
        '--transition-bezier', '.43,1.19,1,.4',
        '--transition-fps', '60',
        '--transition-type', 'wipe',
        '--transition-duration', '0.7',
        '--transition-pos', cursor_pos
    ])

    # -----------------------------------------------------
    # Generate colors
    # -----------------------------------------------------
    # state("colors", "Generating colors...", with_image)
    # print(":: Generate colors")
    # subprocess.run(['wal', '-i', new_wallpaper])

    state("reload", "Reloading desktop environment...", None)
    state("finish", "Wallpaper set successfully!", with_image)


if __name__ == "__main__":
    acquire_lock()
    try:
        asyncio.run(main())
    finally:
        release_lock()
