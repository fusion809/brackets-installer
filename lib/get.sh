#!/bin/bash
function get-brackets {
  if ! [[ -d $SRC_DEST/${lowedit} ]]; then
    git clone https://github.com/adobe/${lowedit}.git $SRC_DEST/${lowedit}
  fi

  cd $SRC_DEST/${lowedit}
  git checkout release-$ver
  git submodule update --init --recursive
}

export -f get-${lowedit}

function get-shell {
  if ! [[ -d $SRC_DEST/${lowedit}-shell ]]; then
    git clone https://github.com/adobe/${lowedit}-shell.git $SRC_DEST/${lowedit}-shell
  fi

  cd $SRC_DEST/${lowedit}-shell
  git checkout linux-1547
  git pull origin linux-1547
}

export -f get-shell

function get-script {
  mv $INDIR/resources/${lowedit} $SRC_DEST/${lowedit}2
  sed -i -e "s|<%-index.html-%>|$SRC_DEST/${lowedit}/src/index.html|g" $SRC_DEST/${lowedit}2
}

export -f get-script
