#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is the default] "
read preference

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  ver=$(sed -n 's/ver=//p' ./lib/version.sh)
  # Download latest binary
  curl -sL https://github.com/adobe/brackets/releases/download/release-$ver/Brackets.Release.$ver.32-bit.deb > /tmp/brackets-i386.deb
  # install from deb
  sudo dpkg -i /tmp/brackets-i386.deb                                  # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

elif [[ $preference == "B" ]]; then

  if ! [[ -d $HOME/Programs ]]; then
    mkdir $HOME/Programs
  fi
  cd $HOME/Programs
  curl -OsL http://ftp.au.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u4_i386.deb
  curl -OsL http://ftp.au.debian.org/debian/pool/main/u/udev/libudev0_175-7.2_i386.deb
  sudo dpkg -i *.deb
  sudo apt-get -f install
  debian-build

fi
