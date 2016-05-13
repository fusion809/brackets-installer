#!/bin/bash
. ./lib/brackets-build.sh

function fedora-build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs
  sudo dnf copr enable mosquito/brackets
  sudo dnf update -y
  sudo dnf install -y unzip nodejs-devel gcc gcc-c++ make \
    glibc-devel git-core compat-libgcrypt
  sudo npm install -g node-gyp
  brackets-build
}

export -f fedora-build
