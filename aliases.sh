alias btf="bluetoothctl connect 1C:52:16:DD:2A:E0; sleep .5; pactl set-default-sink bluez_sink.1C_52_16_DD_2A_E0.a2dp_sink"

alias btc="bluetoothctl connect EB:ED:7F:50:1B:AA; sleep .5; pactl set-default-sink bluez_sink.EB_ED_7F_50_1B_AA.a2dp_sink"

alias btd="bluetoothctl disconnect"

# Development

alias mssh="ssh -i $HOME/dev/mandacaru/docs/vinci-api-key.pem ec2-user@ec2-18-228-126-185.sa-east-1.compute.amazonaws.com"

# EyesOn API and WEB
alias api_m="cd $HOME/dev/mandacaru/api; . ./venv/activate; flask run"
alias web_m="cd $HOME/dev/mandacaru/web; pnpm dev"