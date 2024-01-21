#!/bin/sh

# Force i3-sensible-terminal to use alacritty.
# (But still use i3-sensible terminal ;-) ...)
export TERMINAL=alacritty

xrdb -merge ~/.Xresources

case $HOSTNAME in
	archstation.local)
		xrandr --output DP-4 --primary --left-of DP-0
		;;
esac

# gnome-keyring-daemon is managed by systemd, use the SSH socket from GCR
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# Wallpaper and background
if [ -f .dotfiles/wallpaper ]; then
	hsetroot -extend .dotfiles/wallpaper
else
	hsetroot -solid '#000000'
fi

source $HOME/.bash_profile

exec i3
