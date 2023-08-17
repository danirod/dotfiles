# system
alias ll='ls -alFh'
alias la='ls -A'

# dotfiles
alias dotfiles='git -C ~/.dotfiles'

# list opened ports. i call this alias planet because i always use "planet"
# to remember the arguments to pass to netstat (-plnt).
if [ `uname` == "Darwin" ]; then
    # i am unable to remember the command
    alias planet='lsof -iTCP -sTCP:LISTEN -nP'
    alias suplanet='sudo lsof -iTCP -sTCP:LISTEN -nP'
else
    alias planet='netstat -plnt'
    alias suplanet='sudo netstat -plnt'
fi

# Homebrew for macOS
GLOBAL_BREWFILE="~/Library/Brewfile"
# Install packages declared in the Brewfile
alias brew_install="brew bundle --file=$GLOBAL_BREWFILE"
# Check packages present in Brewfile but not installed
alias brew_check="brew bundle check --file=$GLOBAL_BREWFILE"
# List rogue software not declared in the Brewfile
alias brew_cleanable="brew bundle cleanup --file=$GLOBAL_BREWFILE"
# Remove software not declared in Brewfile
alias brew_clean="brew bundle cleanup --file=$GLOBAL_BREWFILE --force"

alias ssh!='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scp!='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sftp!='sftp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
