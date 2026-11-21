hl.on("hyprland.start", function()

    -- STARTUP SOUND
    hl.exec_cmd("sleep 3 && /usr/bin/mpv --no-video --volume=150 /home/bypass/.local/share/startup.mp3 2>/dev/null")

    -- ESSENTIAL INIT
    hl.exec_cmd("~/.local/bin/keyring-unlock.sh")
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

    -- FREE CLAUDE
    hl.exec_cmd("~/.local/bin/fcc-server &")

    -- POPUPS
    hl.exec_cmd("mako &")

    -- INTERFACE
    hl.exec_cmd("sleep 3 && fish -c \"~/.local/share/harmony/bin/harmony-reload waybar &\"")
    hl.exec_cmd("~/.local/bin/audio-fix &")

    -- LAUNCHER
    hl.exec_cmd("vicinae server &")
    hl.exec_cmd("sleep 4 && hyprctl dispatch 'hl.dsp.exec_cmd(\"harmony-reload vicinae\")'")

    -- APPLICATIONS
    hl.exec_cmd("sleep 6 && steam -silent &")
    hl.exec_cmd("sleep 6 && spotifast --start-hidden &")
    hl.exec_cmd("sleep 6 && /home/bypass/.local/bin/launch-webapp \"https://discord.com/app\" &")

    -- BACKGROUND SERVICES
    hl.exec_cmd("sleep 6 && /home/bypass/Applications/openmouse_bridge.appimage")
    hl.exec_cmd("sleep 7 && /home/bypass/.local/bin/Wooting.Background.Service_0.5.0_amd64.AppImage")

end)
