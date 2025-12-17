#!/bin/sh

recording_active() {
    pgrep -x gpu-screen.* >/dev/null || pgrep -x wl-screenrec >/dev/null || pgrep -x wf-recorder >/dev/null
}

menu_cmd() {
  # walker -kHn --dmenu -t omarchy-default --width 285 --minheight 1 --maxheight 600
  vicinae dmenu --no-quick-look -p "Select Option"
}

if recording_active; then
    CHOSEN=$(printf "Stop Recording\nStart Recording" | menu_cmd)
else
    CHOSEN=$(printf "Start Recording\nStop Recording" | menu_cmd)
fi



case "$CHOSEN" in
    "Start Recording") harmony-record start ;;
    "Stop Recording") harmony-record stop ;;
    *) exit 1 ;;
esac
