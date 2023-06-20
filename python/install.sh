set -e

# this will allow pyenv command to be used as a shell function
echo "enabling pyenv as shell command"
eval "$(pyenv init -)"

# Installing python versions that our backend repo uses
# skips installation if version already installed
echo "installing required python versions"
pyenv install -s  3.7.16
pyenv install -s  3.8.16
pyenv install -s  3.10.10
pyenv install -s  3.11.1
