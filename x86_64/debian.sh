#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is the default] "
read preference

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  version
  # Download latest binary
  curl -sL https://github.com/adobe/brackets/releases/download/release-$pkgver/Brackets.Release.$pkgver.64-bit.deb > /tmp/brackets-amd64.deb
  # install from deb
  sudo dpkg -i /tmp/brackets-amd64.deb                                 # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

else

  if ! [[ -d $HOME/Programs ]]; then
    mkdir $HOME/Programs
  fi
  cd $HOME/Programs
  curl -OsL http://ftp.au.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u4_amd64.deb
  curl -OsL http://ftp.au.debian.org/debian/pool/main/u/udev/libudev0_175-7.2_amd64.deb
  sudo dpkg -i *.deb
  sudo apt-get -f install
  debian_build

fi
