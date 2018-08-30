echo "Installing ZSH"

if ! is-executable brew -o ! is-executable curl; then
  echo "Skipped: npm (missing: brew and/or curl)"
  return
fi

echo "Installing Oh-My-ZSH! into: $ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

chsh -s $(which zsh)