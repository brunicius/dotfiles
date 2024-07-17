#!/bin/bash

TMP_DIR="/tmp/clc_status"
mkdir -p "$TMP_DIR"

CURRENT_ENTRY_PATH="$TMP_DIR/current_entry"
OUTPUT=$(clockify-cli show current -f '{{ .Description }}')
STATUS=$?

if [ $STATUS -eq 0 ]; then
	echo "$OUTPUT" >"$CURRENT_ENTRY_PATH"
else
	echo "No current entry." >"$CURRENT_ENTRY_PATH"
fi
