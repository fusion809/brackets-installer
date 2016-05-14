#!/bin/bash
function variables {
  export GHUB=$HOME/GitHub

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? [Leave empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  export SRC_DEST
  export SRC_METHOD
}

export -f variables
