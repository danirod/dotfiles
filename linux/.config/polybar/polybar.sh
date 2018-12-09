#!/bin/sh
#
# polybar launch script
# requires: autorandr -- to read fingerprints

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

export MONITOR=$(autorandr --fingerprint | cut -d' ' -f1)
polybar top &
