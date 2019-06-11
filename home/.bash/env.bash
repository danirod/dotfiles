export EDITOR=nvim
export PAGER=less
export LANG=en_US.UTF-8
export BROWSER=dillo

# /usr/bin/open will be present on macOS
if [ -x /usr/bin/open ]; then
  export BROWSER=open
fi

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/config
