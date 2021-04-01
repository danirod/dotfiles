# Use Spanish
setxkbmap es

# Force i3-sensible-terminal to use alacritty.
# (But still use i3-sensible terminal ;-) ...)
export TERMINAL=alacritty

xrdb -merge ~/.Xresources

hsetroot -solid '#3b4252'

exec i3
