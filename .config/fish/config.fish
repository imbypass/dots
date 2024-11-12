if status is-interactive
    set TERM 'xterm-256color'
    set fish_greeting
    set fish_tmux_autostart true
    set fish_tmux_autoname_session true
    #fish_vi_key_bindings
    fastfetch -c ~/.config/fastfetch/minimal.jsonc
    
    set QT_QPA_PLATFORMTHEME qt5ct
    set --erase QT_STYLE_OVERRIDE
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion

# Custom PATH environment
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/local/bin
fish_add_path /home/bypass/.config/scripts
fish_add_path /home/linuxbrew/.linuxbrew/bin

# Other Inits? (not exactly sure what to call these)
zoxide init fish --cmd cd | source
thefuck --alias | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
starship init fish | source
fzf --fish | source
pyenv init - | source


# Custom miscellaneous aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Custom system aliases
alias cl="clear"
alias tree="eza -l --tree --icons"
alias l="ls"
alias ls="eza --icons"
alias lsa="eza -la --icons"
alias grep="rg"
alias h="hyprctl"
alias cat="bat"
alias nano="nvim"
alias v="nvim"
alias py3="python3"
alias vim="nvim"
alias ff="fastfetch -c minimal"
alias ghosts="fastfetch -c ~/.config/fastfetch/minimal.jsonc"
alias wp="waypaper --random > /dev/null"
alias clear="/usr/bin/clear && ghosts"
alias ex="exit"

# Custom shortcut aliases
alias vps="ssh root@imbypass.pw"
alias ani="ani-cli --dub --skip"
alias wg++="x86_64-w64-mingw32-g++"
alias binds="nvim ~/.config/hypr/conf/keybinding.conf"
alias unset="set --erase"

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

# Created by `pipx` on 2024-10-31 03:20:13
set PATH $PATH /home/bypass/.local/bin
