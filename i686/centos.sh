#!/bin/bash

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  curl -sL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.i686.rpm > /tmp/libudev-147-2.63.el6_7.1.i686.rpm
  if ! `comex bsdtar`; then
    sudo yum install -y bsdtar
  fi
  bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.i686.rpm -C /tmp
  sudo cp -a /tmp/lib/libudev.so.0* /usr/lib/
fi

centos-build
