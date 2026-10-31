hl.window_rule({
    match = {
        class = "^(steam_app_1091500)$",
        title = "REDlauncher"
    },
    float = true,
    center = true,
    immediate = true,
    rounding = 6,
})

hl.window_rule({
    match = {
        class = "^(steam_app_1091500)$",
        title = "Cyberpunk 2077 Crash Reporter"
    },
    float = true,
    center = true,
    immediate = true,
    rounding = 1,
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(steam_app_1091500)$",
            title = "REDlauncher"
        },
        ["hyprbars:no_bar"] = true,
    })

    hl.window_rule({
        match = {
            class = "^(steam_app_1091500)$",
            title = "Cyberpunk 2077 Crash Reporter"
        },
        ["hyprbars:no_bar"] = true,
    })
end
