# Enable colors.

# Note that BSD ls (Mac) and GNU ls (Linux) have different flags for
# toggling color on command output. Therefore we have to check which
# OS are we supporting.

case `uname` in
    Darwin*)
        alias ls='ls -G'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        ;;
    Linux*)
        if [ -x /usr/bin/dircolors ]; then
            alias ls='ls --color=auto'
            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi
        ;;
esac
