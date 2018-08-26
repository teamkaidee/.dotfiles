#!/usr/bin/env bash
echo "Installing Fonts"

# Install Powerline fonts

git clone https://github.com/powerline/fonts.git "$DOTFILES_ROOT/fonts/powerline-fonts"
. "$DOTFILES_ROOT/fonts/powerline-fonts/install.sh"
rm -rf "$DOTFILES_ROOT/fonts/powerline-fonts"

# Installing Solarized 
git clone git://github.com/altercation/solarized.git "$DOTFILES_ROOT/zsh/solarized"