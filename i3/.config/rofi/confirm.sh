#!/bin/sh

YES="yes ฅ(^◕ᴥ◕^)ฅ"
NO="no (´-ω-\`)"
chosen=$(echo -en "$YES\n$NO" | rofi -dmenu -i -theme ~/.config/rofi/confirm.rasi -hover-select -me-select-entry '' -me-accept-entry MousePrimary)
if [ "$chosen" == "$YES" ]; then
    exit 0
else
    exit 1
fi