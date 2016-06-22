# danirod's bashrc. Partially based on the default bashrc from Ubuntu.
# Tweaked, hacked and modified to suit my needs. You are free to use
# this file on your computer, to take any snippet you want, or to
# study this code and get inspired.


#######################################################################
# ORIGINAL .bashrc FILE
#######################################################################
# I've kept the snippets I considered useful to me. I took the time
# to comment them so that I can know what do they actually do.
#######################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History operations: modify the way command history is stored.
HISTCONTROL=ignoreboth      # don't put duplicate lines on history
shopt -s histappend         # append to history instead of overwriting
HISTSIZE=1000               # max number of commands to save in history
HISTFILESIZE=2000           # max number of lines in history file

# Re-evaluate window size after each command. Useful on X terminals
shopt -s checkwinsize

# Enable lesspipe for less-ing non plain-text files such as .pdf, .tar...
# (TIL you can use this command to read .pdf files right in your term!)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying chroot. When doing a chroot in a Debian-based
# system, a control file will be set in /etc/debian_chroot to identify
# the subfolder we are using as root. This snippet will detect this
# file and assign it to $debian_chroot var. This way, we will be able
# to print in PS1 some text in case we are on a chrooted system.
# Source: http://unix.stackexchange.com/q/3171
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Programmable completition.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Enable colors if the program is available (guess so).
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#######################################################################
# MY .bashrc STARTS HERE
#######################################################################

# Alias definition
alias ll='ls -alFh'     # list files in detailed view
alias la='ls -A'        # show hidden files
alias du='du -h'        # du, don't bomb me with a lot of numbers!
alias sshx='ssh -X'     # ssh with X11 redirection (I use this A LOT)

# Define some color constants
  RESET='\[\e[0;0m\]'
  WHITE='\[\e[0;37m\]'
 YELLOW='\[\e[0;33m\]'
   CYAN='\[\e[0;36m\]'
  GREEN='\[\e[0;32m\]'
MAGENTA='\[\e[0;35m\]'
    RED='\[\e[0;31m\]'
   BLUE='\[\e[0;34m\]'
  BLACK='\[\e[0;30m\]'
# more color constants to come... there are a f***ing lot of them.

export EDITOR=vim

#######################################################################
# COMMON FUNCTIONS
#######################################################################

# Check if command exists. Actually just runs `command -v` silently.
exists() { command -v "$1" >/dev/null 2>&1 && return 0 || return 1; }

# Echo to stderr.
echoerr() { echo $@ 1>&2; }

# Colored messages: info, success, warning, error
cm_info() { tput setaf 6; echoerr "INFO: $@"; tput sgr0; }
cm_success() { tput setaf 2; echoerr "SUCCESS: $@"; tput sgr0; }
cm_warning() { tput setaf 3; echoerr "WARNING: $@"; tput sgr0; }
cm_error() { tput setaf 1; echoerr "ERROR: $@"; tput sgr0; }

# PS1 prompt
PROMPT_COMMAND='PS1="\[\e]0;\u@\h:\w\a\]${GREEN}\w${RESET} \$ "'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
