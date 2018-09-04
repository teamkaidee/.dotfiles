echo "Installing ZSH"

if ! is-executable brew -o ! is-executable curl; then
  echo "Skipped: npm (missing: brew and/or curl)"
  return
fi

echo "Installing Oh-My-ZSH! into: $ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]; then
  echo "Found and restored ~/.zshrc.pre-oh-my-zsh"
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

chsh -s $(which zsh)