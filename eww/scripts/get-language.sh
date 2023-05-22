#!/bin/bash

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' '/^activelayout>>/{print $3}' | stdbuf -o0 cut -c 1-2

