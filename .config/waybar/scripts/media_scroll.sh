#!/bin/bash

max_length=30
title="$(playerctl metadata artist 2>/dev/null) - $(playerctl metadata title 2>/dev/null)"
len=${#title}

if [ -z "$title" ]; then
	echo "No Track Playing"
	exit 0
fi

pos=$(( $(date +%s) % (len + 1) ))
scroll="${title:pos:max_length}"

if [ ${#scroll} -lt $max_length ]; then
	scroll="$scroll ${title:0:$((max_length - ${#scroll}))}"
fi

echo "$scroll"
