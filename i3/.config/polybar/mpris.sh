#!/bin/bash

if ! command -v playerctl >/dev/null 2>&1; then
	echo " playerctl missing"
	exit 0
fi

STATUS=$(playerctl status -s)
if [ "$?" -eq 0 ]; then
	if [[ "$STATUS" == "Playing" ]]; then
		echo -n "󰐊 "
	else
		echo -n "󰏤 "
	fi
else
	exit 0
fi

OUTPUT=$(playerctl metadata -f '{{title}} - {{artist}}')
if [ "$?" -eq 0 ]; then
	echo "$OUTPUT"
fi
