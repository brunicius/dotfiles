DEVICE_NAME=$(bluetoothctl info $DEVICE_MAC | grep "Name: " | awk -F "Name: " '{print $2}')
BATTERY_LEVEL=$(bluetoothctl info | grep "Battery Percentage" | grep -oP '(?<=\()(.*?)(?=\))')

notify-send "$DEVICE_NAME" "Battery Level: $BATTERY_LEVEL%"
