#!/bin/sh
pkill polybar
polybar --config=$HOME/.config/polybar/main top &
polybar --config=$HOME/.config/polybar/main bottom &
