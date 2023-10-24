#!/bin/bash

pactl set-default-sink $(pactl list sinks | grep -e 'Name:.*hdmi' | awk '{split($0, a, ": "); print a[2]}')
