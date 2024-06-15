#!/usr/bin/env bash

source $(dirname $0)/utils.sh

function apply() {
    local value=$1
    local max_value=$(brightnessctl max)

    local new_value=$(expr $(brightnessctl get) + $value)

    if [ "$new_value" -lt "0" ]; then
        new_value=0
    elif [ "$new_value" -gt "$max_value" ]; then
        new_value=$max_value
    fi

    brightnessctl set $new_value
}

value=$1
is_notify=$2

check_if_signed_number $value
apply $value

if [ "$is_notify" == "true" ]; then
fi
