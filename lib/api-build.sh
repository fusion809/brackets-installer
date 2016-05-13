#!/bin/bash
function api-build {
  VER=$(uname -r | sed "s/-.*//g")
  MAJ=${VER%.*}
  SER=${MAJ%.*}

  export PRG=$HOME/Programs
  export MAJ_SRC="http://www.kernel.org/pub/linux/kernel/v$SER.x/linux-$MAJ.tar.xz"
  export PATCH_SRC="http://www.kernel.org/pub/linux/kernel/v$SER.x/patch-$VER.xz"

  if ! [[ -d $PRG ]]; then
    mkdir -p $PRG
  fi
  curl -sL $MAJ_SRC | tar xJ -C $PRG
  curl -sL $PATCH_SRC | tar xJ -C $PRG

  cd $PRG/linux-$MAJ
    [[ "$VER" != "$MAJ.0" ]] && patch -p1 -i $PRG/patch-$VER || true

  make mrproper
  make headers_check
  mkdir install
  make INSTALL_HDR_PATH=install/usr headers_install

  # use headers from libdrm
  rm -r install/usr/include/drm

  # clean-up unnecessary files generated during install
  find install \( -name .install -o -name ..install.cmd \) -delete

  sudo cp -a install/usr/* /usr
}

export -f api-build
