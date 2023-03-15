# system
alias ll='ls -alFh'
alias la='ls -A'

# dotfiles
alias dotfiles='git -C ~/.dotfiles'

# sudo
alias fuck='sudo $(history -p \!\!)'

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

# bin/rails
alias brc='bin/rails c'
alias brs='bin/rails s'
alias brd='bin/rails d'
alias brg='bin/rails g'
alias brdb='bin/rails dbconsole'

# bin/rake
alias brm='bin/rake db:migrate'
alias brr='bin/rake db:rollback'

# bundle
alias bee='bundle exec'
alias bii='bundle install'
alias boo='bundle outdated'

# git
alias gmaster='git checkout master'
alias gdevel='git checkout devel'
alias gdevelop='git checkout develop'
alias gco='git commit'
alias gcheck='git checkout'
alias gamend='git commit --amend'
alias gammend='git commit --amend'
alias gone="git branch -vv | grep gone | awk '{ print \$1 }'"

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

alias sshnk='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scpnk='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sftpnk='sftp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
