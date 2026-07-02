-- TODO: manual review — unknown section 'listener {' on line 9
hl.config({
    general = {
        lock_cmd = "pidof hyprlock || hyprlock", -- avoid starting multiple hyprlock instances.
        unlock_cmd = "pkill -USR1 hyprlock", -- send USR1 signal to hyprlock to unlock
        before_sleep_cmd = "loginctl lock-session", -- lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on", -- to avoid having to press a key twice to turn on the display.
        inhibit_sleep = 3,
    },
})
