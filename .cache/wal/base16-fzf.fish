set -l color00 '#131515'
set -l color01 '#f16e65'
set -l color02 '#b6c36f'
set -l color03 '#ef944d'
set -l color04 '#a5cab8'
set -l color05 '#e9869a'
set -l color06 '#8ecd84'
set -l color07 '#e5d5b1'
set -l color08 '#393939'
set -l color09 '#eb7a73'
set -l color0A '#b9c675'
set -l color0B '#efbe71'
set -l color0C '#8dbba3'
set -l color0D '#e396a4'
set -l color0E '#99c792'
set -l color0F '#F1E4C2'

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
