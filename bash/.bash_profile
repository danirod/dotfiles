# bash_profile file

[ -f ~/.bashrc ] && . ~/.bashrc

# Set up environment
[ -d $HOME/.bin ] && PATH="$HOME/.bin:$PATH"
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
