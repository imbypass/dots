hl.window_rule({
    match = {
        class = "^(com.usebottles.bottles)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Are you sure)(.*)$",
    },
    rounding = 0,
})
