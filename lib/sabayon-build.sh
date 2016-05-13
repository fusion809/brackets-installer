#!/bin/bash
. ./lib/brackets-build.sh
. ./lib/libudev0-build.sh

function sabayon-build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc sys-libs/libstdc++ sys-libs/glibc \
    dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11 dev-libs/libgcrypt \
    sys-apps/usbutils sys-apps/kmod dev-util/gperf dev-lang/python:2 x11-libs/gtk+:2
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  sudo ln -s /usr/lib/libudev.so.1.* /usr/lib/libudev.so.0
  brackets-build
}

export -f sabayon-build
