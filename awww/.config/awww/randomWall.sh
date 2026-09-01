#!/bin/bash
set -euo pipefail
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
image_path="$(fd . -e jpg -e jpeg -e png -e gif -e webp "$WALLPAPER_DIR" | shuf -n 1)"
awww img "$image_path" --transition-type "random"
echo "wallpaper set to $image_path"

matugen image "$image_path"
echo "theme updated"