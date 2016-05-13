. ./lib/brackets-build.sh

function debian-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git libudev-dev \
    libgnome-keyring-dev fakeroot libgcrypt20-dev libgtk2.0-dev python
  sudo npm install -g node-gyp
  brackets-build
}

export -f debian-build
