#!/bin/sh

set -e

xclip -selection clipboard -t image/png "$*"
feh "$*"
