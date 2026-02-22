# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
fzf --fish | source
starship init fish | source

set --erase FZF_DEFAULT_OPTS
source ~/.config/omarchy/current/theme/colors.fish
source ~/.config/omarchy/current/theme/fzf.fish

set -g fish_tmux_autostart true

# Disable fish greeting
function fish_greeting
    echo "Arch Linux ($(uname -r | cut -d'-' -f1))"
    echo "Copyright (c) $(date +%Y) Linux Corporation. All rights reserved."
end
