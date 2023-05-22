#!/bin/bash

calendar_window=$(eww windows | grep "calendar_$1" | cut -c1)
echo "${calendar_window}"

if [ "${calendar_window}" = "*" ]; then
    eww close "calendar_$1"
else
    eww open "calendar_$1"
fi
