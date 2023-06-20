# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.1.0] - 13 March 2023

### Added

* Brewfile
    - `awscli` to interact with aws
    - `kubernetes-cli` for k8s cluster
    - `mysql` it's a requirement in some projects
    - `redis`

### Changed

* Update changelog format
* Updated python.md to better reflect how to use `pyenv` and `pipenv`
* Update the way homebrew is installed, to use the latest method as mentioned in [brew.sh](https://brew.sh/)
* Brewfile
    - fixed version of `libcouchbase` to `libcouchbase@2`

### Deprecated

* Python install script, currently installing EOL 2.7 that's no longer in use

### Removed

* Fortinet, no longer in use
* Brewfile
    - `zsh` as it's now the default mac shell
    - `fortinet` as it's no longer in use
    - cask taps as brew no longer needs it
    - `git` as there's a version that comes with macOS
    - a bunch of qol tools that aren't a necessity but a good-to-have
        + `alfred`
        + `caffeine`
        + `daisydisk`
        + `dash`
        + `dropbox`
        + `flux`
        + `font-fira-code` (also no longer available on brew)
        + `forticlient`
        + `google-chrome-canary`
        + `hammerspoon`
        + `httpie`
        + `iterm2`
        + `kaleidoscope`
        + `kite`
        + `macdown`
        + `mackup`
        + `nvm`
        + `rbenv`
        + `rbenv-bundler`
        + `ruby-build`
        + `rust`
        + `sourcetree`
        + `sublime-text`
        + `the-unarchiver`
        + `tree`
        + `unar`
        + `visual-studio-code`
        + `wget`
    - All the quick look plugins stuffs
* zsh
    - Removed custom `.zshrc`
    - Removed custom aliases
    - Removed custom config
* node related installer
* ruby related installer
* visual studio code related installer

## [1.0.0] - 19 September 2018

### Added

- Complete basic machine setup
- Application installed via Brewfile
- Python development is made easier with `pipenv`
- Ruby environment is controlled by `rbenv`
- Node environment is controller by `nvm` (untested)
- VS Code is the default editor and can be invoke with `e`
- Zsh is setup by default.  
- Lots of stuff installed automatically:
    - iTerm 2 Since a lot of people seems to like it
    - Alfred The most powerful and intuitive helper for OSX
    - Myriad of Powerline fonts
    - Fira Code (Awesome coding Font!)
    - Forticlient Downloader (Can't really install the actual thing, YET)
