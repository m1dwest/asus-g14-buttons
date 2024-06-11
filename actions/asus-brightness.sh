#!/usr/bin/env bash

re='^-?[0-9]+$'
if ! [[ $1 =~ $re ]]; then
    echo "Error: Not a number" >&2
    exit 1
fi

value=$1
max_value=$(brightnessctl max)

new_value=$(expr $(brightnessctl get) + $value)

if [ "$new_value" -lt "0" ]; then
    new_value=0
elif [ "$new_value" -gt "$max_value" ]; then
    new_value=$max_value
fi

brightnessctl set $new_value
