-- Vicinae Main Window
-- TODO: manual review — 'unbind = SUPER, Space'. In Lua, capture the result of hl.bind(...) and call :remove(). See hl.meta.lua.
hl.bind("SUPER + Space", hl.dsp.exec_cmd("vicinae toggle"), { dont_inhibit = true, description = "Open Launcher" })

-- Clipboard History
-- TODO: manual review — 'unbind = SUPER, V'. In Lua, capture the result of hl.bind(...) and call :remove(). See hl.meta.lua.
hl.bind("SUPER + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"), { dont_inhibit = true, description = "Show clipboard history" })

-- Emoji Picker
-- TODO: manual review — 'unbind = SUPER, Period'. In Lua, capture the result of hl.bind(...) and call :remove(). See hl.meta.lua.
hl.bind("SUPER + Period", hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"), { dont_inhibit = true, description = "Show emoji picker" })

-- Window Picker
-- TODO: manual review — 'unbind = SUPER, Escape'. In Lua, capture the result of hl.bind(...) and call :remove(). See hl.meta.lua.
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("vicinae vicinae://launch/wm/switch-windows"), { dont_inhibit = true, description = "Switch windows" })

-- Hyprland Keybinds List
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd("fish -c omarchy-menu-keybindings"), { dont_inhibit = true, description = "Open Keybindings Menu" })

-- Screen Recording Picker
hl.bind("SUPER + ALT + Backslash", hl.dsp.exec_cmd("fish -c ~/.config/walker/scripts/record_screen.sh"), { dont_inhibit = true, description = "Open Screen Recording Menu" })

-- Wallpaper Picker
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("fish -c ~/.config/walker/scripts/wallpaper_picker.sh"), { dont_inhibit = true, description = "Open Wallpaper Picker" })

-- Theme Picker
hl.bind("SUPER + ALT + T", hl.dsp.exec_cmd("fish -c ~/.config/walker/scripts/theme_picker.sh"), { dont_inhibit = true, description = "Open Theme Picker Menu" })

-- Help Documents Picker
hl.bind("SUPER + ALT + J", hl.dsp.exec_cmd("vicinae vicinae://launch/@ozer-01/store.vicinae.aria2-manager/index"), { dont_inhibit = true, description = "Open Download Manager" })

-- SteamRIP Picker
hl.bind("SUPER + ALT + H", hl.dsp.exec_cmd("fish -c ~/.local/bin/snippets-menu"), { dont_inhibit = true, description = "Open Help Docs Menu" })
hl.bind("SUPER + ALT + Space", hl.dsp.exec_cmd("fish -c ~/.local/bin/snippets-menu"), { dont_inhibit = true, description = "Open Help Docs Menu" })

-- GameBounty Tool
hl.bind("SUPER + ALT + G", hl.dsp.exec_cmd("fish -c gb-helper"), { dont_inhibit = true, description = "Open GameBounty Helper Tool" })


-- Disable animations for Vicinae
hl.layer_rule({
    name = "vicinae-rules",
    match = { namespace = "vicinae" },
    no_anim = true,
})
