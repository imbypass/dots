
hl.window_rule({
    match = {
        title = "^(World of Warcraft)$",
    },
    immediate = true,
    render_unfocused = true,
    content = "game",
    workspace = "4",
    fullscreen = true,
})

hl.window_rule({
    match = {
        title = "^(Battle.net.*)$"
    },
    immediate = true,
    render_unfocused = true,
    content = "game",
    workspace = "3",
    fullscreen = false,
    center = true,
})

hl.window_rule({
    match = {
        class = "^(pro.tuxcore.Lightforge)$"
    },
    immediate = true,
    render_unfocused = true,
    content = "game",
    workspace = "3",
    fullscreen = false,
    center = true,
})
