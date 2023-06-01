#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
    echo "Usage: $0 <directory containing images>"
    exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=30
export SWWW_TRANSITION_STEP=30

# This controls (in seconds) when to switch to the next image
INTERVAL=10

while true; do
    find "$1" -type f -print0 | while IFS= read -r -d '' img; do
        if file -b --mime-type "$img" | grep -q '^image/'; then
            swww img "$img" --transition-type any
            echo "$img"
        else
            echo "Error: Failed to detect the image format: $img"
        fi
        sleep $INTERVAL
    done
done