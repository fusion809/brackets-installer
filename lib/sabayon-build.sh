#!/bin/bash
. ./lib/brackets-build.sh
. ./lib/libudev0-build.sh

function sabayon-build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc sys-libs/libstdc++ sys-libs/glibc \
    dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11 dev-libs/libgcrypt \
    sys-apps/usbutils sys-apps/kmod dev-util/gperf
  sudo npm install -g node-gyp
  libudev0-build
  brackets-build
}

export -f sabayon-build
