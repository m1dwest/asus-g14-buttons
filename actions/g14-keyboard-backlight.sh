#!/usr/bin/env bash

if [ "$1" == "prev" ]; then
    step=-1
elif [ "$1"  == "next" ]; then
    step=1
else
    echo "Error: Not a valid argument. Supported arguments are: prev, next"
    exit 1
fi

modes=( "off" "low" "med" "high" )
current_mode=$(asusctl -k | grep "Current keyboard led brightness:" | awk '{print tolower($NF)}')

for i in "${!modes[@]}"; do
    if [ "${modes[$i]}" == "$current_mode" ]; then
        current_mode_i=$i
        break
    fi
done

next_mode_i=$( expr $current_mode_i + $step )

if [ "$next_mode_i" -ge "0" ] && [ "$next_mode_i" -lt "${#modes[@]}" ]; then
    asusctl -k ${modes[${next_mode_i}]}
fi
