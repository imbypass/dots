#!/bin/sh

menu_cmd() {
  walker -k --dmenu
}

CHOSEN=$(printf "Disable Hyprbars\nEnable Hyprbars" | menu_cmd)

case "$CHOSEN" in
	"Enable Hyprbars") hyprpm enable hyprbars ;;
	"Disable Hyprbars") hyprpm disable hyprbars ;;
	*) exit 1 ;;
esac


