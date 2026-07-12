#!/bin/bash
#
WP_FOLDER=~/.local/share/wallpapers/
EXCLUDE_FILE=$WP_FOLDER/.exclude


find "$WP_FOLDER" -type f

find_wallpapers() {
    local exclude_pattern
    exclude_pattern=$(paste -sd'|' "$EXCLUDE_FILE")

    find "$WP_FOLDER" -type f -printf "%T@ %p\0" \
      | sort -rnz \
      | sed -z 's/^[^ ]* //' \
      | tr '\0' '\n' \
      | grep -vE "/(${exclude_pattern})\$"
}

dmenu_cmd() {
    vicinae dmenu -p '[Wallpapers]'
}

WALLPAPER=$(find_wallpapers | dmenu_cmd)

if [ -n "$WALLPAPER" ]; then
    harmony-theme-set-wallpaper "$WALLPAPER"
fi
