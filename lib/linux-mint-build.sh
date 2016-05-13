. ./lib/brackets-build.sh

function linux-mint-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git libudev0 \
    libgnome-keyring-dev fakeroot libx11-dev libgcrypt
  sudo npm install -g gulp
  brackets-build
}

export -f linux-mint-build
