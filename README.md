# README

Dotfiles for Kaidee backend developers. It's designed to kickstart their experience developing Kaidee. If you wish to add anything personal, **please fork this repository and use your own**.

This repo will help to set a baseline for all backend developers. It installs *only the bare minimum* to have your development environment ready. If there are any required libraries / tools missing, feel free to create a PR to update this repo.

The content of this repo is largely derived from [Zach Holman's version](https://github.com/holman/dotfiles).

# WTF is Dotfiles?

[Dotfiles](https://dotfiles.github.io/) is a bootstrap script to automate the setup of your softwares, configurations, and environment.

# Installation

First make sure that you are able to access GitHub using SSH. To do that, follow the steps in [this GitHub docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

After that, run bootstrap script:

```
git clone git@github.com:teamkaidee/.dotfiles.git ~/.dotfiles
~/.dotfiles/script/bootstrap
```
 Note that the above script will clone this dotfile repo into your local machine at `~/.dotfiles`.

# Terminal configuration

This script will install [**Oh My ZSH!**](https://github.com/robbyrussell/oh-my-zsh) framework on the default `zsh` shell for mac.

This script prioritise `iTerm2` and `ZSH` with [**Oh My ZSH!**](https://github.com/robbyrussell/oh-my-zsh) based configuration. It will setup [`agnoster`](https://github.com/agnoster/agnoster-zsh-theme) theme by default however this does not perfectly working out of the box and require manual setup to work. The script will installs the required fonts([Powerline](https://github.com/powerline/fonts)) and [Solarized](https://ethanschoonover.com/solarized/) colorscheme for it to be ready to use.

You will need to go to the Preference setting of your iTerm2 as follow:

- Go to Profile > Colors > Color Presets > Pick `Solarized Dark` or `Solarized Light`
- Go to Profile > Text > Change Font > Search for `Powerline` > Pick whatever you like but `Noto Mono for Powerline` is pretty nice.

After this you may remove Solarized folder from `~/.dotfiles/zsh` if necessary.

# Why ZSH?

[See for yourself](https://www.slideshare.net/jaguardesignstudio/why-zsh-is-cooler-than-your-shell-16194692?ref=http://zpalexander.com/switching-to-zsh/)

# Python

See [python.md](python.md)

# What's next?

## Use Alfred instead of Spotlight

You may want to disable OSX's Spotlight with [Alfred](https://www.alfredapp.com/) for it is much more powerful version to improve productivity. You can do this by:

1. Go to Preferences > Keyboard > Shortcuts > Spotlight.
2. Remove "Show Spotlight search" shortcut.

## Configure Input Sources

By default OSX use "^+Space" to switch between input sources(language), the key position is rather awkward. If you switch to use Alfred, you will no longer need the "⌘+Space" shortcut. You should change this to be used for language switching instead.

1. Go to Preferences > Keyboard > Shortcuts > Input Sources
2. Click on the old shortcut then press `⌘+Space`.

# Shortcuts

- To see all shortcuts configured type `alias`.
