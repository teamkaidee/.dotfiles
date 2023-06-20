echo "Installing ZSH"

if ! is-executable brew -o ! is-executable curl; then
  echo "Skipped zsh installation (missing: brew and/or curl)"
  return
fi

echo "Installing Oh-My-ZSH! into: ${ZSH:-$HOME/.oh-my-zsh}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]; then
  echo "Found and restored ~/.zshrc.pre-oh-my-zsh"
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

chsh -s $(which zsh)