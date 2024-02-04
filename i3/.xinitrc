#!/bin/sh

# Force i3-sensible-terminal to use alacritty.
# (But still use i3-sensible terminal ;-) ...)
export TERMINAL=alacritty

# Load general Xresources profile and per-computer Xresources profile
xrdb -merge ~/.Xresources
if [ -f $HOME/.xresources.d/$HOSTNAME.xresources ]; then
	xrdb -merge $HOME/.xresources.d/$HOSTNAME.xresources
fi

case $HOSTNAME in
	archstation)
		xrandr --output DP-4 --primary --left-of DP-0
		;;
esac

# gnome-keyring-daemon is managed by systemd. This variable is set here
# so that all the applications spawned from inside the graphical session
# have the variable properly set.
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# Wallpaper and background
if [ -f .dotfiles/wallpaper ]; then
	hsetroot -extend .dotfiles/wallpaper
else
	hsetroot -solid '#000000'
fi

source $HOME/.bash_profile

exec i3
