NETWORK_NAME=$(nmcli -t c show --active | grep 'wireless' | awk '{split($0, a, ":"); print(a[1])}')

[ -z "$NETWORK_NAME" ] && exit

nmcli c down "$NETWORK_NAME"
nmcli c up "$NETWORK_NAME"
