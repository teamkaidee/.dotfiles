#!/usr/bin/env bash

mkdir -p "$HOME/.config/nvim"
if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
  ln -s "$DOTFILES_ROOT/vim/init.vim" "$HOME/.config/nvim/init.vim"
else
  echo "$HOME/.config/nvim/init.vim already existed"
fi

