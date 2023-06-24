#!/bin/sh

Clock() {
	DATETIME=$(date "+%a %b %d, %T")

	printf "$DATETIME"
}

while true; do
	echo "%{c}%{F#FFFF00}%{B#0000FF} $(Clock) %{F-}%{B-}"
	sleep 1
done
