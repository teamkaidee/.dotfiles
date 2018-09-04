curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py


# Might need to switch to use pyenv's python instead so we don't need to do this.
sudo chown -R $USER /Library/Python/2.7

python get-pip.py
