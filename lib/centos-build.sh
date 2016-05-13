#!/bin/bash
. ./lib/brackets-build.sh
. ./lib/libudev0-build.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y unzip nodejs-devel gcc gcc-c++ make \
    glibc-devel git-core libgcrypt gtk2-devel python \
    libblkid-devel kmod-devel
  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi
  if ! [[ -f /usr/lib/libudev.so.0 ]]; then
    curl -OsL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.x86_64.rpm /tmp
    if ! `comex bsdtar`; then
      sudo yum install -y bsdtar
    fi
    bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm
    sudo cp -a /tmp/lib64/libudev.so.0* /usr/lib/
  fi
  brackets-build
}

export -f centos-build
