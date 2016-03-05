## About

These are my dotfiles. Dotfiles are little settings files used by many
applications on UNIX-based systems like Linux, BSD and OS X. They are called
dotfiles because their name starts by dot, which makes them hidden by default
to tools such as ls, Nautilus or Finder.

A clever strategy for managing dotfiles is to move them to a central folder
and then use symlinks to link the files where they should go. That way, your
system applications see the config files where they expect to but you can
manage all your settings at once in a separate folder.

This is where Git becomes useful, because you can track the changes you do
to your dotfiles: rollback if a particular change is harming, or test new
changes in a branch keeping your main settings stable.

Pushing my dotfiles to GitHub makes it easy to keep an online backup. In case
I format my PC or want to install these files into a new computer, I just
have to clone my repository and set up. Another reason is for sharing the
files with anybody so that other people can take whatever they consider
useful.

## Install

### Requirements

* **An UNIX based system**. This is not accurate since these dotfiles will
  work on Windows too, but since Windows lacks symbolic links, the experience
  won't be that great.
* **GNU Stow**. This is the tool that will create symlinks in the system.
  If you cannot use Stow, you'll have to manually create symlinks at their
  appropiate locations.

### Install

Clone this repository in a location such as `~/.dotfiles`. Then, enter
the just cloned repository and start stowing the packages that you want.

    git clone git://github.com/danirod/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    stow zsh
    stow openbox
    stow tmux

Note that `stow zsh` works because there is a directory named `stow` under
`~/.dotfiles` and because the parent directory for `~/.dotfiles/` is already
$HOME. If you are cloning this repository into a different location you will
need to change the target directory or you will get these dotfiles linked
at wrong locations.

## Packages

Most of the packages have the name of the application they are used by, such
as **atom**, **bash** or **zsh** and they don't need further explanation.
However, there are a few special packages:

* **osx**: special settings for MacOS X.
* **ubuntu**: special settings for Ubuntu based systems.
* **windows**: special settings for Windows (Cygwin / MSYS-NT).

## Disclaimer

**Please note that the settings provided by this repository are highly
opinionated and designed to fit my needs. I don't recommend nobody to stick
with my settings.** My suggestion on the use of this repository is to take
it as a framework for setting your own dotfiles.

**The contents of this repository are provided AS IS with no warranties.
I'm not responsible if you break your computer, lose your local settings or
do anything wrong because of running the wrong script or executing the wrong
command.**

