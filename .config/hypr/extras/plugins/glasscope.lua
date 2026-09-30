---@module 'hl'

local colors = require("extras.plugins.hyprbars_colors")

if os.getenv("HYPR_NO_PLUGINS") ~= "1" and hl.plugin.glasscope ~= nil then
    hl.config({
        plugin = {
            glasscope = {
                enabled = true,
                radius = 130,
                zoom = 2.0,
                color_strength = 0.3,
                color_width = 18.0,
                colors = {
                    transmission = "rgba(ffb8740d)",
                    refraction = "rgba(afd428a6)",
                    reflection = "rgba(f77a9599)",
                    highlight = "rgba(efe0d580)",
                },
            },
        },
    })

    hl.bind("SUPER + SHIFT + U", function()
        hl.plugin.glasscope.toggle()
    end, { description = "Show or hide Glasscope" })

    -- hl.bind("SUPER + ALT + A", function()
    --     hl.plugin.glasscope.toggle_pin()
    -- end, { description = "Pin or unpin Glasscope" })
end
