# danirod's dotfiles

## About

These dotfiles contain the current configuration of my supported machines.

Feel free to look around and take what you want, but keep in mind that these
are MY opinionated settings and that there is a risk if you simply take these
files and use them as is that they won't work or that they will break stuff.
No refunds!

If you still don't do, take some time to organize your dotfiles inside a Git
repository. You'll gain some advantages: versioning your config so you can make
changes knowing you can rollback if things go wrong; easy cloud sync through
multiple computers via Git; backup for setting new systems after a format.

## Repository structure

* `home` directory: common configuration for shared applications:
  bash, tmux, neovim, neomutt, irssi...
* `mac` directory: macOS specific dotfiles: system settings, reset script...
* `freebsd` directory: FreeBSD specific dotfiles for my hacking machine.

## Usage

Place a symlink on the appropiate location for each dotfile pointing to a file
on this repo. For instance, ~/.bashrc should be a symlink pointing to
~/.dotfiles/home/.bashrc. That way, if ~/.bashrc gets modified, your
~/.dotfiles working directory gets modified and you can make a commit.

This repo is optimized for [GNU Stow](https://www.gnu.org/s/stow). You should
install GNU Stow as it makes this _symlink_ process automated. (There are many
other reasons on why you should use GNU Stow). After installing Stow, cd to
~/.dotfiles and run `stow home` to make symlinks on your home directory for each
file in `home` automatically. Run `stow freebsd` or `stow mac` to symlink
additional dotfiles appropiately.

## Installation scripts

This is a feature under development. To make it easier to bootstrap a new
system after installing a fresh OS, some installation scripts are under
development. They will install the software packages I use on each OS. At the
moment there is a Brewfile for macOS. Something similar for pacman (Arch) or
dpkg (Debian) is pending to be done.

* macOS: install Homebrew, install Homebrew Cask, stow the `mac` directory to
  place the Brewfile in ~/.Brewfile. Then run `brew bundle --global`. This will
  add taps and formulaes declared in the Brewfile.

* FreeBSD: (TODO:) Export and clean the output of `pkg prime-list` to get the
  list of essential packages to install after a clean FreeBSD installation.

## Changelog

March 2021: Given that I fully migrated to FreeBSD and that I don't touch
a lot of GNU/Linux boxes these days, I've removed `linux` and `linux-work`
directories.

January 2018: The repository layout was changed and I removed support for
software I didn't use anymore, such as zsh, openbox, powershell and
windows/msys. If you're looking for that, checkout older commits. Additional
branches and tags for historic reasons are pending to be made.
