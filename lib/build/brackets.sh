#!/bin/bash
function brackets_build {
  variables

  get-script

  version

  # Get the shell source
  get-shell

  shell_build

  get-brackets

  brackets_install
}

export -f brackets_build
