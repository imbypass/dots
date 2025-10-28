#!/bin/bash

touch ~/.config/alacritty/alacritty.toml

input_file="$HOME/.config/omarchy/current/theme/alacritty.toml"
output_file="$HOME/.mozilla/firefox/li1xg7z9.default-release/chrome/colors.css"

if ! command -v firefox >/dev/null 2>&1; then
    printf "\033[0;33m[WARNING]\033[0;37m Firefox not found. Skipping..\n"
    exit 0
fi

extract_from_section() {
    local section="$1"
    local color_name="$2"
    awk -v section="[$section]" -v color="$color_name" '
        $0 == section { in_section=1; next }
        /^\[/ { in_section=0 }
        in_section && $1 == color {
            if (match($0, /(#|0x)[0-9a-fA-F]{6}/)) {
                print substr($0, RSTART, RLENGTH)
                exit
            }
        }
    ' "$input_file"
}

color00=$(extract_from_section "colors.primary" "background")  # Default Background
color01=$(extract_from_section "colors.normal" "black")        # Lighter Background
color02=$(extract_from_section "colors.bright" "black")        # Selection Background
color03=$(extract_from_section "colors.normal" "white")        # Comments
color04=$(extract_from_section "colors.bright" "white")        # Dark Foreground
color05=$(extract_from_section "colors.primary" "foreground")  # Default Foreground
color06=$(extract_from_section "colors.bright" "white")        # Light Foreground
color07=$(extract_from_section "colors.bright" "white")        # Light Background
color08=$(extract_from_section "colors.normal" "red")          # Red
color09=$(extract_from_section "colors.normal" "yellow")       # Orange (using yellow)
color0A=$(extract_from_section "colors.bright" "yellow")       # Yellow
color0B=$(extract_from_section "colors.normal" "green")        # Green
color0C=$(extract_from_section "colors.normal" "cyan")         # Cyan
color0D=$(extract_from_section "colors.normal" "blue")         # Blue
color0E=$(extract_from_section "colors.normal" "magenta")      # Magenta
color0F=$(extract_from_section "colors.bright" "red")          # Brown (using bright red)

cat > "$output_file" << EOF
:root {
--color00: ${color00};
--color01: ${color00};
--color02: ${color00};
--color03: ${color03};
--color04: ${color04};
--color05: ${color05};
--color06: ${color06};
--color07: ${color07};
--color08: ${color08};
--color09: ${color09};
--color0A: ${color0A};
--color0B: ${color0B};
--color0C: ${color0C};
--color0D: ${color0D};
--color0E: ${color0E};
--color0F: ${color0F};
}
EOF

if pgrep -x "firefox" > /dev/null; then
    pkill -x "$APP_NAME"
    sleep 2
    if pgrep -x "firefox" > /dev/null; then
        pkill -9 -x "$APP_NAME"
        sleep 1
    fi
    firefox &
fi

printf "\033[0;32m[SUCCESS]\033[0;37m Firefox theme updated!\n"
