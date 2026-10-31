hl.window_rule({
    match = {
        class = "^(flux.*)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true
})
hl.window_rule({
    match = {
        class = "^(flux-screen)$",
    },
    immediate = true,
    render_unfocused = true,
    size = "372 828",
    float = true,
    pin = true,
    rounding = 0,
    border_size = 0,
    no_shadow = true,
    no_blur = true,
    decorate = false,
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(flux-screen)$",
        },
        ["hyprbars:no_bar"] = true,
    })
end
