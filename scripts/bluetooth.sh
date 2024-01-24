DEVICE_MAC="1C:52:16:DD:2A:E0"
DEVICE_NAME=$(bluetoothctl info $DEVICE_MAC | grep "Name: " | awk -F "Name: " '{print $2}')
CONNECTED=false

CONN_STATUS=$(bluetoothctl info $DEVICE_MAC | grep "Connected" | awk -F "Connected: " '{print $2}' | xargs)
if [ "$CONN_STATUS" = "yes" ]; then
	CONNECTED=true
fi

if [ "$1" = "down" ]; then
	DEVICE_NAME=$(bluetoothctl info $DEVICE_MAC | grep "Name: " | awk -F "Name: " '{print $2}')

	if [ "$CONNECTED" != true ]; then
		notify-send "$DEVICE_NAME" "Not connected, ignoring." 
	else
		notify-send "$DEVICE_NAME" "Disconnecting"
        zsh $HOME/dotfiles/scripts/hdmi.sh
		bluetoothctl disconnect $DEVICE_MAC
	fi
else
	if [ !$CONNECTED ]; then
		notify-send "$DEVICE_NAME" "Connecting"
		RESULT=$(bluetoothctl connect $DEVICE_MAC)
		if [ $? -ne 0 ]; then
			echo "a $RESULT" > $HOME/tmp/bt.log
			notify-send -u critical -t 6000 "$DEVICE_NAME" "$RESULT"
			exit
		fi

		sleep .5
	else
		notify-send "$DEVICE_NAME" "Already connected."
	fi

	BLUETOOTH_SINK=$(pactl list sinks | grep 'Name: ' | grep 'blue' | awk -F "Name: " '{print $2}' | xargs)
	pactl set-default-sink $BLUETOOTH_SINK

	notify-send "$DEVICE_NAME" "Successfully connected"
fi
