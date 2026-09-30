hl.window_rule({
    match = {
        class = "^(steam)$",
    },
    min_size = "1 1",
    workspace = "2 silent",
    float = true,
    border_size = 1,
    ["hyprbars:no_bar"] = true,
})

hl.window_rule({
    match = {
        title = "^(Steam Big Picture Mode)$",
        class = "^(steam)$",
    },
    fullscreen = true,
})

hl.window_rule({
    match = {
        title = "^(Friends List)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Add Non-Steam Game)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Friends List)$",
    },
    size = "300 700",
})

hl.window_rule({
    match = {
        class = "^(steam_app_0)$",
        class = "^(steam_app_.*)$",
    },

    opacity = "1 1",
    workspace = "4",
    immediate = true,
    render_unfocused = true,
    fullscreen = true,
    content = "game",
    workspace = "4",
    ["hyprbars:no_bar"] = true,
})

hl.window_rule({
    match = {
        class = "*(steam)$",
    },
    immediate = true,
    render_unfocused = true,
    fullscreen = true,
    content = "game",
    workspace = "4",
    border_size = 1,
    ["hyprbars:no_bar"] = true,
})
