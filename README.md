# danirod's dotfiles

## About

These dotfiles contain the current configuration of my supported machines.

Feel free to look around and take what you want,
but keep in mind that these are MY opinionated settings.
There is a risk if you simply take these files and use them as is that they won't work or that they will break stuff.
No refunds!

If you still don't do,
take some time to organize your dotfiles inside a Git repository.
You'll gain some advantages:
versioning your config so you can make changes knowing you can rollback if things go wrong;
easy cloud sync through multiple computers via Git;
backup for setting new systems after a format.

## Usage

This repository uses the good old [GNU Stow](https://www.gnu.org/s/stow).
The repository is cloned into `$HOME/.dotfiles` and then symlinks are created via `stow home`, `stow mac`.
If the process fails, make sure that you have deleted the default dotfiles that most OS will configure for you.

## Repository structure

* `home` directory: common configuration for shared applications:  bash, tmux, neovim, neomutt, irssi...
* `mac` directory: macOS specific dotfiles: system settings, reset script...
* `freebsd` directory: FreeBSD specific dotfiles for the hacking machine.
* `i3` directory: settings to use for i3 + i3 apps (alacritty, polybar, rofi, dunst, xinit, xrdb)

## TODO list, not on any order

* i3 profile:
  * configure picom as a compton replacement.
  * configure a rofi menu for power options to replace the i3-nagbar action.
* freebsd profile:
  * merge into the i3 profile once i3 tasks are done.
* home profile:
  * rename home profile to terminal to make it more neutral against other profiles.
* mac profile:
  * remove or update the bin/osx-defaults script.