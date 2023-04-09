#!/bin/sh

COUNT=3
MARGIN="margin"
SCROT="scrot"
SCROT_REGION="scrot-region"
options="$MARGIN\n$SCROT\n$SCROT_REGION"
chosen=$(echo -en "$options" | rofi -dmenu -i -theme ~/.config/rofi/confirm.rasi -theme-str "listview { lines: $COUNT; }" -hover-select -me-select-entry '' -me-accept-entry MousePrimary)
case "$chosen" in
    $MARGIN)
        i3-msg "gaps right current toggle 400"
        ;;
    $SCROT)
        scrot "$HOME/images/screenshots/%Y%m%d-%H%M%S.png" -e '~/.config/rofi/screenshot.sh $f'
        ;;
    $SCROT_REGION)
        scrot -s "$HOME/images/screenshots/%Y%m%d-%H%M%S.png" -e '~/.config/rofi/screenshot.sh $f'
        ;;
esac
