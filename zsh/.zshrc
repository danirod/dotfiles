# danirod's .zshrc file
# These settings power my terminal.

# Oh my ZSH configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git brew bundler osx rails ruby rvm)
source $ZSH/oh-my-zsh.sh

# Home settings
export NVM_HOME=$HOME/.nvm
export RVM_HOME=$HOME/.rvm
export ANDROID_HOME=$HOME/Library/Android/sdk

# Racer
export RUST_SRC_PATH=/usr/local/src/rustc/src

# Set up PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
if [ -d $HOME/.bin ]; then export PATH="$HOME/.bin:$PATH"; fi
if [ -d $HOME/.cargo/bin ]; then export PATH="$HOME/.cargo/bin:$PATH"; fi

export LANG=es_ES.UTF-8
export EDITOR=vim

# Some applications like to set up their autostart scripts.
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
[ -f $NVM_HOME/nvm.sh ] && source $NVM_HOME/nvm.sh
[ -f $RVM_HOME ] && source $RVM_HOME/scripts/rvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
