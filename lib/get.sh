#!/bin/bash
function get-brackets {
  if ! [[ -d $SRC_DEST/brackets ]]; then
    git clone https://github.com/adobe/brackets.git $SRC_DEST/brackets
  fi

  cd $SRC_DEST/brackets
  git checkout release-$ver
  git submodule update --init --recursive
}

export -f get-brackets

function get-shell {
  if ! [[ -d $SRC_DEST/brackets-shell ]]; then
    git clone https://github.com/adobe/brackets-shell.git $SRC_DEST/brackets-shell
  fi

  cd $SRC_DEST/brackets-shell
  git checkout linux-1547
  git pull origin linux-1547
}

export -f get-shell

function get-script {
  mv $INDIR/resources/brackets $SRC_DEST/brackets2
  sed -i -e "s|<%-index.html-%>|$SRC_DEST/brackets/src/index.html|g" $SRC_DEST/brackets2
}

export -f get-script
