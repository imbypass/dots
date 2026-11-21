hl.config({
    general = {
        border_size = 2,
        col = {
-- 89b4fa
            active_border = {
                colors = {
                    "rgba(7e92e2ff)",
                    "rgba(cf7cebff)",
                    "rgba(ad7eb1ff)",
                    "rgba(d883acff)",
                    "rgba(e4ad72ff)",
                },
                angle = 25
            },
            inactive_border = "rgba(332a47ff)",
        },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = { { 0.0, 0.0 }, { 1.0, 1.0 } },
})

-- 3. Configure the border animations
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 3,
    bezier = "linear",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 100,        -- Higher values = slower rotation (30 = 3 seconds per full cycle)
    bezier = "linear",
    style = "loop",    -- Continuously loops the gradient angle
})
