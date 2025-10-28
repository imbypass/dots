#!/bin/bash

sleep 2 && cd ~/.local/share/adwaita-steam/ && ./install.py \
    --color-theme base16 \
    --extras library/hide_whats_new \
    --font zedmono \
    --custom-css > /dev/null 2>&1

printf "\033[0;32m[SUCCESS]\033[0;37m Steam theme updated!\n"
