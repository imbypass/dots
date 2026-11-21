hl.window_rule({
    match = {
        class = "^(Minecraft.*)",
        title = "^(Minecraft.*)",
    },
    fullscreen = true,
    workspace = "4",
    immediate = true,
    render_unfocused = true,
    content = "game",
})
hl.window_rule({
    match = {
        class = "^(xmcl)$",
    },
    float = true,
    center = true,
    size = "1200 800",
    workspace = "3",
    immediate = true,
    render_unfocused = true,
    content = "game",
})
hl.window_rule({
    match = {
        class = "^(horizon)$",
    },
    float = true,
    center = true,
    size = "1200 800",
    immediate = true,
    render_unfocused = true,
    content = "game",
    fullscreen = true,
    workspace = "4",
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
hl.window_rule({
    match = {
        class = "^(xmcl)$",
    },
    ["hyprbars:bar_color"] = "#111111",
})
end

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
hl.window_rule({
    match = {
        class = "^(horizon)$",
    },
    ["hyprbars:bar_color"] = "#111111",
})
end
