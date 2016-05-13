#!/bin/bash
. ./lib/brackets-build.sh

function opensuse-build {
  # Get dependencies
  OSVER=$(lsb_release -r | sed 's/Release:\s*//g')
  if [[ $OSVER == "42.1" ]]; then
    sudo zypper addrepo http://download.opensuse.org/repositories/home:simotek:base/openSUSE_Leap_42.1/home:simotek:base.repo
    sudo zypper addrepo http://download.opensuse.org/repositories/home:fschuett/openSUSE_Leap_42.1/home:fschuett.repo
    sudo zypper refresh
    sudo zypper in -y libgcrypt libudev0
  else
    sudo zypper in -y libudev0 libgcrypt11
  fi
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel libX11-devel gtk2-devel python
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets-build
}

export -f opensuse-build
