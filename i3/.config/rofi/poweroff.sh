#!/bin/sh

cd "$(dirname $0)"

POWEROFF=""
REBOOT=""
SUSPEND=""
LOCK=""
LOGOUT=""

powermenu_options() {
    echo -en "$POWEROFF\0meta\x1fpoweroff power off shutdown\n"
    echo -en "$REBOOT\0meta\x1freboot restart\n"
    echo -en "$SUSPEND\0meta\x1fsuspend sleep\n"
    echo -en "$LOCK\0meta\x1flock\n"
    echo -en "$LOGOUT\0meta\x1flogout log out\n"
}

assert_confirm() {
    if ! ./confirm.sh ; then
        exit 1
    fi
}

powermenu() {
    powermenu_options | rofi -dmenu -i -theme ~/.config/rofi/poweroff.rasi -hover-select -me-select-entry '' -me-accept-entry MousePrimary
}

main() {
    chosen=$(powermenu)
    case "$chosen" in
        $POWEROFF)
            assert_confirm
            systemctl poweroff
            ;;
        $REBOOT)
            assert_confirm
            systemctl reboot
            ;;
        $SUSPEND)
            systemctl suspend
            i3lock-fancy-multimonitor -n -p
            ;;
        $LOCK)
            i3lock-fancy-multimonitor -n -p
            ;;
        $LOGOUT)
            assert_confirm
            i3-msg exit
            ;;
    esac
}

main