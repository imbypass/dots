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
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(dev.noctalia.Noctalia)$",
            title = "Noctalia Settings",
        },
        ["hyprbars:no_bar"] = true,
    })
end
