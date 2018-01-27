# Check if command exists. Actually just runs `command -v` silently.
exists() { command -v "$1" >/dev/null 2>&1 && return 0 || return 1; }

# Echo to stderr.
echoerr() { echo $@ 1>&2; }

# Colored messages: info, success, warning, error
cm_info() { tput setaf 6; echoerr "INFO: $@"; tput sgr0; }
cm_success() { tput setaf 2; echoerr "SUCCESS: $@"; tput sgr0; }
cm_warning() { tput setaf 3; echoerr "WARNING: $@"; tput sgr0; }
cm_error() { tput setaf 1; echoerr "ERROR: $@"; tput sgr0; }
