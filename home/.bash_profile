try_source() {
  if [ -f $* ]; then source $*; fi
}

try_source ~/.bash/env.bash

# Add local bin directories to PATH.
[ -d $HOME/.bin ] && PATH="$PATH:$HOME/.bin"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"

try_source ~/.bashrc

export PATH

unset try_source
