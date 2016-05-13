#!/bin/bash
. ./lib/brackets-build.sh

function opensuse-build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel libX11-devel libudev0 libgcrypt
  sudo npm install -g node-gyp
  brackets-build
}

export -f opensuse-build
