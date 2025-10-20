#!/bin/bash

PATHS=(
    "$HOME/.config/Vencord"
    "$HOME/.config/vesktop"
    "$HOME/.config/equipbop"
    "/var/lib/flatpak/app/com.discordapp.Discord"
    "/var/lib/flatpak/app/dev.vencord.Vesktop"
    "/var/lib/flatpak/app/io.github.equicord.equibop"
)

function force_discord_theme_update() {
    for path in "${PATHS[@]}"; do
        if [ -d "$path" ]; then
            for file in "$path"/themes/*; do
                if [ -f "$file" ]; then
                    touch "$file"
                fi
            done
        fi
    done
}

force_discord_theme_update
