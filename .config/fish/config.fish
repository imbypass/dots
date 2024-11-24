# Interactive shell settings
if status is-interactive
    set TERM 'xterm-256color'
    set fish_greeting
    set fish_tmux_autostart true
    set fish_tmux_autoname_session true
    fish_vi_key_bindings
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
enable_transience

# Dotfiles git alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Simplified update-grub command
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Custom system aliases
alias tree="eza -l --tree --icons"
alias ls="eza --icons"
alias lsa="eza -la --icons"
alias l 'ls'
alias la 'ls -a'
alias cl="/usr/bin/clear && pman"
alias ex="exit"
alias grep="rg"
alias cat="bat"
alias h="hyprctl"
alias f="microfetch"
alias py3="python3"
alias v="nvim"
alias vim="nvim"
alias nano="nvim"

# Ricing commands - Making little things less painful
alias pman="bash -c ~/.config/scripts/pacman.sh"
alias ghosts="bash -c ~/.config/scripts/ghosts.sh"
alias wp="waypaper --random > /dev/null"

# Custom shortcut aliases
alias vps="ssh root@imbypass.pw"
alias moviebox="ssh schaefer@10.0.0.196"
alias ani="ani-cli --dub --skip"
alias wg++="x86_64-w64-mingw32-g++"
alias unset="set --erase"

# Custom ricing aliases
alias clock="tty-clock -t -c -b -B"
alias icons="papirus-folders -t Papirus-Dark -C "

# Custom PATH environment
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/local/bin
fish_add_path /home/bypass/.config/scripts
fish_add_path /home/linuxbrew/.linuxbrew/bin

# Created by `pipx` on 2024-10-31 03:20:13
set PATH $PATH /home/bypass/.local/bin
set -x EDITOR 'nvim'
set -x BAT_THEME 'Catppuccin Mocha'

