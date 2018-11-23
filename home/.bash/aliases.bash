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

# Homebrew for macOS
# TODO: Disable these aliases on Linux (or get Linuxbrew, whatever)
alias brew_install='brew bundle --global' # installs software in brewfile
alias brew_check='brew bundle check --global' # checks
alias brew_cleanable='brew bundle cleanup --global' # lists software to remove
alias brew_clean='brew bundle cleanup --global --force' # removes
