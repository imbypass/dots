hl.window_rule({
    match = {
        class = "^(dev.zed.Zed)$",
    },
})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(dev.zed.Zed)$",
        },
        ["hyprbars:bar_color"] = "rgba(080808ff)",
    })
end
