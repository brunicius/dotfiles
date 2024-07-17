#!/bin/bash

TMP_DIR="/tmp/clc_status"
STATUS_PATH="$TMP_DIR/status"

notify-send "Clockify" "Updating status..."
sh "$(dirname "$0")/clc_status.sh" &

wait $(jobs -p)
notify-send "Clockify" "Status successfully updated."
