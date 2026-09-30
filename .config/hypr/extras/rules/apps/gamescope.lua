hl.window_rule({
    match = {
        class = "*(gamescope)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
    fullscreen = true,
    content = "game",
    workspace = "4",
})

-- hl.window_rule({
--     match = {
--         class = "^(.*)$",
--         fullscreen = 1, -- Or "1" depending on your target fullscreen state
--     },
--     confine_pointer = true,
-- })
