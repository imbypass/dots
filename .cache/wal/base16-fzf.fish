set -l color00 '#160d20'
set -l color01 '#9B2463'
set -l color02 '#CB2D5F'
set -l color03 '#A15159'
set -l color04 '#E55A62'
set -l color05 '#F6AC67'
set -l color06 '#394E8D'
set -l color07 '#c4c2c7'
set -l color08 '#665d71'
set -l color09 '#9B2463'
set -l color0A '#CB2D5F'
set -l color0B '#A15159'
set -l color0C '#E55A62'
set -l color0D '#F6AC67'
set -l color0E '#394E8D'
set -l color0F '#c4c2c7'

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
