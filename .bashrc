#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

alias config='/usr/bin/git --git-dir=/home/bypass/.dotfiles/ --work-tree=/home/bypass'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots/"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export MOZ_ENABLE_WAYLAND=0
export GTK_THEME=catppuccin-mocha-blue-standard+default
export GTK2_RC_FILES=/usr/share/themes/Catppuccin-Mocha-Standard-Sapphire-Dark/gtk-2.0/gtkrc
export MICRO_TRUECOLOR=1
export TERM='xterm-256color'
export PYENV_ROOT="$HOME/.pyenv"
export QT_QPA_PLATFORMTHEME='qt5ct'

# Custom miscellaneous aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Custom system aliases
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
alias vim="nvim"
alias ff="fastfetch"
alias ghosts="~/.config/scripts/ghosts.sh"
alias wp="hyprwall"
alias cb="~/.var/app/com.usebottles.bottles/data/bottles/bottles/Battle.net/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_classic_era_/CurseBreaker"

# Custom shortcut aliases
alias vps="ssh root@imbypass.pw"
alias ani="ani-cli --dub --skip"
alias wg++="x86_64-w64-mingw32-g++"

# Custom ricing aliases
alias clock="tty-clock -t -c -b -B"
alias whereami="hostnamectl hostname"
alias icat="kitty +kitten icat"
alias icons="papirus-folders -t Papirus-Dark -C "
alias tb_off="hyprpm disable hyprbars"
alias tb_on="hyprpm enable hyprbars"
alias fx_off="hyprshade off"
alias fx_on="hyprshade on vibrance"
alias fx="hyprshade toggle vibrance"

# Initialize pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Start Hyprland if not already running
pidof Hyprland || Hyprland > ~/.cache/hyprland/hyprland.log &
