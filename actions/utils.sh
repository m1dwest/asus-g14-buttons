#!/usr/bin/env bash

function check_if_signed_number() {
    local value=$1

    re='^[-+]?[0-9]+$'
    if ! [[ $value =~ $re ]]; then
        echo "Error: Not a number" >&2
        exit 1
    fi
}

function notify() {
    local message=$1

    sudo -u midwest XDG_RUNTIME_DIR=/run/user/1000 notify-send $message
}
