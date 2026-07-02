hl.window_rule({
    match = {
        class = "^(vesktop)$",
    },
    render_unfocused = true,
    workspace = "1",
})

hl.window_rule({
    match = {
        initial_title = "^(Discord Popout)$",
    },
    tag = "+pip",
})

hl.window_rule({
    match = {
        tag = "pip",
    },
    min_size = "1 1",
    move = "1430 52",
    size = "480 270",
    move = "1323 28",
    size = "592 269",
    opacity = "1 1",
    border_size = 1,
    rounding = 0,
    keep_aspect_ratio = false,
    no_initial_focus = true,
    decorate = true,
    float = true,
    pin = true,
})
