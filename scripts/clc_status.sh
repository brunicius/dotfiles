#!/bin/bash

TMP_DIR="/tmp/clc_status"
mkdir -p "$TMP_DIR"

TODAY_OUTPUT_PATH="$TMP_DIR/today"
clockify-cli report today --duration-formatted >"$TODAY_OUTPUT_PATH" &

WEEK_OUTPUT_PATH="$TMP_DIR/week"
clockify-cli report this-week --duration-formatted >"$WEEK_OUTPUT_PATH" &

MONTH_OUTPUT_PATH="$TMP_DIR/month"
clockify-cli report this-month --duration-formatted >"$MONTH_OUTPUT_PATH" &

CURRENT_ENTRY_PATH="$TMP_DIR/current_entry"
sh "$(dirname "$0")/clc_current_entry.sh" &

CURRENT_DURATION_PATH="$TMP_DIR/current_duration"
sh "$(dirname "$0")/clc_current_duration.sh" &

jobs -p
echo "Waiting for jobs done..."
wait $(jobs -p)
echo "Done, writting status."

TODAY=$(cat "$TODAY_OUTPUT_PATH")
WEEK=$(cat "$WEEK_OUTPUT_PATH")
MONTH=$(cat "$MONTH_OUTPUT_PATH")
CURRENT_ENTRY=$(cat "$CURRENT_ENTRY_PATH")
CURRENT_DURATION=$(cat "$CURRENT_DURATION_PATH")

STATUS_PATH="$TMP_DIR/status"
echo "$CURRENT_DURATION $CURRENT_ENTRY | D: $TODAY W: $WEEK M: $MONTH" >"$STATUS_PATH"
killall -SIGUSR1 i3status
