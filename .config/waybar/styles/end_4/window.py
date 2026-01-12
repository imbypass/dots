#!/usr/bin/env python3
import os
import socket
import sys
import json
import subprocess
import html

# Configuration
MAX_TITLE_LEN = 60

def get_hyprland_data(command):
    try:
        output = subprocess.check_output(["hyprctl", command, "-j"], text=True)
        return json.loads(output)
    except Exception:
        return {}

def print_status():
    # 1. Get Active Window
    window = get_hyprland_data("activewindow")

    # Defaults for "Desktop" state
    top_line = "Desktop"
    bottom_line = ""

    workspace = get_hyprland_data("activeworkspace")
    ws_id = workspace.get("id", "1")

    # 2. Determine State
    if window and window.get("address"):
        # CASE A: Window is active
        # Top = App Class (e.g., "org.kde.dolphin" or "Code")
        top_line = window.get("class", "Unknown")

        # Bottom = Title (e.g., "Home - Dolphin")
        title = window.get("title", "")
        if len(title) > MAX_TITLE_LEN:
            title = title[:MAX_TITLE_LEN-3]
        bottom_line = title

        if top_line == "":
            top_line = "Desktop"
            bottom_line = f"Workspace {ws_id}"
    else:
        # Match Quickshell fallback: Top="Desktop", Bottom="Workspace X"
        top_line = "Desktop"
        bottom_line = f"Workspace {ws_id}"

    # 3. Sanitize for Pango (Escape '&', '<', '>')
    top_line = html.escape(top_line)
    bottom_line = html.escape(bottom_line)

    # 4. Format with Pango Markup (Stacked)
    # <span rise> adjusts vertical alignment to stack them tighter if needed
    text = (
        f"<span size='80%' weight='400' rise='-5pt' foreground='#ffffff90'>{top_line}</span>\n"
        f"<span size='100%' weight='bold' rise='5pt'>{bottom_line}</span>"
    )

    # 5. Output JSON
    print(json.dumps({
        "text": text,
        "class": "custom-window",
        "tooltip": f"{bottom_line}"
    }), flush=True)

# Initial Run
print_status()

# Listen to Hyprland Socket for instant updates
hypr_sig = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
if not hypr_sig:
    sys.exit(1)

socket_path = f"/tmp/hypr/{hypr_sig}/.socket2.sock"

if os.path.exists(socket_path):
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        client.connect(socket_path)
        while True:
            data = client.recv(1024).decode("utf-8", errors="ignore")
            if not data:
                break
            # Trigger on window change OR workspace change
            if "activewindow>>" in data or "workspace>>" in data:
                print_status()
