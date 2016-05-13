. ./lib/brackets-build.sh

function linux-mint-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot python libgcrypt11-dev \
    libgtk2.0-dev
  sudo npm install -g node-gyp
  brackets-build
}

export -f linux-mint-build
