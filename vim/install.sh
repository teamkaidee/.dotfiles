#!/usr/bin/env bash

if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
  mkdir -p "$HOME/.config/nvim"
  ln -s "$DOTFILES_ROOT/vim/init.vim" "$HOME/.config/nvim/init.vim"
else
  echo "$HOME/.config/nvim/init.vim already existed"
fi

