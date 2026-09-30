hl.window_rule({
    match = {
        class = "^(dev.noctalia.Noctalia)$",
    },
    float = true,
    opacity = "1 1",
})
hl.window_rule({
    match = {
        class = "^(dev.noctalia.Noctalia)$",
        title = "Noctalia Settings",
    },
    float = true,
    size = "1140 840",
    opacity = "1 1",
    ["hyprbars:no_bar"] = true,
})
