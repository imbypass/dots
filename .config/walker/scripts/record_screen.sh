#!/bin/sh

menu_cmd() {
  walker -kHn --dmenu -t omarchy-default --width 285 --minheight 1 --maxheight 600
}

CHOSEN=$(printf "Start Recording\nStop Recording" | menu_cmd)

case "$CHOSEN" in
    "Start Recording") harmony-record start ;;
    "Stop Recording") harmony-record stop ;;
    *) exit 1 ;;
esac
