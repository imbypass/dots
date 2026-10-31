hl.window_rule({
    match = {
        class = "^(io.github.mochi_desktop.Mochi)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
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
    center = true,
    rounding = 16,
    pin = true,
    border_size = 0,
    focus_on_activate = true,
    stay_focused = true,
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(io.github.mochi_desktop.Mochi)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            class = "^(mochi)$",
        },
        ["hyprbars:no_bar"] = true,
    })
end
