#!/bin/bash

SINK_NAME=$(pactl list sinks | grep -e 'Name:.*hdmi' | awk -F": " '{print $2}' )
SINK_DESCRIPTION=$(pactl list sinks | grep "Name: $SINK_NAME" -A 1 | tail -n 1 | awk -F": " '{print $2}')

pactl set-default-sink "$SINK_NAME"
notify-send "PulseAudio" "Using $SINK_DESCRIPTION"


