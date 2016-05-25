#!/bin/bash
. ./lib/build/brackets.sh

function ubuntu_build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git libudev0 \
    libgnome-keyring-dev fakeroot python libgcrypt11-dev \
    libgtk2.0-dev
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets_build
}

export -f ubuntu_build
