#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 0
fi

function delete_anything() {
    local anything_path="/etc/acpi/events/anything"

    if [ -f "$anything_path" ]; then
        read -p "The file /etc/acpi/events/anything and all related scripts will be deleted. Are you sure? [y/N] " yn
        if ! [[ $yn =~ ^[yY]+$ ]]; then
            exit 0;
        fi
        echo -e

        local anything_script_path=$(cat "$anything_path" | grep "action=" | awk '{ sub(/action=/,""); print $1; }')
        echo "Files that will be deleted:"
        echo "$anything_path"
        if [ -n "$anything_script_path" ]; then
            echo "$anything_script_path"
        fi

        read -p "Proceed? [y/N] " yn
        if ! [[ $yn =~ ^[yY]+$ ]]; then
            exit 0;
        fi
        rm -f $anything_path
        rm -f $anything_script_path
        echo -e
    fi    
}

function copy_files() {
    local dst_path="/etc/acpi"

    cd $(dirname $0)

    echo "Copying files..."
    echo "Copying $(pwd)/actions -> ${dst_path}/actions"
    cp -r actions "$dst_path"
    echo "Copying $(pwd)/events -> ${dst_path}/events"
    cp -r events "$dst_path"
}

delete_anything
copy_files

echo "Restarting acpid.service service..."
systemctl restart acpid.service
