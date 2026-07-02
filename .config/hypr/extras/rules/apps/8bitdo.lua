hl.window_rule({
    match = {
        class = "^(8bitdo\\.exe)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
})

hl.window_rule({
    match = {
        class = "*(8bitdo.exe)$",
    },
    immediate = true,
    render_unfocused = true,
    float = true,
})
