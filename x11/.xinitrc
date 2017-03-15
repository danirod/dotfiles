#!/bin/sh
#
# ~/.xinitrc file. Executed by startx when starting X11.

# Source any other xinitrc files.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# If Virtual Box guest tools are installed, start them.
# I don't know what could happen if I installed VBoxGuestTools in a host.
command -v VBoxClient-all >/dev/null 2>&1 && /usr/bin/VBoxClient-all

# Load .Xresources
xrdb -merge ~/.Xresources

# Set keyboard to Spanish
setxkbmap es

command -v dropbox >/dev/null 2>&1 && dropbox start &
command -v compton >/dev/null 2>&1 && compton -b &
hsetroot -solid `appres | grep background | awk '{ print $2 }'` &
nm-applet &

exec i3
