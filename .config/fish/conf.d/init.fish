# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
fzf --fish | source
starship init fish | source

set --erase FZF_DEFAULT_OPTS
source ~/.config/omarchy/current/theme/colors.fish
source ~/.config/omarchy/current/theme/fzf.fish

# Disable fish greeting
function fish_greeting
    fetch
end
