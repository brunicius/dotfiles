#!/bin/bash

notify-send "Clockify" "Cloning last"

CMD=$(clockify-cli clone last -i=0 --json)
STATUS=$?

if [ $STATUS -eq 0 ]; then
	DESCRIPTION=$(echo $CMD | jq '.[0].description' -r)
	notify-send "Clockify" "Started\n$DESCRIPTION"
fi
