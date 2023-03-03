#!/bin/bash

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

if nvim +star "$TMPFILE"; then
    < "$TMPFILE" wl-copy
fi
