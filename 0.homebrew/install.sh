if test ! $(which brew); then
  echo "Installing Homebrew."

  if ! is-macos -o ! is-executable /bin/bash -o ! is-executable curl -o ! is-executable git; then
    echo "Skipped: Homebrew (not mac / missing: bash, curl and/or git)"
    return
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If installation failed try the following:
# sudo chown -R $(whoami) /usr/local

echo "upgrading brew"
brew ugprade

echo "Installing apps via Homebrew"
brew bundle || echo "Reinstalling those packages afterward."