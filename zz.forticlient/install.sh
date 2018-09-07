# Installing Forticlient last because it's an updater GUI app

forti_dir="$(brew cask info forticlient | grep Caskroom | cut -d ' ' -f 1)"

if ! whichapp 'forticlient' &>/dev/null; then open -a "$forti_dir/FortiClientUpdate.app"