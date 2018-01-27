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
    try_source /etc/bash_completion
    try_source /usr/local/etc/bash_completion
fi

try_source ~/.bash/colors.bash
try_source ~/.bash/aliases.bash
try_source ~/.bash/functions.bash
try_source ~/.bash/prompt.bash
