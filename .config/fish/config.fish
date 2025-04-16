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
