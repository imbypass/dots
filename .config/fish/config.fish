# Interactive shell settings
if status is-interactive
    set fish_greeting
    set fish_tmux_autostart false
    set fish_tmux_autoname_session true
    # fastfetch
    # fuck a fastfetch, we got a bashfetch, bitch.
    ~/.local/bin/fetch
end

# Alt+Escape to prepend 'sudo'
bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion
