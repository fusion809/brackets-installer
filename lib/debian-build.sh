. ./lib/brackets-build.sh

function debian-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libgtk2.0-dev python
  if ! [[ -d $HOME/Programs ]]; then
    mkdir $HOME/Programs
  fi
  cd $HOME/Programs
  curl -OsL http://ftp.au.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u4_amd64.deb
  curl -OsL http://ftp.au.debian.org/debian/pool/main/u/udev/libudev0_175-7.2_amd64.deb
  sudo dpkg -i *.deb
  sudo apt-get -f install
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets-build
}

export -f debian-build
