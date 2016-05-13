#!/bin/bash

#!/bin/bash

. ./lib/test.sh

function brackin {
  if [[ -n "$1" ]]; then
    cd /tmp/brackets-$1
  else
    cd /tmp/brackets
  fi
  makepkg -si --noconfirm
  cd .
}

export -f brackin

# Install brackets
function brackaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/

  if [[ -n "$1" ]]; then                     # if input provided; allowed input bin, git

    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S brackets-$1 --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/brackets-$1.git /tmp/brackets-$1
      atomin $1

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/brackets-$1.tar.gz | tar xz -C /tmp
      atomin $1

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/brackets-$1.tar.gz | tar xz -C /tmp
      atomin $1

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/brackets-$1.tar.gz | tar xz -C /tmp
      atomin $1

    fi
  else
    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S brackets --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/brackets.git /tmp/brackets
      atomin

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/brackets.tar.gz | tar xz -C /tmp
      atomin

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/brackets.tar.gz | tar xz -C /tmp
      atomin

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/brackets.tar.gz | tar xz -C /tmp
      atomin

    fi
  fi
}

export -f brackaur
