#!/bin/bash

notify-send "Clockify" "Stopping"

CMD=$(clockify-cli out --json 2>&1)
STATUS=$?

if [ $STATUS -eq 1 ]; then
	notify-send "Clockify" "No running entry."
else
	DESCRIPTION=$(echo $CMD | jq -r '.[0].description')
	notify-send "Clockify" "Stopped\n$DESCRIPTION"
fi
