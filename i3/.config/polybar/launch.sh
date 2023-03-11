#!/bin/sh
pkill polybar

MAIN=$(polybar -m | grep primary | cut -d: -f1)
AUX=$(polybar -m | grep -v primary | cut -d: -f1)

MONITOR=$MAIN polybar --config=$HOME/.config/polybar/main.ini main &
for aux in $AUX; do
	MONITOR=$aux polybar --config=$HOME/.config/polybar/main.ini aux &
done
