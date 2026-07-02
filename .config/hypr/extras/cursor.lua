hl.env("HYPRCURSOR_THEME", "Qogir")
hl.env("XCURSOR_THEME", "Qogir")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")

hl.config({
    cursor = {
        no_hardware_cursors = true,
        sync_gsettings_theme = true,
        no_warps = true,
    },
})
