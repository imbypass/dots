#!/bin/bash

if pgrep -x gpu-screen.* >/dev/null || pgrep -x wl-screenrec >/dev/null || pgrep -x wf-recorder >/dev/null; then
    echo '{"text": "󰝤", "tooltip": "Stop recording", "class": "active"}'
else
    echo '{"text": ""}'
fi
