#!/bin/bash

#https://github.com/elkowar/dots-of-war/tree/master

sink=$(pamixer --list-sinks | awk "/HDMI/{print \$1}")

pactl set-default-sink ${sink}
pamixer --sink ${sink} --get-volume

pactl subscribe\
    | grep --line-buffered "Event 'change' on sink "\
    | while read -r evt;
    do pamixer --sink ${sink} --get-volume | cut -d " " -f1;
    done


