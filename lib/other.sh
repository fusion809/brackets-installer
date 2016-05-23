#!/bin/bash
source "./lib/build/node.sh"
source "./lib/build/brackets.sh"

printf "\n\nGreetings, you seem to be using an operating system that is not officially supported by this installer. Despite this, provided you are using some distribution of Linux this installer can still be used to install Brackets from source, provided you have the following packages installed:
* alsa-lib
* gconf
* libgcrypt15
* libudev.so.0
* Node.js
* NPM
* node-gyp
* git
* unzip
* gtk2
This script will test for each of these dependencies and tell you which one you need to install. If a package is installed yet still this script returns a output indicating it is not, you will need to add the package's executable to your PATH.\n"

if ! [[ -f /usr/lib/pkgconfig/gconf-2.0.pc ]]; then
  printf "gconf does not seem to be installed.\n"
fi

if ! [[ -f /usr/lib/libasound.so ]]; then
  printf "alsa-lib does not seem to be installed.\n"
fi

if ! `comex node`; then
  printf "Node.js is not in the system PATH; probably meaning it is not installed. Do you want to use this script to install Node.js from a Linux binary tarball? [y/n]\n"
  read nodeyn
  if [[ $nodeyn == "y" ]]; then
    node_build
  fi
fi

if ! `comex npm`; then
  printf "NPM is not in the system PATH. This likely indicates that it is not installed. Do you want to install NPM and Node.js from a Linux binary tarball? [y/n]\n"
  read npmyn
  if [[ $npmyn == "y" ]]; then
    node_build
  fi
fi

if ! `comex node-gyp`; then
  printf "node-gyp is not installed! Would you like to install it with NPM? [y/n]\n"
  read nodegyn
  if [[ $nodegyn == "y" ]]; then
    sudo npm install -g node-gyp
  fi
fi

if ! [[ -f /usr/lib/libgcrypt.so.11 ]]; then
  printf "The essential libgcrypt.so.11 library was not found, which likely indicates that you do not have the required version of libgcrypt installed.\n"
fi

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  printf "libudev.so.0 was not detected! If your distribution does not have libudev.so.0 in its official repositories, but does have some newer version of libudev, I would recommend installing it and using `ln -s` to create a symbolic link to /usr/lib/libudev.so.0.\n"
fi

method

if ! `comex gcc`; then
  printf "GCC was not detected. Please install it, or if it is installed add its executable to your system PATH.\n"
fi

if ! `comex g++`; then
  printf "C++ support in GCC was not detected. Please install it, or if it is installed, add its executable to your system PATH.\n"
fi

if ! [[ -d /usr/lib/gtk-2.0/ ]]; then
  printf "GTK2 development headers were not detected.\n"
fi

if ! `comex make`; then
  printf "GNU Make was not detected please install it, or add it to your PATH.\n"
fi

printf "Have you installed all the dependencies? [y/n]\n If you answer y, brackets_build will be run!\n"
read depsyn

if [[ $depsyn == "y" ]]; then
  brackets_build
fi
