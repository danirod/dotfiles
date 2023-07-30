#!/bin/sh

function menu() {
    for arg in "$@"; do echo $arg; done | rofi -dmenu -i -theme ~/.config/rofi/confirm.rasi -theme-str "listview { lines: $#; }" -hover-select -me-select-entry '' -me-accept-entry MousePrimary
}

chosen=$(menu margin scrot scrot-region screenlayout)
case "$chosen" in
    margin)
        i3-msg "gaps right current toggle 400"
        ;;
    scrot)
        scrot "$HOME/images/screenshots/%Y%m%d-%H%M%S.png" -e '~/.config/rofi/screenshot.sh $f'
        ;;
    scrot-region)
        sleep 1
        scrot -s "$HOME/images/screenshots/%Y%m%d-%H%M%S.png" -e '~/.config/rofi/screenshot.sh $f'
        ;;
    screenlayout)
        chosen=$(menu $(ls $HOME/.screenlayout))
        bash $HOME/.screenlayout/$chosen
esac
