#!/bin/sh

export DISPLAY=:0

if [ "$1" == "fullscreen" ]; then
	i3 -c /root/.config/i3/config-fullscreen &
elif [ "$1" == "windowed" ]; then
	openbox &
else
	echo "You need to specify a valid window manager config."
	echo "Available configs are: fullscreen, windowed"
	exit 1
fi

sleep 6

if [ "$3" != "" ]; then
	# Another DPI setting
	/scripts/dpi.sh $3
else
	# X will start in standard mode without a DPI setting
	:
fi

if [ "$2" != "" ]; then
	# Launch app/program requested by user
	# Due to a strange problem that I can't resolve, it is impossible to launch NetSurf via the standard method.
	if [ "$2" == "!netsurf" ]; then
		echo netsurf_launch > /opt/ibxd
		mkfifo /tmp/netsurf-fifo
		while true; do
			if read line < /tmp/netsurf-fifo; then
				if [[ "$line" == "stop" ]]; then
					break
				fi
			fi
		done
	else
		$2
	fi
else
	echo "You need to specify a program name."
	exit 1
fi

sleep 3
