-- # windowrule = immediate, title:^(Battle.net.*)$
-- windowrule = match:title ^(Battle.net.*)$, decorate off

-- windowrule = match:class ^(steam_app_0)$ title:^(World of Warcraft)$, fullscreen on
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
        title = "^(Battle.net.*)$",
    },
    immediate = true,
    render_unfocused = true,
    content = "game",
    workspace = "3",
    fullscreen = false,
    center = true,
})
