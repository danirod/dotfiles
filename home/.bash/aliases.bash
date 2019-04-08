# system
alias ll='ls -alFh'
alias la='ls -A'
alias vim='nvim'

# sudo
alias fuck='sudo $(history -p \!\!)'

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

# vagrant
alias vup='vagrant up'
alias vdown='vagrant halt'
alias vsus='vagrant suspend'
alias vsh='vagrant ssh'
alias vrs='vagrant rsync'
alias vauto='vagrant rsync-auto'

# git
alias gmaster='git checkout master'
alias gdevel='git checkout devel'
alias gdevelop='git checkout develop'
alias gco='git commit'
alias gcheck='git checkout'
alias gamend='git commit --amend'
alias gammend='git commit --amend'

# Homebrew for macOS
# TODO: Disable these aliases on Linux (or get Linuxbrew, whatever)
alias brew_install='brew bundle --global' # installs software in brewfile
alias brew_check='brew bundle check --global' # checks
alias brew_cleanable='brew bundle cleanup --global' # lists software to remove
alias brew_clean='brew bundle cleanup --global --force' # removes

# Internet radio
alias kfma="mpg123 -@ http://playerservices.streamtheworld.com/pls/KFMAFM.pls"
alias megastar="mpg123 -@ http://megastar.cope.stream.flumotion.com/cope/megastar-low.mp3.m3u"
alias rockfm="mpg123 -@ http://rockfm.cope.stream.flumotion.com/cope/rockfm-low.mp3.m3u"
alias cadenaser="mpg123 http://playerservices.streamtheworld.com/api/livestream-redirect/CADENASER.mp3"
alias 40principales="mpg123 http://playerservices.streamtheworld.com/api/livestream-redirect/Los40.mp3"
alias los40classic="mpg123 http://playerservices.streamtheworld.com/api/livestream-redirect/M80RADIO.mp3"

# TaskWarior GTD
# ==============

# Faster TaskWarrior access (TODO: What about timewarrior?)
alias t="task"

function inbox() {
    if [ $# -eq 0 ]; then
        task inbox
    else
        task add +inbox "$@"
    fi
}

# alias inbox='task add +inbox'
alias tomorrow="inbox wait:tomorrow"
