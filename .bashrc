#
# ~/.bashrc
#

PS1='[\u@\h \W]\$ '

# Initialization - Homebrew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# . "$HOME/.cargo/env"

# Initialization - Starship
eval "$(starship init bash)"

# Initialization - pyenv
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Environment Variables
export FZF_DEFAULT_OPTS=" \
--color=bg+:#202020,bg:#151515,spinner:#ffafaf,hl:#ff8700 \
--color=fg:#dddddd,header:#ffaf5f,info:#ff8700,pointer:#ffafaf \
--color=marker:#ff5f87,fg+:#c6b6ee,prompt:#ff8700,hl+:#ff8700 \
--color=border:#151515 \
--multi --reverse"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots/"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export MOZ_ENABLE_WAYLAND=0
export MICRO_TRUECOLOR=1
export TERM='xterm-256color'
export NIXPKGS_ALLOW_UNFREE=1
export WINEDEBUG=fixme-all

# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias cat="bat -p"
alias cl="clear"
alias ex="exit"
alias l="ls"
alias ls="eza --icons --grid"
alias lsa="eza -la --icons --grid"
alias nano="micro"
alias q="exit"
alias hyprlockfix='hyprctl --instance 0 "dispatch exec hyprlock"'

# Start Hyprland if not already running
pidof Hyprland > /dev/null || Hyprland & disown

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#fish
