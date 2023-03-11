#!/bin/sh

exec rofi -show drun -modes "drun,window" \
    -theme $HOME/.config/rofi/apps.rasi \
    -hover-select -me-select-entry '' -me-accept-entry MousePrimary