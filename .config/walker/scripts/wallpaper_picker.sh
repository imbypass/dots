#!/bin/bash

WP_FOLDER=~/.local/share/wallpapers/
WALLPAPER=$(find "$WP_FOLDER" -type f -printf "%T@ %p\0" | sort -rnz | sed -z 's/^[^ ]* //' | tr '\0' '\n' | vicinae dmenu -p '[Wallpaper]')

if [ -n "$WALLPAPER" ]; then
    harmony-theme-set-wallpaper "$WALLPAPER"
fi
