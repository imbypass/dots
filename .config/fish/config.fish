# Interactive shell settings
if status is-interactive
    set fish_greeting
    set fish_tmux_autostart true
    set fish_tmux_autoname_session true
    fish_vi_key_bindings
end

# Yazi shell wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Alt+Escape to prepend 'sudo'
bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion

# Starship Transient Prompt (Left)
function starship_transient_prompt_func
  starship module character
end

# Starship Transient Prompt (Right)
function starship_transient_rprompt_func
  starship module time
end

# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
fzf --fish | source
pyenv init - | source
starship init fish | source

# Enable transient prompt for Starship/Fish
#enable_transience

# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias tree="eza -l --tree --icons"
alias ls="eza --icons"
alias l 'ls'
alias la 'ls -la'
alias lsa="ls -la"
alias cl="clear"
alias x="exit"
alias q="exit"
alias ex="exit"
alias grep="rg"
alias cat="bat -p"
alias py3="python3"
alias v="nvim"
alias vim="nvim"
alias nano="nvim"
alias hx="helix"

# Aliases - User Tools
alias fetch="bfetch"
alias microfetch="bfetch"
alias f="bfetch"
alias ff="fastfetch"
alias h="hyprctl"
alias wp="swww img $1 > /dev/null"
alias vps="ssh root@imbypass.pw"
alias moviebox="ssh schaefer@10.0.0.196"
alias ani="ani-cli --dub --skip"
alias wg++="x86_64-w64-mingw32-g++"
alias unset="set --erase"
alias ncmp="ncmpcpp"
alias clock="tty-clock -t -c -b -B"
alias icons="papirus-folders -t Papirus-Dark -C $1"
alias t="todo"
alias ducks="du -cks * | sort -rn | head"

# Custom PATH environment
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/local/bin
fish_add_path /home/bypass/.config/scripts
fish_add_path /home/linuxbrew/.linuxbrew/bin

set PATH $PATH /home/bypass/.local/bin
