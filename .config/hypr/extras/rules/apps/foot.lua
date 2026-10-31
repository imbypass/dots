hl.window_rule({
    match = {
        class = "^(foot)$",
        class = "^(float-no-pin)$",
    },
    render_unfocused = true,
    immediate = true,
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(foot)$",
            class = "^(float-no-pin)$",
        },
        ["hyprbars:bar_color"] = "rgba(0f0f0fff)",
    })
end
