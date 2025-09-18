# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
fzf --fish | source
starship init fish | source
pyenv init - fish | source

# Disable fish greeting
set fish_greeting
