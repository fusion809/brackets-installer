#!/bin/bash
function brackets-build {
  variables

  get-script

  version

  # Get the shell source
  get-shell

  shell-build

  get-brackets

  brackets-install
}

export -f brackets-build
