# danirod's .zshrc file
# These settings power my terminal.

# Oh my ZSH configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git brew bundler osx rails ruby rvm)
source $ZSH/oh-my-zsh.sh

# Home settings
export NVM_HOME=$HOME/.nvm
export RVM_HOME=$HOME/.rvm
export CARGO_HOME=$HOME/.cargo
export ANDROID_HOME=$HOME/Library/Android/sdk

# Racer
export RUST_SRC_PATH=/usr/local/src/rustc/src

# Set up PATH
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if [ -d $HOME/.bin ]; then export PATH="$HOME/.bin:$PATH"; fi
if [ -d $CARGO_HOME/bin ]; then export PATH="$CARGO_HOME/bin:$PATH"; fi
if [ -d $RVM_HOME/bin ]; then export PATH="$RVM_HOME/bin:$PATH"; fi
if [ -d $ANDROID_HOME ]; then export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"; fi

# Enable X11 and gpg on macOS -- TODO: Should detect platform first?
if [ -d /opt/X11 ]; then export PATH="$PATH:/opt/X11/bin"; fi
if [ -d /usr/local/MacGPG2 ]; then export PATH="$PATH:/usr/local/MacGPG2"; fi

export LANG=es_ES.UTF-8
export EDITOR=vim

# Some applications like to set up their autostart scripts.
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
[ -f $NVM_HOME/nvm.sh ] && source $NVM_HOME/nvm.sh
[ -f $RVM_HOME/scripts/rvm ] && source $RVM_HOME/scripts/rvm
