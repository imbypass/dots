hl.window_rule({
    match = {
        class = "^(io.github.mochi_desktop.Mochi)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
    ["hyprbars:no_bar"] = true,
    border_size = 0,
    no_shadow = true,
    no_blur = true,
    pin = true,
    decorate = false,
    workspace = "6",
    move = "1 1810"
})
hl.window_rule({
    match = {
        class = "^(mochi)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
    ["hyprbars:no_bar"] = true,
    center = true,
    rounding = 16,
    pin = true,
    border_size = 0,
    focus_on_activate = true,
    stay_focused = true,
})
