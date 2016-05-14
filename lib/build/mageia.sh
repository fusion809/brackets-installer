#!/bin/bash
. ./lib/build/brackets.sh
. ./lib/build/node.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++ libx11-devel \
    libcrypt libudev0-devel python gtk2-devel
  node-build
  brackets-build
}

export -f mageia-build
