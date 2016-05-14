#!/bin/bash
. ./lib/brackets-build.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y unzip nodejs-devel gcc gcc-c++ make \
    glibc-devel git-core libgcrypt gtk2-devel python \
    libblkid-devel kmod-devel
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  brackets-build
}

export -f centos-build
