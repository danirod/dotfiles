# Using this snippet mouse mode is enabled in Tmux.

set -g mouse on
set -g status-right "#[bg=red,fg=brightwhite] MOUSE #[bg=default,fg=default] %d/%m/%Y / %H:%M"
bind-key M source-file ~/.tmux/mouse-off.tmux
