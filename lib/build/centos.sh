#!/bin/bash
. ./lib/build/brackets.sh

function centos_build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y unzip nodejs-devel gcc gcc-c++ make \
    glibc-devel git-core libgcrypt gtk2-devel python \
    libblkid-devel kmod-devel
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets_build
}

export -f centos_build
