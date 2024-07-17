#!/bin/bash

notify-send "Clockify" "Fetching current"

CMD=$(clockify-cli show current --json 2>&1)
STATUS=$?

if [ $STATUS -eq 1 ]; then
	notify-send "Clockify" "No running entry."
else
	DESCRIPTION=$(echo $CMD | jq -r '.[0].description')
	notify-send "Clockify" "Current entry\n$DESCRIPTION"
fi
