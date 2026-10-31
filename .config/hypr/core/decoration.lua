require("core.decoration.animations")
require("core.decoration.blur")
require("core.decoration.borders")

hl.config({
    decoration = {
        rounding = 6,
        rounding_power = 2,
        dim_inactive = false,
        shadow = {
            enabled = true,
            render_power = 3,
            range = 6,
            color = "rgba(00000090)",
        },
        blur = {
            enabled = true,
        },
    },
})
