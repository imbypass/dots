pyenv init - fish | source

# Interactive shell settings
if status is-interactive
    set fish_tmux_autostart true
    set fish_tmux_autoname_session true
end

# Tab to complete a line
# bind tab accept-autosuggestion

# Alt+Escape to prepend 'sudo'
bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
bind -k nul accept-autosuggestion

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
