# Interactive shell settings
if status is-interactive
    set fish_greeting
    set fish_tmux_autostart false
    set fish_tmux_autoname_session true
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

# Initialize software
zoxide init fish --cmd cd | source
thefuck --alias | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
fzf --fish | source
starship init fish | source

# Custom PATH environment
fish_add_path /home/bypass/.spicetify
fish_add_path /home/bypass/.config/scripts
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/bypass/.local/bin
fish_add_path /opt/android-sdk/platform-tools

# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias ⏲️="date"
alias ...="cd ../.."
alias ani="ani-cli --dub --skip"
alias b="bde"
alias cat="bat -p"
alias cfg="config"
alias cl="clear"
alias clock="tty-clock -t -c -b -B -C 4"
alias ducks="du -cks * | sort -rn | head"
alias ex="exit"
alias f="fetch"
alias fl="flavours"
alias fp="flatpak"
alias g="git"
alias grep="rg"
alias h="hyprctl"
alias hpm="hyprpm"
alias hx="helix"
alias icons="papirus-folders -t Papirus-Dark -C $1"
alias l="ls"
alias ll="ls -l"
alias la="ls -la"
alias lg="lazygit"
alias ls="eza --icons"
alias lsa="ls -la"
alias m="micro"
alias moviebox="ssh schaefer@10.0.0.196"
alias nano="micro"
alias ncmp="ncmpcpp"
alias o="open"
alias q="exit"
alias t="todo"
alias tree="ls --tree"
alias unset="set --erase"
alias v="nvim"
alias vps="ssh root@imbypass.pw"
alias wg++="x86_64-w64-mingw32-g++"
alias wp="swww img $1"
alias x="exit"
alias yay="paru"
alias ytdl="yt-dlp --format \"bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]\" $1"
alias z="zed"
