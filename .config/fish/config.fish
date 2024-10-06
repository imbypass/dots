if status is-interactive
    set fish_greeting
    fastfetch
end

bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion

# Custom PATH environment
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/local/bin
fish_add_path /home/bypass/.config/scripts
fish_add_path /home/linuxbrew/.linuxbrew/bin

# starship init fish | source
zoxide init fish --cmd cd | source
# thefuck --alias | source
# pyenv init - | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source

set -x ZSH "$HOME/.oh-my-zsh"
set -x HYPRSHOT_DIR "$HOME/Pictures/Screenshots/"
set -x ELECTRON_OZONE_PLATFORM_HINT "wayland"
set -x MOZ_ENABLE_WAYLAND 0
set -x GTK_THEME ZorinGrey-Dark
set -x GTK2_RC_FILES /usr/share/themes/ZorinGrey-Dark/gtk-2.0/gtkrc
set -x QT_STYLE_OVERRIDE ZorinGrey-Dark
set -x MICRO_TRUECOLOR 1
set -x SHELL 'fish'
set -x EDITOR 'nvim'
set -x VISUAL 'qview'
set -x ANI_CLI_MODE 'dub'
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

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
alias cat="bat -p"
alias nano="nvim"
alias py3="python3"
alias vim="nvim"
alias vps="ssh root@imbypass.pw"
alias ani="ani-cli --dub --skip"

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

# Custom ls/eza overrides
alias l 'ls -alh'
alias la 'eza -a'
alias ll 'eza -lTF --group-directories-first --color=always --git --git-ignore --level 1'
alias ll2 'eza -lTF --group-directories-first --color=always --git --git-ignore --level 2'
alias ll2a 'eza -laTF --group-directories-first --color=always --git --level 2'
alias ll3 'eza -lTF --group-directories-first --color=always --git --git-ignore --level 3'
