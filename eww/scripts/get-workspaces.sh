#!/bin/bash

MONITOR=$1
declare -r MONITOR_NAME=$(hyprctl monitors -j | jq ".[${MONITOR}] | .name")

spaces (){
    WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq "sort_by(.id) | .[] | select(.monitor==${MONITOR_NAME}) | .id | tostring" | jq -s)
    echo $WORKSPACE_WINDOWS
}

spaces
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
	spaces
done
