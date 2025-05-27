# Interactive shell settings
if status is-interactive
    set fish_greeting
    set fish_tmux_autostart true
    set fish_tmux_autoname_session true
    ~/.local/bin/fetch
end

set MANPAGER "nvim +Man!"

# Alt+Escape to prepend 'sudo'
bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion
