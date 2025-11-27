# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
fzf --fish | source
starship init fish | source
pyenv init - fish | source

source ~/.config/omarchy/current/theme/colors.fish
set --erase FZF_DEFAULT_OPTS
source ~/.config/omarchy/current/theme/fzf.fish

# Disable fish greeting
set fish_greeting

fetch
