-- Setup XDG
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 3 && /usr/bin/mpv --no-video --volume=150 /home/bypass/.local/share/startup.mp3 2>/dev/null")

    -- ESSENTIAL INIT
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("~/.local/share/harmony/bin/harmony-initialize xdg")
    hl.exec_cmd("~/.local/share/harmony/bin/harmony-initialize dbus")
    hl.exec_cmd("~/.local/share/harmony/bin/harmony-initialize wp")

    -- QOL INIT
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("udiskie -an &")
    hl.exec_cmd("mpd &")
    hl.exec_cmd("wl-clip-persist --clipboard both &")

    -- TRAY INDICATORS
    -- hl.exec_cmd("kdeconnectd &")
    -- hl.exec_cmd("kdeconnect-indicator &")
--     hl.exec_cmd("nm-applet &")

    -- POPUPS
    -- hl.exec_cmd("mako &")
    -- hl.exec_cmd("swayosd-server &")

    -- INTERFACE
    -- hl.exec_cmd("~/.local/bin/mxw-low-battery-alert &")
    -- hl.exec_cmd("sleep 8 && fish -c \"~/.local/share/harmony/bin/harmony-reload waybar &\"")

    -- LOCK SCREEN
    hl.exec_cmd("sleep .5 && hyprlock &")

    -- SHELL
    hl.exec_cmd("vicinae server &")
    hl.exec_cmd("noctalia --daemon &")
    hl.exec_cmd("ignis init &")

    -- APPLICATIONS
    hl.exec_cmd("~/.local/bin/audio-fix &")
    hl.exec_cmd("sleep 3 && fish -c arrpc &")
    hl.exec_cmd("sleep 4 && hyprctl dispatch 'hl.dsp.exec_cmd(\"harmony-reload vicinae\")'")
    hl.exec_cmd("sleep 6 && vesktop &")
    hl.exec_cmd("sleep 8 && steam -silent &")
    hl.exec_cmd("sleep 9 && ~/.local/bin/ujust hide-secondary-sidebar")
    hl.exec_cmd("MOCHI_NATIVE_WAYLAND=1 mochi &")
end)
