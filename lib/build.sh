#!/bin/bash
function shell-build {
  npm install
  rm -rf out
  node_modules/grunt-cli/bin/grunt cef-clean
  node_modules/grunt-cli/bin/grunt setup
  LINKER=$(sed -n "s/LINK.target ?= //p" Makefile)
  sed -i -e "s|$LINKER|LINKER|g" Makefile
  sed -i -e 's/LINKER/${LINK}/g' Makefile
  make
}

export -f shell-build
