hl.window_rule({
    match = {
        class = "^(steam)$",
    },
    min_size = "1 1",
    workspace = "7 silent",
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Steam Big Picture Mode)$",
    },
    fullscreen = false,
    size = "1920 1080",
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
    },

    opacity = "1 1",
    immediate = true,
    render_unfocused = true,
    content = "game",
})

hl.window_rule({
    match = {
        class = "^(steam_app_.*)$",
    },

    opacity = "1 1",
    immediate = true,
    render_unfocused = true,
    content = "game",
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
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(steam)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            title = "^(Steam Big Picture Mode)$",
        },
        ["hyprbars:no_bar"] = true,
    })

    hl.window_rule({
        match = {
            class = "^(steam_app_0)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            class = "^(steam_app_.*)$",
        },
        ["hyprbars:no_bar"] = true,
    })

    hl.window_rule({
        match = {
            class = "*(steam)$",
        },
        ["hyprbars:no_bar"] = true,
    })
end
