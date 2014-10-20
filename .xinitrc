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

# Load .Xresources
xrdb -merge ~/.Xresources

# Set keyboard to Spanish
setxkbmap es

# Start Openbox
exec openbox-session

