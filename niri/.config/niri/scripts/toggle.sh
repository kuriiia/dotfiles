#!/bin/sh
# Toggle an app: close it if its window exists, otherwise launch it.
#
# usage: toggle.sh <app_id> [command [args...]]
#   toggle.sh btop                          # runs: kitty --class btop btop
#   toggle.sh firefox firefox               # any command
#   toggle.sh notes kitty --class notes nvim notes.md

if [ $# -lt 1 ]; then
    echo "usage: ${0##*/} <app_id> [command [args...]]" >&2
    exit 1
fi

app=$1; shift
[ $# -eq 0 ] && set -- kitty --class "$app" "$app"

ids=$(niri msg -j windows | jq -r --arg a "$app" '.[] | select(.app_id == $a) | .id')

if [ -n "$ids" ]; then
    for id in $ids; do
        niri msg action close-window --id "$id"
    done
else
    exec "$@"
fi
