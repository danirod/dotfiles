[ -d $HOME/.nodenv/bin ] && PATH="$PATH:$HOME/.nodenv/bin"
[ -d $HOME/.rbenv/bin ] && PATH="$PATH:$HOME/.rbenv/bin"
[ -d $HOME/.goenv/bin ] && PATH="$PATH:$HOME/.goenv/bin"
source ~/.bash/env.bash

export FLATPAK_ROOT=/var/lib/flatpak

# Add local bin directories to PATH.
[ -d $HOME/.bin ] && PATH="$PATH:$HOME/.bin"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"
[ -d $FLATPAK_ROOT ] && PATH="$PATH:$FLATPAK_ROOT/exports/bin"

source ~/.bashrc

export PATH

unset try_source
