echo "Installing apps via Homebrew-Cask"

if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

apps=(
  alfred
  daisydisk
  dash
  dropbox
  flux
  font-fira-code
  google-chrome
  google-chrome-canary
  hammerspoon
  kaleidoscope
  kite
  macdown
  slack
  sourcetree
  sublime-text
  virtualbox
  visual-studio-code
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi