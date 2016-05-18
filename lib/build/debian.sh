. ./lib/build/brackets.sh

function debian_build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libgtk2.0-dev python
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets_build
}

export -f debian_build
