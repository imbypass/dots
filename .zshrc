# CANT FORGET THE RICING
fish

# Environment Exports
export ZSH="$HOME/.oh-my-zsh"
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots/"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export MOZ_ENABLE_WAYLAND=0
export GTK_THEME=ZorinGrey-Dark
export GTK2_RC_FILES=/usr/share/themes/ZorinGrey-Dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=ZorinGrey-Dark
export MICRO_TRUECOLOR=1
export EDITOR='nvim'
export VISUAL='qview'

# Oh-My-Zsh
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# HOMEBREW (brew.sh) 
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval $(thefuck --alias)
eval "$(zoxide init --cmd cd zsh)"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom miscellaneous aliases
alias free_cache="echo 3 | sudo tee /proc/sys/vm/drop_caches"
alias clear_orphans="pacman -Qdtq | _ pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Custom system aliases
alias tree="eza -l --tree --icons"
alias ls="eza --icons --grid"
alias lsa="eza -la --icons --grid"
alias cat="bat -p"
alias nano="nvim"
alias py3="python3"
alias vim="nvim"
alias vps="ssh root@imbypass.pw"

# Custom ricing aliases
alias clock="tty-clock -t -c -b -B"
alias neofetch="fastfetch"
alias whereami="hostnamectl hostname"
alias icat="kitty +kitten icat"
alias icons="papirus-folders -t Papirus-Dark -C "
alias tb_off="hyprpm disable hyprbars"
alias tb_on="hyprpm enable hyprbars"
alias fx_off="hyprshade off"
alias fx_on="hyprshade on vibrance"
alias fx="hyprshade toggle vibrance"
 
# Custom PATH environment
export PATH=$PATH:/home/bypass/.spicetify
export PATH=$PATH:/home/bypass/.local/bin

# ZSH plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
