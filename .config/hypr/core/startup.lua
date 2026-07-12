-- Setup XDG
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 3 && /usr/bin/mpv --no-video --volume=50 /usr/share/sounds/startup.wav 2>/dev/null")

    -- ESSENTIAL INIT
    hl.exec_cmd("~/.local/share/harmony/bin/harmony-initialize xdg")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("~/.local/share/harmony/bin/harmony-initialize wp")

    -- QOL INIT
    hl.exec_cmd("hypridle")
    hl.exec_cmd("udiskie -an &")
    hl.exec_cmd("mpd > ~/.logs/mpd.log &")
    hl.exec_cmd("wl-clip-persist --clipboard both &")

    -- TRAY INDICATORS
    hl.exec_cmd("kdeconnectd &")
    hl.exec_cmd("kdeconnect-indicator &")
    hl.exec_cmd("jamesdsp --tray &")
    hl.exec_cmd("nm-applet &")

    -- POPUPS
    hl.exec_cmd("vicinae server &")
    hl.exec_cmd("mako &")
    hl.exec_cmd("swayosd-server &")

    -- INTERFACE
    hl.exec_cmd("sleep 3 && ~/.local/share/harmony/bin/harmony-reload waybar &")
    -- hl.exec_cmd("~/.local/bin/mxw-low-battery-alert &")
    hl.exec_cmd("ignis init &")

    -- APPLICATIONS
    hl.exec_cmd("sleep 3 && fish -c arrpc &")
    hl.exec_cmd("sleep 4 && hyprctl dispatch 'hl.dsp.exec_cmd(\"harmony-reload vicinae\")'")
    hl.exec_cmd("sleep 6 && vesktop &")
    hl.exec_cmd("sleep 10 && steam &")
    hl.exec_cmd("~/.local/bin/audio-fix &")
end)
