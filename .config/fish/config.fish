pyenv init - fish | source

# Interactive shell settings
if status is-interactive
    set fish_tmux_autostart false
    set fish_tmux_autoname_session true
    harmony-show-logo
    harmony-greeting
    echo ""
    harmony-show-colors
end

# Tab to complete a line
# bind tab accept-autosuggestion

# Alt+Escape to prepend 'sudo'

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
    bind -k nul accept-autosuggestion
    bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
end
