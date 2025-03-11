#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Initialization - Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

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

# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias cl="clear"
alias tree="eza -l --tree --icons"
alias l="ls"
alias ls="eza --icons --grid"
alias lsa="eza -la --icons --grid"
alias grep="rg"
alias h="hyprctl"
alias cat="bat -p"
alias nano="nvim"
alias py3="python3"
alias hx="helix"

# Start Hyprland if not already running
pidof Hyprland > /dev/null || Hyprland > ~/.logs/hyprland.log & disown
