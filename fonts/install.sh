#!/usr/bin/env bash
echo "Installing Fonts into $DOTFILES_ROOT"

# Install Powerline fonts
powerline_folder="$DOTFILES_ROOT/fonts/powerline-fonts"
if [ ! -d "$powerline_folder" ]; then
    git clone https://github.com/powerline/fonts.git "$DOTFILES_ROOT/fonts/powerline-fonts"
    . "$DOTFILES_ROOT/fonts/powerline-fonts/install.sh"
    rm -rf "$DOTFILES_ROOT/fonts/powerline-fonts"
fi

# Installing Solarized 
solarized_folder="$DOTFILES_ROOT/zsh/solarized"
if [ ! -d "$solarized_folder" ]; then
    echo "Cloning Solarzied into $solarized_folder"
    git clone git://github.com/altercation/solarized.git "$DOTFILES_ROOT/zsh/solarized"
else
    echo "Pulling Solarzied in $DOTFILES_ROOT/zsh/solarized"
    git -C "$DOTFILES_ROOT/zsh/solarized" pull
fi