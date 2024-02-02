#!/bin/sh

exec rofi -dpi 1 -show run \
    -theme $HOME/.config/rofi/run.rasi \
    -hover-select -me-select-entry '' -me-accept-entry MousePrimary
