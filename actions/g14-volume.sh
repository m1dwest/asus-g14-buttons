#!/usr/bin/env bash

re='^[-+]?[0-9]+$'
if ! [[ $1 =~ $re ]]; then
    echo "Error: Not a number" >&2
    exit 1
fi

sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ $1%
