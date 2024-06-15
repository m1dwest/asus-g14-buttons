#!/usr/bin/env bash

source $(dirname $0)/utils.sh

function apply() {
    sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ $value%
}

value=$1

check_if_signed_number $value
apply $value

if [ "$is_notify" == "true" ]; then
fi
