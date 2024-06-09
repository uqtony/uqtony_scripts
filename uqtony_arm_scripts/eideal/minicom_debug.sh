unset uqtony_selected_port

minicom_select_port() {
	ports_usb=$(ls /dev/ttyUSB*)
	ports_acm=$(ls /dev/ttyACM*)
	ports="$ports_usb $ports_acm"
	select port in $ports;
	do
		if [ "$port" ];
		then
			uqtony_selected_port="$port"
			break;
		else
			uqtony_selected_port=""
		fi
	done
}

minicom_connect() {
	sudo minicom -D "$uqtony_selected_port"
}

clear() {
	unset uqtony_selected_port
}

minicom_select_port

if [ -z "$uqtony_selected_port" ]
then
	echo "no port"
else
	echo "select $uqtony_selected_port"
	minicom_connect
fi

clear
