#!/bin/bash
function libudev0-build {
  curl -sL https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-182.tar.xz | tar -xJ
  cd udev-182
  autoreconf -vfi

  # Event codes have been moved out of input.h
  sed -i 's:input.h:input-event-codes.h:' Makefile.in
  # stdin.h is needed for uint32_t and uint8_t typedefs
  sed -i '20a#include <stdint.h>' src/mtd_probe/mtd_probe.h
  ./configure \
    --disable-gudev \
    --disable-introspection \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/udev
  make
  install -Dm755 .libs/libudev.so.0.13.1 "/usr/lib/libudev.so.0.13.1"
  ln -s "/usr/lib/libudev.so.0.13.1" "/usr/lib/libudev.so.0"
}

export -f libudev0-build
