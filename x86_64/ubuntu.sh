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

elif [[ $preference == "B" ]]; then

  ubuntu-build

fi
