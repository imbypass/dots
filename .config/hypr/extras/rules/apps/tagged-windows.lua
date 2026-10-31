hl.window_rule({
    name = "sink-switcher",
    match = {
        class = "^(sinkswitch)$",
    },
    float = true,
    pin = true,
    size = "400 120",
    opacity = "1 1",
    move = "2082 34",
})

hl.window_rule({
    name = "wifi-switcher",
    match = {
        class = "^(wifi)$",
    },
    float = true,
    pin = true,
    size = "400 488",
    opacity = "1 1",
    move = "1500 306",
    move = "1890 34",
})

hl.window_rule({
    name = "calendar",
    match = {
        class = "^(calendar)$",
    },
    float = true,
    pin = true,
    size = "685 452",
    opacity = "1 1",
    move = "1500 306",
    move = "1860 34",
})


hl.window_rule({
    name = "bluetooth-switcher",
    match = {
        class = "^(bluetooth)$",
    },
    float = true,
    pin = true,
    size = "400 488",
    opacity = "1 1",
    move = "2082 306",
    move = "2000 34",
})

hl.window_rule({
    name = "floating-fetch",
    match = {
        class = "^(fetch)$",
    },
    float = true,
    pin = true,
    size = "375 220",
    opacity = "1 1",
})

hl.window_rule({
    name = "float",
    match = {
        class = "^(window.float)$",
    },
    float = true,
    pin = true,
    opacity = "1 1",
    size = "855 535",
})

hl.window_rule({
    name = "float-no-pin",
    match = {
        class = "^(window.float-no-pin)$",
    },
    float = true,
    pin = false,
    opacity = "1 1",
    size = "855 535",
})

hl.window_rule({
    name = "pip",
    match = {
        tag = "pip",
    },
    min_size = "1 1",
    size = "480 270",
    move = "1320 8",
    size = "592 269",
    opacity = "1 1",
    border_size = 3,
    keep_aspect_ratio = false,
    no_initial_focus = true,
    decorate = true,
    float = true,
    pin = true,
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(sinkswitch)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            class = "^(wifi)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            class = "^(bluetooth)$",
        },
        ["hyprbars:no_bar"] = true,
    })
    hl.window_rule({
        match = {
            class = "^(sinkswitch)$",
        },
        ["hyprbars:no_bar"] = true,
    })
end
