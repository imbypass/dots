hl.window_rule({
    match = {
        class = "^(org.gnome.Nautilus)$",
    },
    min_size = "1 1",
})

-- windowrule = match:class ^(org.gnome.Nautilus), decorate off
hl.window_rule({
    match = {
        class = "^(org.gnome.Nautilus) title ^(.*)$",
    },
    rounding = 0,
})

-- windowrule = bordercolor $base02 $base02, class:^(org.gnome.Nautilus)$

hl.window_rule({
    match = {
        class = "^(org.gnome.NautilusPreviewer)$",
    },
    float = true,
    size = "800 600",
})
