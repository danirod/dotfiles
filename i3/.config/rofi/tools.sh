#!/bin/sh

function menu() {
    for arg in "$@"; do echo $arg; done | rofi -dpi 1 -dmenu -i -theme ~/.config/rofi/tools.rasi -theme-str "listview { lines: $#; }" -hover-select -me-select-entry '' -me-accept-entry MousePrimary
}

chosen=$(menu margin scrot scrot-region screenlayout)
case "$chosen" in
    margin)
        i3-msg "gaps right current toggle 400"
        ;;
    scrot)
        $HOME/.bin/screenshot
        ;;
    scrot-region)
        sleep 1
        $HOME/.bin/screenshot -r
        ;;
    screenlayout)
        chosen=$(menu $(ls $HOME/.screenlayout))
        bash $HOME/.screenlayout/$chosen
esac
