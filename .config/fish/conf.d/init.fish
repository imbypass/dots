# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
fzf --fish | source

set --erase FZF_DEFAULT_OPTS
source ~/.config/omarchy/current/theme/colors.fish
source ~/.config/omarchy/current/theme/fzf.fish

set -g fish_tmux_autostart true

# Set custom prompt
function fish_prompt
    string join '' -- (set_color white) (prompt_pwd --full-length-dirs 2) (set_color normal) ' ❯ '
end

# Disable fish greeting
function fish_greeting
    greeting
end
