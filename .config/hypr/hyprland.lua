-- Core Hyprland Configuration
require("core.binds")
require("core.decoration")
require("core.environment")
require("core.input")
require("core.layout")
-- require("core.monitor")
require("core.misc")
require("core.startup")

-- Extra Hyprland Configuration
require("extras.cursor")
require("extras.general")
require("extras.plugins")
require("extras.rules")
require("extras.user")

require("input")
require("monitors")
require("workspaces")

-- Source: vicinae.conf — convert this file to Lua and ensure it is on Lua's package.path.
require("vicinae")

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
