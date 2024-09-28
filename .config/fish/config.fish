fastfetch

function fish_prompt -d "Write out the prompt"
  printf '%s@%s %s%s%s > ' $USER $hostname \
    (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
  set fish_greeting
end

starship init fish | source
zoxide init fish --cmd cd | source
thefuck --alias | source
pyenv init - | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source

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

# Custom miscellaneous aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias free_cache="echo 3 | sudo tee /proc/sys/vm/drop_caches"
alias clear_orphans="pacman -Qdtq | sudo pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Custom system aliases
alias !="sudo "
alias tree="eza -l --tree --icons"
alias l="ls"
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
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/local/bin
fish_add_path /home/bypass/.config/scripts

export PYENV_ROOT="$HOME/.pyenv"
fish_add_path $PYENV_ROOT/bin
