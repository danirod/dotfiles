# danirod's dotfiles

## About

These are my system dotfiles. These files manage settings for the software and
operating systems I use. I move around macOS, Arch Linux and Debian and these
are the supported operating systems for these dotfiles. Feel free to look and
take what you want, but keep in mind that this is MY opinionated config.

If you still don't do, take some time to organize your dotfiles inside a Git
repository. You'll gain some advantages: versioning your config so you can make
changes knowing you can rollback if things go wrong; easy cloud sync through
multiple computers via Git; backup for setting new systems after a format.

## Repository structure

* `home` directory: common configuration for shared applications:
  bash, tmux, neovim, neomutt, irssi...
* `mac` directory: macOS specific dotfiles: system settings, reset script...
* `linux` directory: Linux/X11 specific dotfiles: xinit, i3, compton, fonts...

## Usage

Place a symlink on the appropiate location for each dotfile pointing to a file
on this repo. For instance, ~/.bashrc should be a symlink pointing to
~/.dotfiles/home/.bashrc. That way, if ~/.bashrc gets modified, your ~/.dotfiles
working directory gets modified and you can make a commit.

This repo is optimized for [GNU Stow](https://www.gnu.org/s/stow). You should
install GNU Stow as it makes this _symlink_ process automated. (There are many
other reasons on why you should use GNU Stow). After installing Stow, cd to
~/.dotfiles and run `stow home` to make symlinks on your home directory for each
file in `home` automatically. Run `stow linux` or `stow mac` to symlink
additional dotfiles appropiately.

## Installation scripts

This is a feature under development. To make it easier to bootstrap a new
system after installing a fresh OS, some installation scripts are under
development. They will install the software packages I use on each OS. At the
moment there is a Brewfile for macOS. Something similar for pacman (Arch) or
dpkg (Debian) is pending to be done.

* macOS: install Homebrew, install Homebrew Cask, then run
  `brew bundle --file=~/.dotfiles/Brewfile`. This will add taps and formulaes
  declared in the Brewfile. Homebrew unfortunately doesn't track well enough
  dependencies. This Brewfile can also be used to purge your Homebrew
  installation by running `brew bundle cleanup --file=~/.dotfiles/Brewfile`.
  This will remove packages not declared in the Brewfile and purge unused orphan
  dependencies.

## Changelog

The repository layout was changed on Jan 2018 and I removed support for software
I didn't use anymore, such as zsh, openbox, powershell and windows/msys. If
you're looking for that, checkout older commits. Additional branches and tags
for historic reasons are pending to be made.
