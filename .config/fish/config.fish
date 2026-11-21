# >>> lig pre >>>
eval ('/home/bypass/.local/bin/lig' init fish pre | string collect)
# <<< lig pre <<<
# Interactive shell settings
if status is-interactive

end

# Alt+Escape to prepend 'sudo'
function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
    bind \e\e 'begin; set -l buf (commandline); commandline -r "sudo "$buf; end'
end

