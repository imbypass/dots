#!/bin/bash

filepath="/home/bypass/.config/omarchy/current/theme/hyprland.conf"
line=$(grep "col.active_border" "$filepath")
color=$(echo "$line" | grep -oE '[rgb|rgba]\([0-9A-Fa-f]+\)' | head -1 | sed 's/[rgb|rgba](\([^)]*\))/\1/')
mxw config led-effect solid ${color:0:6}

echo "Mouse theme updated!"
