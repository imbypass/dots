#!/bin/bash

output_file="$HOME/.mozilla/firefox/li1xg7z9.default-release/chrome/colors.css"

if ! command -v firefox >/dev/null 2>&1; then
    printf "\033[0;33m[WARNING]\033[0;37m Firefox not found. Skipping..\n"
    exit 0
fi

color00=${primary_background}
color01=${normal_black}
color02=${bright_black}
color03=${normal_white}
color04=${bright_white}
color05=${primary_foreground}
color06=${bright_white}
color07=${bright_white}
color08=${normal_red}
color09=${normal_yellow}
color0A=${bright_yellow}
color0B=${normal_green}
color0C=${normal_cyan}
color0D=${normal_blue}
color0E=${normal_magenta}
color0F=${bright_red}

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
