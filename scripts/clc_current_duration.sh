#!/bin/bash

TMP_DIR="/tmp/clc_status"
mkdir -p "$TMP_DIR"

CURRENT_DURATION_PATH="$TMP_DIR/current_duration"
OUTPUT=$(clockify-cli show current --duration-formatted)
STATUS=$?

if [ $STATUS -eq 0 ]; then
	echo "$OUTPUT" >"$CURRENT_DURATION_PATH"
else
	echo "" >"$CURRENT_DURATION_PATH"
fi
