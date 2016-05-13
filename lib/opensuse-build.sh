#!/bin/bash
. ./lib/brackets-build.sh

function opensuse-build {
  # Get dependencies
  OSVER=$(lsb_release -r | sed 's/Release:\s*//g')
  if [[ $OSVER == "42.1" ]]; then
    sudo zypper in -y http://download.opensuse.org/repositories/home:/simotek:/base/openSUSE_Leap_42.1/x86_64/libgcrypt11-1.5.4-7.1.x86_64.rpm \
    http://download.opensuse.org/repositories/home:/etrash/openSUSE_Leap_42.1/x86_64/libudev0-182-1.1.x86_64.rpm
  fi
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel libX11-devel gtk2-devel python
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets-build
}

export -f opensuse-build
