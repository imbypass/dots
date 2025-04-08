#!/usr/bin/env bash

config_path=~/.config/foot/colors.ini

inotifywait -q -m "$config_path" -e create -e modify |
    while read; do
        # ex: 'regular0=0b0b0b'
        sed -n -r 's/^\w*(regular|bright)([0-9])=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3 \4 \5/p' "$config_path" |
            while read color_type idx r g b; do
                if [ "$color_type" = "bright" ]; then
                    idx="$((idx + 8))"
                fi
                echo -ne "\e]4;$idx;rgb:$r/$g/$b\e\\"
            done
        # ex: 'foreground=ffffff'
        sed -n -r 's/^\w*foreground=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3/p' "$config_path" |
            while read r g b; do
                echo -ne "\e]10;rgb:$r/$g/$b\e\\"
            done
        # ex: 'background=0b0b0b'
        sed -n -r 's/^\w*background=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3/p' "$config_path" |
            while read r g b; do
                echo -ne "\e]11;rgb:$r/$g/$b\e\\"
            done
    done &

exec "$SHELL"
