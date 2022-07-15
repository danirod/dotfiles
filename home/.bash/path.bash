#!/bin/sh
#
# Adds extra things to the PATH directory depending on some conditions.

# diff-highlighter. It is always at $SHARE/git-core/contrib/diff-highlight
if [ -x /opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight ]; then
	export PATH=$PATH:/opt/homebrew/share/git-core/contrib/diff-highlight
elif [ -x /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ]; then
	export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
elif [ -x /usr/share/git-core/contrib/diff-highlight/diff-highlight ]; then
	export PATH=$PATH:/usr/share/git-core/contrib/diff-highlight
fi

# nodenv, rbenv, goenv, pyenv...
[ -d $HOME/.nodenv/bin ] && PATH="$PATH:$HOME/.nodenv/bin"
[ -d $HOME/.rbenv/bin ] && PATH="$PATH:$HOME/.rbenv/bin"
[ -d $HOME/.goenv/bin ] && PATH="$PATH:$HOME/.goenv/bin"
[ -d $HOME/.pyenv/bin ] && PATH="$PATH:$HOME/.pyenv/bin"

# Flatpak (for GNU/Linux)
[ -d /var/lib/flatpak ] && PATH="$PATH:/var/lib/flatpak/exports/bin"

# Local .bin directories
[ -d $HOME/.bin ] && PATH="$PATH:$HOME/.bin"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"
