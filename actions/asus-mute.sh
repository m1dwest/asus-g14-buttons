#!/usr/bin/env bash

source $(dirname $0)/utils.sh

function apply() {
    if [ "$1" == "true" ]; then
        local status="yes"
    elif [ "$1" == "false" ]; then
        local status="no"
    elif [ "$1" == "toggle" ]; then
        local status=$(sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $NF}')
        if [ "$status" == "no" ]; then
            status="yes"
        else
            status="no"
        fi
    else
        echo "Error: Not a valid argument. Supported arguments are: true, false, toggle"
        exit 1
    fi

    sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-mute @DEFAULT_SINK@ $status
}

arg=$1
is_notify=$2

apply $arg

if [ "$is_notify" == "true" ]; then
fi
