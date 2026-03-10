set -l color00 '#0b0f19'
set -l color01 '#7f3133'
set -l color02 '#b87241'
set -l color03 '#bb9045'
set -l color04 '#2a1861'
set -l color05 '#1c2f60'
set -l color06 '#223360'
set -l color07 '#8e9299'
set -l color08 '#5a616e'
set -l color09 '#AA4245'
set -l color0A '#F69857'
set -l color0B '#FAC15D'
set -l color0C '#392082'
set -l color0D '#263F81'
set -l color0E '#2E4480'
set -l color0F '#c2c3c5'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$color00,bg:$color00,spinner:$color0E,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0E"\
" --color=marker:$color0E,fg+:$color06,prompt:$color0A,hl+:$color0D"
