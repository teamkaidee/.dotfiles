#!/usr/bin/env bash

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py


# Might need to switch to use pyenv's python instead so we don't need to do this.
sudo chown -R $USER /Library/Python/2.7

python get-pip.py


if pip -V | grep "python 3"; then
  if pip freeze | grep virtualenvwrapper; then
    echo "Installing virtualenvwrapper"
    pip install virtualenvwrapper
  fi
fi

