echo "Trying to install Homebrew."

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# If installation failed try the following:
# sudo chown -R $(whoami) /usr/local

brew update
brew upgrade

apps=(
  git
  httpie
  mackup
  unar
  wget
)

brew install "${apps[@]}"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~