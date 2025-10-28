#!/bin/bash
#
input_file="$HOME/.config/omarchy/current/theme/alacritty.toml"
output_file="$HOME/.config/tmux/colors.conf"

if ! command -v tmux >/dev/null 2>&1; then
    printf "\033[0;33m[WARNING]\033[0;37m tmux not found. Skipping..\n"
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
                hex_part = substr($0, RSTART + (substr($0, RSTART, 2) == "0x" ? 2 : 1), 6)
                print "#" hex_part
                exit
            }
        }
    ' "$input_file"
}

create_dynamic_theme() {
    color00=$(extract_from_section "colors.primary" "background")
    color01=$(extract_from_section "colors.normal" "black")
    color02=$(extract_from_section "colors.bright" "black")
    color03=$(extract_from_section "colors.normal" "white")
    color04=$(extract_from_section "colors.bright" "white")
    color05=$(extract_from_section "colors.primary" "foreground")
    color06=$(extract_from_section "colors.bright" "white")
    color07=$(extract_from_section "colors.bright" "white")
    color08=$(extract_from_section "colors.normal" "red")
    color09=$(extract_from_section "colors.normal" "yellow")
    color0A=$(extract_from_section "colors.bright" "yellow")
    color0B=$(extract_from_section "colors.normal" "green")
    color0C=$(extract_from_section "colors.normal" "cyan")
    color0D=$(extract_from_section "colors.normal" "blue")
    color0E=$(extract_from_section "colors.normal" "magenta")
    color0F=$(extract_from_section "colors.bright" "red")

    cat > "$output_file" << EOF
set -g @nova-pane-active-border-style "${color00}"
set -g @nova-pane-border-style "${color00}"
set -g @nova-status-style-bg "${color00}"
set -g @nova-status-style-fg "${color04}"
set -g @nova-status-style-active-bg "${color00}"
set -g @nova-status-style-active-fg "${color0D}"
set -g @nova-status-style-double-bg "${color00}"
set -g @nova-segment-mode-colors "${color00} ${color03}"
set -g @nova-segment-datetime-colors "${color00} ${color03}"
EOF

}

create_dynamic_theme

printf "\033[0;32m[SUCCESS]\033[0;37m tmux theme updated!\n"
