hl.window_rule({
    match = {
        class = "^(nemo)$",
    },
    min_size = "1 1",
})

hl.window_rule({
    match = {
        class = "^(nemo)",
    },
    rounding = 0,
})

-- windowrule = match:class ^(nemo), decorate off
-- windowrule = plugin:hyprbars:bar_color $base02, class:^(nemo)$
