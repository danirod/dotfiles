#!/bin/sh

MODE=drun

while [[ $# -gt 0 ]]; do
    case $1 in
        --window)
            MODE=window
            shift
            ;;
    esac
done

exec rofi -dpi 1 -show $MODE -modes "drun,window" \
    -theme $HOME/.config/rofi/apps.rasi \
    -hover-select -me-select-entry '' -me-accept-entry MousePrimary
