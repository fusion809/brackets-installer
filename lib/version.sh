#!/bin/bash
function version {

  if ! [[ -d /tmp/brackets ]]; then
    git clone https://aur.archlinux.org/brackets.git /tmp/brackets
  else
    cd /tmp/brackets
    git pull origin master
  fi

  pkgver=$(sed -n 's/pkgver=//p' /tmp/brackets/PKGBUILD)
}

export -f version
