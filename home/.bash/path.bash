#!/bin/sh
#
# Adds extra things to the PATH directory depending on some conditions.

# Homebrew on Apple Sillicon
[ -d /opt/homebrew/bin ] && PATH="/opt/homebrew/bin:$PATH"

# nodenv and rbenv
[ -d $HOME/.nodenv/bin ] && PATH="$PATH:$HOME/.nodenv/bin"
[ -d $HOME/.rbenv/bin ] && PATH="$PATH:$HOME/.rbenv/bin"

# Flatpak (for GNU/Linux)
[ -d /var/lib/flatpak ] && PATH="$PATH:/var/lib/flatpak/exports/bin"

# Local .bin directories
[ -d $HOME/.bin ] && PATH="$PATH:$HOME/.bin"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"

# Golang bin directory
[ -d $HOME/go/bin ] && PATH="$PATH:$HOME/go/bin"
