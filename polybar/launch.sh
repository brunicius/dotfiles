#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	echo "enabling monitor $m"
	MONITOR=$m polybar --config=$HOME/.config/polybar/config.ini example &
	sleep 1
  done
else
  polybar --reload example &
fi

echo "Bars launched..."
