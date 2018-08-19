# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  echo "Use Readlink on: $CURRENT_SCRIPT"
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  echo "Found Path: $SCRIPT_PATH"
  DOTFILES_DIR=$(dirname "$SCRIPT_PATH")
elif [ -d "$HOME/.dotfiles" ]; then
  echo ".dotfiles directory found; uses"
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi


# Add `~/bin` to the `$PATH`
echo "Dotfiles dir: $DOTFILES_DIR"
export PATH="$DOTFILES_DIR/bin:$PATH";

if is-macos; then
  echo "Mac"
fi