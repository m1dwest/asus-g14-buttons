#!/usr/bin/env bash

status=$(sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $NF}')
if [ "$status" == "no" ]; then
    status="yes"
else
    status="no"
fi

sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-mute @DEFAULT_SINK@ $status
