#!/bin/bash
function variables {
  export GHUB=$HOME/GitHub
  export LH=$HOME/.local
  export LB=$LH/bin
  export LS=$LH/share

  # Get the source code
  printf "How would you like to get the source code? \n[Available options: curl/git/wget/? If left blank the default value of `curl` will be used.]\n"
  read SRC_METHOD

  printf "Where do you want to store the source code? \n[Leave empty for $GHUB]\n"
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install $EDIT locally or system-wide? \n[Accepted options: local/system. If you leave this field blank a local install will be performed.]\n"
  read DEST_TYPE

  export SRC_DEST
  export SRC_METHOD

}

export -f variables
