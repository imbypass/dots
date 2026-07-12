-- Source: ../../core/decoration/opacity.conf — convert this file to Lua and ensure it is on Lua's package.path.

local opFocus = 0.93
local opUnfocus = 0.93

-- Window Rules - Transparency
hl.window_rule({
    match = {
        class = "^(.*)$",
    },
    opacity = opFocus .. " " .. opUnfocus,
})

hl.window_rule({
    match = {
        class = "^(Google-chrome)$",
    },
    opacity = "1 1",
})

hl.window_rule({
    match = {
        class = "^(mpv)$",
    },
    opacity = "1 1",
})

hl.window_rule({
    match = {
        class = "^(vlc)",
    },
    opacity = "1 1",
})

hl.window_rule({
    match = {
        fullscreen = 1,
    },
    opacity = "1 1",
})

-- windowrule = opacity 1, class:^(.*)
