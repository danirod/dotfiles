#!/bin/sh
pkill polybar
polybar --config=$HOME/.config/polybar/main left &
polybar --config=$HOME/.config/polybar/main right &
