# README

Dotfiles for Kaidee developers. It's designed for every developer to kickstart their experience developing Kaidee. If you wish to add anything personal, please fork this repository and use your own.

This repo is setup as a baseline for developer to quickly install the application and getting ready to start. The content of this file is largely taken from [Zach Holman's version](https://github.com/holman/dotfiles).

# Installation

Once you add SSH-key to your Gitlab profile then clone and run bootstrap script as follow:

```
git clone git@git.24x7th.com:poohdish.r/dotfiles.git ~/.dotfiles
~/.dotfiles/script/bootstrap
```

# What to do next?

- You might want to consider using Alfred 3 instead of OSX's Spotlight.
- Switch `Cmd + Space` to switch language input.
- Switch `Option + Space` to start Alfred

# WTF is Dotfiles?

[Dotfiles](https://dotfiles.github.io/) is a bootstrap script to automate the setup of your softwares, configurations, and environment.

# Terminal configuration

This script prioritise `iTerm2` and `ZSH` with [**Oh My ZSH!**](https://github.com/robbyrussell/oh-my-zsh) based configuration. It will setup [`agnoster`](https://github.com/agnoster/agnoster-zsh-theme) theme by default however this does not perfectly working out of the box and require manual setup to work. The script will installs the required fonts([Powerline](https://github.com/powerline/fonts)) and [Solarized](https://ethanschoonover.com/solarized/) colorscheme for it to be ready to use.

You will need to go to the Preference setting of your iTerm2 as follow:
- Go to Profile > Colors > Color Presets > Pick `Solarized Dark` or `Solarized Light`
- Go to Profile > Text > Change Font > Search for `Powerline` > Pick whatever you like but `Noto Mono for Powerline` is pretty nice. 

# Why ZSH?

[See for yourself](https://www.slideshare.net/jaguardesignstudio/why-zsh-is-cooler-than-your-shell-16194692?ref=http://zpalexander.com/switching-to-zsh/)

# How can I customize this for my own use?

Fork into your own repo then configure to your heart content.

# Python
See [python.md](python.md)

# Shortcuts
[VS Code OSX Shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf)