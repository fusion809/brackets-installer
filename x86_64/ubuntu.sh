#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is the default] "
read preference

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  ver=$(sed -n 's/ver=//p' ./lib/version.sh)
  # Download latest binary
  curl -sL https://github.com/adobe/brackets/releases/download/release-$ver/Brackets.Release.$ver.64-bit.deb > /tmp/brackets-amd64.deb
  # install from deb
  sudo dpkg -i /tmp/brackets-amd64.deb                                 # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

else

  if ! [[ -d $HOME/Programs ]]; then
    mkdir $HOME/Programs
  fi
  curl -sL http://mirror.optus.net/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_amd64.deb > $HOME/Programs/libudev0_175-0ubuntu9_amd64.deb
  curl -sL http://security.ubuntu.com/ubuntu/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-2ubuntu4.3_amd64.deb > $HOME/Programs/libgcrypt11_1.5.3-2ubuntu4.3_amd64.deb
  sudo dpkg -i $HOME/Programs/libudev0_175-0ubuntu9_amd64.deb
  sudo dpkg -i $HOME/Programs/libgcrypt11_1.5.3-2ubuntu4.3_amd64.deb
  ubuntu-build

fi
