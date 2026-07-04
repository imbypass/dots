require("core.decoration.animations")
require("core.decoration.blur")
require("core.decoration.borders")


hl.config({
    decoration = {
        rounding = 14,
        rounding_power = 2,
        dim_inactive = false,
        shadow = {
            enabled = true,
            render_power = 16,
            range = 10,
            color = "rgba(00000090)",
        },
        blur = {
            enabled = true,
        },
    },
})
