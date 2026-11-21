
# ZOXIDE
zoxide init fish --cmd cd | source

# THE FUCK
thefuck --alias | source

# FZF (FUZZY FINDER)
fzf --fish | source

# LIG AUTO-COMPLETE
eval ('/home/bypass/.local/bin/lig' init fish post | string collect)

# NODE VERSION MANAGER
bash /usr/share/nvm/init-nvm.sh | source

# COLORS
set --erase FZF_DEFAULT_OPTS
source ~/.config/omarchy/current/theme/colors.fish
source ~/.config/omarchy/current/theme/fzf.fish

set -g fish_tmux_autostart true

# PROMPT
function fish_prompt
    string join '' -- (set_color white) (prompt_pwd --full-length-dirs 2) (set_color normal) ' ❯ '
end
starship init fish | source

# GREETING
function fish_greeting
    fastfetch
end
