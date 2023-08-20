#!/bin/sh

YES="yes ฅ(^◕ᴥ◕^)ฅ"
NO="no (´-ω-\`)"
chosen=$(echo -en "$YES\n$NO" | rofi -dmenu -i -theme ~/.config/rofi/confirm.rasi -theme-str "listview { lines: 2; }" -hover-select -me-select-entry '' -me-accept-entry MousePrimary -selected-row 1)
if [ "$chosen" == "$YES" ]; then
    exit 0
else
    exit 1
fi
