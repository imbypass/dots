hl.window_rule({
    match = {
        class = "^(org.localsend.localsend_app)$",
    },
    float = true,
    size = "423 614",
    move = "1478 54",

})

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.hyprbars ~= nil then
    hl.window_rule({
        match = {
            class = "^(org.localsend.localsend_app)$",
        },
        ["hyprbars:bar_color"] = "rgba(080808ff)",
    })
end
