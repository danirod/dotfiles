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
  RESET="\e[0;0m"
  WHITE="\e[0;37m"
 YELLOW="\e[0;33m"
   CYAN="\e[0;36m"
  GREEN="\e[0;32m"
MAGENTA="\e[0;35m"
    RED="\e[0;31m"
   BLUE="\e[0;34m"
  BLACK="\e[0;30m"
# more color constants to come... there are a f***ing lot of them.


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


#######################################################################
# SENSOR RELATED FUNCTIONS (e.g. battery, temperature...)
#######################################################################
# I've tried to make these functions as portable as I can. However,
# I can only test them using my own computers. I cant' guarantee
# that this will work on any computer. If a function doesn't work
# on your computer, it would be great if you could send me an issue
# about that at GitHub.
#
# Every sensor has two or three functions:
# - Function to read value from sensor (eg. battery, temperature...)
# - Function to check if PC has that sensor (eg. has_battery,
#   has_temperature...). This function should be tested before calling
#   any function related to sensors. This way, you can prevent fails
#   in case you run this code on a computer without that sensor,
#   eg, a desktop PC without battery.
# - Optionally, function that returns a value in range [0,3] depending
#   on how good or how bad is the value read by sensor. Eg: if battery
#   is full, that's good; if temperature is high, that's bad.
#
# Function that reads value MUST write value to stdout.
# Function that reads value MIGHT write error information to stderr.
# All the other functions MUST be silent, they MUST NOT write nothing
# to stdout / stderr. Instead, they should return exit codes.
#######################################################################

# Get temperature information from the sensors. Extremely useful when
# working from my laptop PC, which suffers from overheating because of
# being an HP computer.
temperature() {
    exists sensors || (cm_error "lm-sensors is required" && return 1)
    temp_cur=$(sensors | grep temp1 | awk '{print $2}')
    echo $temp_cur
}

# Check if can run temperature.
has_temperature() { exists sensors && return 0 || return 1; }

# Returns a value between 0 and 3 with the temperature status.
# 0 = good, 1 = regular, 2 = hot, 3 = critically hot.
# You can tweak the limits between each level using some constants.
temperature_level() {
    # Please, also note that while you might think these values are
    # crazy for a computer, it seems that they are typical temperatures
    # on HP computers. I already said they suffer from overheating.
    # This is why I'm not buying an HP anymore. Also, these values are
    # in ºC, as my country uses Celsius.
    MAX_GOOD=60     # below MAX_GOOD -> good.
    MAX_REGULAR=65  # below MAX_REGULAR -> regular
    MAX_HOT=70      # below MAX_HOT -> hot; above -> critical

    temp=$(temperature | cut -d. -f1 | sed 's/+//')
    if [ $temp -lt $MAX_GOOD ]; then
        return 0
    elif [ $temp -lt $MAX_REGULAR ]; then
        return 1
    elif [ $temp -lt $MAX_HOT ]; then
        return 2
    else
        return 3
    fi
}

# Get battery information. Again, this is useful when working on my
# laptop on TTY mode; which unlike graphical mode doesn't have by
# default a way for notifying you about battery level. Echoes current
# battery level and information about the power source: battery or AC.
battery() {
    # Check if the computer is actually battery powered or not.
    # If /sys/class/power_supply directory is empty, then it's not.
    # If at least a folder for AC adapter exists, then it is.
    if [ $(ls /sys/class/power_supply/ | wc -l) -eq 0 ]; then
        cm_error "Device doesn't use a battery." && return 1
    fi

    # Check if a battery is present. When a battery is plugged, a
    # directory named BAT* (e.g. BAT0, BAT1, ...) is created under
    # /sys/class/power_supply directory. I will consider a battery
    # is present if at least one directory exists.
    if [ $(ls /sys/class/power_supply/ | grep ^BAT | wc -l) -eq 0 ]; then
        # Battery not present. Power comes from AC.
        echo "NO BAT" && return 0
    fi

    # My script will use data from only one battery. If multiple
    # batteries are connected, it will only use data from the first
    # one of them.
    batnum=$(ls /sys/class/power_supply/ | grep ^BAT | head -n1)
    batdir="/sys/class/power_supply/$batnum"

    # Get the power source.
    case "$(< $batdir/status)" in
        ("Charging")    power="AC" ;; # AC
        ("Discharging") power="BT" ;; # Battery
        (*)             power="??" ;; # Unknown
    esac

    # Calculate current battery level.
    charge_now=$(< $batdir/charge_now)
    charge_max=$(< $batdir/charge_full)
    percentage=$(($charge_now * 100 / $charge_max))
    echo "${power} ${percentage}%"
}

