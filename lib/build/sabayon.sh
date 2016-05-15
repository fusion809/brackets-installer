#!/bin/bash
. ./lib/build/brackets.sh

function sabayon-build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc virtual/libstdc++ sys-libs/glibc \
    dev-vcs/git gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/libX11 dev-libs/libgcrypt \
    sys-apps/usbutils sys-apps/kmod dev-util/gperf dev-lang/python:2.7 x11-libs/gtk+:2 sys-libs/libudev-compat
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets-build
}

export -f sabayon-build
