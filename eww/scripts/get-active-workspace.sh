#!/bin/bash

declare -r MONITOR=$1

workspace () {
    RESULT=$(hyprctl monitors -j | jq ".[${MONITOR}] | .activeWorkspace.id")
    echo $RESULT
}

workspace
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    workspace
done
