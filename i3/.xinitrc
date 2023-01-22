# Use Spanish
setxkbmap es

# Force i3-sensible-terminal to use alacritty.
# (But still use i3-sensible terminal ;-) ...)
export TERMINAL=alacritty

xrdb -merge ~/.Xresources

# Current setup: DP-4 is over DP-0. Is there a better way to do this?
xrandr --output DP-4 --above DP-0

# Wallpaper and background
hsetroot -solid '#3b4252'

# gnome-keyring
export $(gnome-keyring-daemon --start)

# Dark theme
export GTK_THEME=Adwaita:dark

dunst &

exec i3
