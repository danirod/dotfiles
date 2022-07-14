# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize histappend

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000

# TODO: What's a portable way for doing this?
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Bash completions
if ! shopt -oq posix; then
    [ -f /etc/bash_completion ] && source /etc/bash_completion
    [ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
fi

source ~/.bash/colors.bash
source ~/.bash/aliases.bash
source ~/.bash/functions.bash
source ~/.bash/prompt.bash

for f in ~/.bash/local.d/*.bash; do
    if [ -x $f ]; then . $f; fi
done

source ~/.bash/taskwarrior.bash
bash ~/.bash/applets/task.bash

