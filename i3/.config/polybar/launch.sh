#!/bin/sh
pkill polybar

MAIN=$(polybar -m | grep primary | cut -d: -f1)
AUX=$(polybar -m | grep -v primary | cut -d: -f1)

export PROFILE=$HOME/.config/polybar/$HOSTNAME.ini
export HOSTNAME

if ! [ -f $PROFILE ]; then
	echo "This machine does not have a valid profile for polybar"
	notify-send "This machine does not have a valid profile for polybar"
	exit 1
fi

MONITOR=$MAIN polybar --config=$PROFILE main &
for aux in $AUX; do
	MONITOR=$aux polybar --config=$PROFILE aux &
done
