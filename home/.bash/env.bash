export EDITOR=vim
export PAGER=less
export LANG=en_US.UTF-8

# Set the default browser.
if [ `uname` == "Darwin" ]; then
    export BROWSER=open  # macOS, use system browser
elif [ -x $(command -v firefox) ]; then
    export BROWSER=firefox  # firefox
elif [ -x $(command -v epiphany) ]; then
    export BROWSER=epiphany  # gnome web
elif [ -x $(command -v midori) ]; then
    export BROWSER=midori  # midori
elif [ -x $(command -v dillo) ]; then
    export BROWSER=dillo  # dillo
fi

# Git: diff-highlighter
if [ -x /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ]; then
	export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
elif [ -x /usr/share/git-core/contrib/diff-highlight/diff-highlight ]; then
	export PATH=$PATH:/usr/share/git-core/contrib/diff-highlight
fi

# rbenv
command -v rbenv >/dev/null && eval "$(rbenv init -)"
command -v nodenv >/dev/null && eval "$(nodenv init -)"
command -v goenv >/dev/null && eval "$(goenv init -)"

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/config

export HTTPIE_CONFIG_DIR=~/.config/httpie/