# Returns 0 if the computer has a battery, else 1. It's always a good
# idea to test this function before doing battery-related code
has_battery() { battery > /dev/null 2>&1 && return 0 || return 1; }

# Returns a value between 0 and 3 depending on the battery percentage.
# 0 = good, 1 = regular, 2 = low, 3 = critically low
# You can tweak the limits for each value using some constants.
battery_level() {
    MAX_REGULAR=60      # above REGULAR -> good
    MAX_LOW=30          # above LOW -> regular
    MAX_CRITICAL=20     # above CRITICAL -> low; else critical
    
    has_battery || return 0 # check if the computer has a battery

    batlevel=$(battery | awk '{ print $2 }' | sed 's/%//')
    if [[ $batlevel == "BAT" || $batlevel -ge $MAX_REGULAR ]]; then
        return 0
    elif [ $batlevel -ge $MAX_LOW ]; then
        return 1
    elif [ $batlevel -ge $MAX_CRITICAL ]; then
        return 2
    else
        return 3
    fi
}


#######################################################################
# GIT RELATED FUNCTIONS
#######################################################################

# Am I inside a Git repository, or not? Returns 0 if PWD is inside
# a Git repository. Else returns 1, or if Git isn't even installed.
git_is_repo() {
    exists git || return 1 # git has to be installed
    git status > /dev/null 2>&1 && return 0 || return 1;
}

# Get current commit reference. If the current commit is a branch tip,
# this function will echo the name of the branch. Else, it will echo
# the short ID for this commit. If not a repository, will return 1.
git_current_commit() {
    git_is_repo || return 1
    # If on a local branch, git symbolic-ref HEAD will return the name
    # of the branch; we just have to cut out "refs/heads/" to get the
    # actual name of the local branch.
    #
    # Else (git symbolic-ref would fail), just get the current commit ID.
    echo $( (git symbolic-ref -q HEAD || git rev-parse -q --short HEAD) \
        | sed 's#refs/heads/##')
}

# Checks if there are changes on the working directory that weren't commited.
# Will return 1 if not a valid Git repository or if no changes.
# Else, if there are some uncommited changes, will return 0.
git_is_dirty() {
    git_is_repo || return 1
    # If status says the working directory has changes, it's dirty.
    test $(git status --porcelain | wc -l) -ne 0 && return 0 || return 1
}

# This function maps a number in range [0,3] to a color.
# It's designed to work with those functions that some sensors had,
# that returned a value in the range [0,3] where 0 meant that the value
# was good and 3 meant that the value was bad.
set_level_color() {
    case "$1" in
        0) echo -en "$GREEN";;
        1) echo -en "$YELLOW";;
        2) echo -en "$RED";;
        3) echo -en "$PURPLE";;
        *) echo -en "$RESET";;
    esac
    if [[ $1 -ge 0 && $1 -le 3 ]]; then return 0; else return 1; fi
}

# Combine sensor level functions with set_level_color
battery_color() { has_battery && (battery_level; set_level_color $?); }
temperature_color() {
    has_temperature && (temperature_level; set_level_color $?);
}


#######################################################################
# PIMP MY PS1
#######################################################################
# Pimp my PS1. Will display useful things at the PS1 prompt. Watch out,
# what I call useful things might not be so useful to other people.
# I want to display battery level, temperature value and if I'm working
# on a Git repository, I want to display where is HEAD and if working
# directory is dirty.
#######################################################################

# PS1 output is splitted in subroutines.
# Each subroutine produces an output.
# PS1 concatenates all of them.
ps1_battery() { has_battery && echo -en "$(battery) "; }
ps1_temperature() { has_temperature && echo -en "$(temperature) "; }
ps1_commit() { git_is_repo && echo " $(git_current_commit)"; }
ps1_dirtywd() { git_is_repo && git_is_dirty && echo -e "${RED}*${RESET}"; }

# PS1 format: [battery|temperature user@host:dir (git status)] $
PS1="[\[\$(battery_color)\]\$(ps1_battery)\[$RESET\]"
PS1="${PS1}\[\$(temperature_color)\]\$(ps1_temperature)\[$RESET\]"
PS1="${PS1}\[$BLUE\]\u\[$RESET\]@\[$CYAN\]\h\[$RESET\]"
PS1="${PS1}:\[$YELLOW\]\W\[$RESET\]"
PS1="${PS1}\$(ps1_commit)\[\$(ps1_dirtywd)\]"
PS1="${PS1}] \$ "

