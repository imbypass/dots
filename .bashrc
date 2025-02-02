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
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi --reverse"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots/"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export MOZ_ENABLE_WAYLAND=0
export GTK_THEME=catppuccin-mocha-blue-standard+default
export GTK2_RC_FILES=/usr/share/themes/Catppuccin-Mocha-Standard-Sapphire-Dark/gtk-2.0/gtkrc
export MICRO_TRUECOLOR=1
export TERM='xterm-256color'
# export PYENV_ROOT="$HOME/.pyenv"
export EDITOR="helix"

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
mkdir ~/.logs/ > /dev/null || echo ""
pidof Hyprland > /dev/null || Hyprland > ~/.logs/hyprland.log & disown
