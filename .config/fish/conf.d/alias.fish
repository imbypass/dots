# Aliases - SSH
alias vps="ssh root@144.217.13.245"
alias moviebox="ssh schaefer@192.168.1.79"

# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias ani="ani-cli --dub --skip"
alias cl="clear"
alias clear="/usr/bin/clear && fastfetch"
alias clock="tty-clock -t -c -b -B -C 7"
alias ducks="du -cks * | sort -rn | head"
alias edit="$EDITOR ."
alias ex="exit"
alias f="fetch"
alias ff="fastfetch"
alias fp="flatpak"
alias fontview="magick display $1"
alias g="git"
alias grep="rg"
alias hl="hyprctl"
alias hrl="harmony-reload"
alias hpm="hyprpm"
alias hs="hyprshade"
alias hx.="helix ."
alias hx="helix"
alias icons="papirus-folders -t Papirus-Dark -C $1"
alias lg="lazygit"
alias m.="micro ."
alias m="micro"
alias micro="msedit"
alias mkdir="mkdir -pv"
alias mxw="sudo -n mxw"
alias nano="micro"
alias ncmp="ncmpcpp"
alias owner="pacman -Qo $1"
alias o="open"
alias o.="open ."
alias q="exit"
alias run0="run0 --background=00 "
alias t="ttt"
alias t.="t ."
alias tree="ls --tree"
alias th="thctl"
alias unset="set --erase"
alias vpn="protonvpn"
alias vote="ssh aur@aur.archlinux.org vote $1"
alias wg++="x86_64-w64-mingw32-g++"
alias x="exit"
alias ytdl="yt-dlp --format \"bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]\" $1"
alias z.="z ."
alias z="zeditor"
alias ⏲️="date"
alias cp="cp -irv"

# Aliases - cp/mv/rm -> zap
alias cp="zap -c "
alias mv="zap -m"
alias rm="zap -d"

# Aliases - cat -> bat
alias cat="bat -p"

# Aliases - ls -> eza
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ll='ls -l'
alias la='ls -la'
alias l="ls"

# Aliases - Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# Aliases - Tools
alias d='docker'
alias r='rails'

# Aliases - Functions
function open
    xdg-open $argv >/dev/null 2>&1 &
end

function n
    if test (count $argv) -eq 0
        ttt .
    else
        ttt $argv
    end
end
