hl.layer_rule({
    name = "no-anim",
    match = {
        namespace = "selection",
        namespace = "overview",
        namespace = "anyrun",
        namespace = "popup.*",
        namespace = "hyprpicker",
        namespace = "no_anim",
        namespace = "walker",
        namespace = "vicinae",
    },
    no_anim = true,
})

hl.layer_rule({
    name = "blur",
    match = {
        namespace = "notifications",
        namespace = "launcher",
        namespace = "waybar",
        namespace = "walker",
        namespace = "ignis.*",
        namespace = "swayosd",
        namespace = "vicinae",
        namespace = "nwg-dock",
    },
    blur = true,
})

hl.layer_rule({
    name = "ignore-alpha 0.5",
    match = {
        namespace = "notifications",
        namespace = "walker",
        namespace = "ignis.*",
        namespace = "nwg-dock",
        namespace = "vicinae",
    },
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "ignore-alpha 0",
    match = {
        namespace = "vicinae",
    },
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "lockscreen",
    match = {
        namespace = "swayosd",
        namespace = "notifications",
    },
    above_lock = true,
})
