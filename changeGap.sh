#!/bin/bash

actualGap=$(bspc config window_gap)

operation=$1

amount=$2

case $operation in
	add)
		changedGap=$(($actualGap+$amount))
		;;		
	remove)
		changedGap=$(($actualGap-$amount))
		;;
	set)
		changedGap=$amount
		;;
	*)
		;;
esac

bspc config window_gap $changedGap

echo -e "Window gaps changed to: $changedGap"
