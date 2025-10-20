#!/bin/bash

filepath="$HOME/.config/omarchy/current/theme/hyprland.conf"
line=$(grep "col.active_border" "$filepath")
color=$(echo "$line" | grep -oE '[rgb|rgba]\([0-9A-Fa-f]+\)' | head -1 | sed 's/[rgb|rgba](\([^)]*\))/\1/')
echo "Adjusting keyboard color to ${color:0:6}..."
openrgb --device 1 --color ${color:0:6} > /dev/null 2>&1
