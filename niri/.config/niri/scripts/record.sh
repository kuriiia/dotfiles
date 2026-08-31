#!/usr/bin/env bash
# Start or stop a screen recording in a number of different ways. Any of the
# case statement options can be passed in as a value. Running the script
# again while a recording is active stops that recording, regardless of
# which mode was originally used to start it.

set -o errexit
set -o pipefail
set -o nounset

MODE="${1:-region}"
PIDFILE="${XDG_RUNTIME_DIR:-/tmp}/wf-recorder.pid"
OUTPUT_DIR="$HOME/Videos/Recordings"

mkdir -p "${OUTPUT_DIR}"

# If a recording is already running, stop it and exit.
if [[ -f "${PIDFILE}" ]] && kill -0 "$(cat "${PIDFILE}")" 2>/dev/null; then
    kill -INT "$(cat "${PIDFILE}")"
    rm -f "${PIDFILE}"
    notify-send "Recording stopped" 2>/dev/null || true
    exit 0
fi

FILENAME="${OUTPUT_DIR}/Recording from $(date '+%Y-%m-%d %H-%M-%S').mp4"

case "${MODE}" in
region)
    GEOMETRY="$(slurp -d)"
    wf-recorder -g "${GEOMETRY}" -f "${FILENAME}" &
    ;;
screen)
    wf-recorder -f "${FILENAME}" &
    ;;
monitor-focused)
    OUTPUT_NAME="$(niri msg --json focused-output | jq --raw-output .name)"
    wf-recorder -o "${OUTPUT_NAME}" -f "${FILENAME}" &
    ;;
region-audio)
    GEOMETRY="$(slurp -d)"
    AUDIO_SOURCE="alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
    wf-recorder -g "${GEOMETRY}" -a "${AUDIO_SOURCE}" -f "${FILENAME}" &
    ;;
screen-audio)
    AUDIO_SOURCE="alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
    wf-recorder -a "${AUDIO_SOURCE}" -f "${FILENAME}" &
    ;;
*)
    echo "'${MODE}' is not a supported mode, aborting!" >&2
    exit 1
    ;;
esac

echo $! > "${PIDFILE}"
disown
notify-send "Recording started" "${FILENAME}" 2>/dev/null || true