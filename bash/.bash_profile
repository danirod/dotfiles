# bash_profile file

[ -f ~/.bashrc ] && . ~/.bashrc

# Set up environment
[ -d $HOME/.bin ] && PATH="$HOME/.bin:$PATH"
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH

