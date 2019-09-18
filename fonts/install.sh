#!/usr/bin/env bash
echo "Installing Fonts into $DOTFILES_ROOT"

# Install Powerline fonts
powerline_folder="$DOTFILES_ROOT/fonts/powerline-fonts"
if [ ! -d "$powerline_folder" ]; then
  git clone https://github.com/powerline/fonts.git "$DOTFILES_ROOT/fonts/powerline-fonts"
  . "$DOTFILES_ROOT/fonts/powerline-fonts/install.sh"
  rm -rf "$DOTFILES_ROOT/fonts/powerline-fonts"
fi

