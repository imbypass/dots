# Aliases - Configuration
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Aliases - System Tools
alias ani="ani-cli --dub --skip"
alias c="config"
alias cat="bat -p"
alias cfg="config"
alias cl="clear"
alias clock="tty-clock -t -c -b -B -C 7"
alias cp="cp -irv"
alias ducks="du -cks * | sort -rn | head"
alias edit="zed ."
alias ex="exit"
alias f="fetch"
alias ff="fastfetch"
alias fl="flavours"
alias fp="flatpak"
alias fontview="magick display $1"
alias g="git"
alias grep="rg"
alias hc="harmony-theme-set"
alias hd="copy-helpdoc"
alias hl="hyprctl"
alias hrl="harmony-reload"
alias hpm="hyprpm"
alias hs="hyprshade"
alias hx.="helix ."
alias hx="helix"
alias icons="papirus-folders -t Papirus-Dark -C $1"
alias l="ls"
alias la="ls -la"
alias lg="lazygit"
alias ll="ls -l"
alias ls="eza --icons"
alias lsa="ls -la"
alias m.="micro ."
alias m="micro"
alias mkdir="mkdir -pv"
alias moviebox="ssh schaefer@10.0.0.196"
alias mxw="sudo -n mxw"
alias nano="micro"
alias ncmp="ncmpcpp"
alias owner="pacman -Qo $1"
alias o="open"
alias o.="open ."
alias q="exit"
alias run0="run0 --background=00 "
alias si="swayimg"
alias soundux="flatpak run io.github.Soundux"
alias t="todo"
alias tree="ls --tree"
alias th="thctl"
alias unset="set --erase"
alias v="nvim"
alias vote="ssh aur@aur.archlinux.org vote $1"
alias vps="ssh root@imbypass.pw"
alias wg++="x86_64-w64-mingw32-g++"
alias x="exit"
alias ytdl="yt-dlp --format \"bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]\" $1"
alias z.="z ."
alias z="zeditor"
alias ⏲️="date"


alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

function open
    xdg-open $argv >/dev/null 2>&1 &
end

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias d='docker'
alias r='rails'

function n
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end

# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
