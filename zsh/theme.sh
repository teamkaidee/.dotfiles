#!/usr/bin/env bash

CUSTOM="$HOME/.oh-my-zsh/custom"

# Installing Solarized
solarized_folder="$ZSH_CUSTOM/themes/solarized"
if [ ! -d "$solarized_folder" ]; then
  echo "Cloning Solarzied into $solarized_folder"
  git clone git://github.com/altercation/solarized.git "$solarized_folder"
else
  echo "Pulling Solarzied in $solarized_folder"
  git -C "$solarized_folder" pull
fi

## Installing powerlevel9k theme
powerlevel9k_folder="$ZSH_CUSTOM/themes/powerlevel9k"
if [ ! -d "$powerlevel9k_folder" ]; then
    echo "Cloning powerlevel9k into $powerlevel9k_folder"
    git clone https://github.com/bhilburn/powerlevel9k.git "$powerlevel9k_folder"
else
    echo "Pulling powerlevel9k in $powerlevel9k_folder"
    git -C "$powerlevel9k_folder" pull
fi
ln -s "$ZSH_CUSTOM/themes/powerlevel9k/powerlevel9k.zsh-theme" "$ZSH_CUSTOM/themes/powerlevel9k.zsh-theme"

# Install spaceship prompt and theme
spaceship_folder="$ZSH_CUSTOM/themes/spaceship-prompt"
if [ ! -d "$spaceship_folder" ]; then
    echo "Cloning SpaceShip into $spaceship_folder"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$spaceship_folder"
else
    echo "Pulling SpaceShip in $spaceship_folder"
    git -C "$spaceship_folder" pull
fi
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

