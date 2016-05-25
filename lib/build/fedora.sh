#!/bin/bash
. ./lib/build/brackets.sh

function fedora_build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs
  sudo dnf copr enable mosquito/brackets
  sudo dnf update -y
  sudo dnf install -y unzip nodejs-devel npm gcc gcc-c++ make \
    glibc-devel git-core compat-libgcrypt gtk2-devel python
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets_build
}

export -f fedora_build
