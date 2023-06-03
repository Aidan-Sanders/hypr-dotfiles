#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
    echo "Usage: $0 <directory containing images>"
    exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=30
export SWWW_TRANSITION_STEP=30

images=()
while IFS= read -r -d '' img; do
  if file -b --mime-type "$img" | grep -q '^image/'; then
    images+=("$img")
  else
    echo "Error: Failed to detect the image format: $img"
  fi
done < <(find "$1" -type f -print0)

if [[ ${#images[@]} -gt 0 ]]; then
  selected="${images[RANDOM % ${#images[@]}]}"
  swww img "$selected" --transition-type any
  echo "$selected"
else
  echo "No valid images found in the directory: $1"
fi

