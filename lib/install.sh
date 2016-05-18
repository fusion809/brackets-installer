#!/bin/bash
function brackets_install {
  cd $SRC_DEST/brackets-shell
  sudo install -dm755 "/opt/brackets"
  sudo cp -R out/Release/lib "/opt/brackets/lib"
  sudo cp -R out/Release/locales "/opt/brackets/locales"
  sudo cp -R out/Release/node-core "/opt/brackets/node-core"
  sudo install -Dm644 out/Release/cef.pak "/opt/brackets/cef.pak"
  sudo install -Dm644 out/Release/devtools_resources.pak "/opt/brackets/devtools_resources.pak"
  sudo install -Dm755 out/Release/Brackets "/opt/brackets/Brackets"
  sudo install -Dm755 out/Release/Brackets-node "/opt/brackets/Brackets-node"
  sudo install -Dm755 $SRC_DEST/brackets2 "/opt/brackets/brackets"
  for size in 32 48 128 256; do
    sudo install -Dm644 "out/Release/appshell${size}.png" "/opt/brackets/appshell${size}.png"
  done

  sudo ln -sf /opt/brackets/brackets "/usr/bin/brackets"

  sudo install -Dm644 installer/linux/debian/brackets.desktop "/usr/share/applications/brackets.desktop"
  sudo sed -i -e 's/Categories=Development/Categories=Development;TextEditor;/g' \
         -e 's|MimeType=text/html;|MimeType=application/javascript;application/json;application/postscript;application/x-csh;application/x-desktop;application/x-httpd-eruby;application/x-httpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-latex;application/x-msdos-program;application/x-ruby;application/x-sh;application/x-shellscript;application/x-sql;application/x-tcl;application/x-tex;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/css;text/csv;text/html;text/plain;text/xml;text/xml-dtd;text/x-asm;text/x-bibtex;text/x-boo;text/x-c++;text/x-c++hdr;text/x-c++src;text/x-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-eiffel;text/x-fortran;text/x-go;text/x-haskell;text/x-java;text/x-java-source;text/x-lua;text/x-makefile;text/x-markdown;text/x-objc;text/x-pascal;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-scala;text/x-scheme;text/x-sh;text/x-tcl;text/x-tex;text/x-vala;text/yaml;|g' "/usr/share/applications/brackets.desktop"

  sudo install -Dm644 installer/linux/debian/package-root/usr/share/icons/hicolor/scalable/apps/brackets.svg "/usr/share/icons/hicolor/scalable/apps/brackets.svg"
  for size in 32 48 128 256; do
    sudo install -Dm644 "out/Release/appshell${size}.png" "/usr/share/icons/hicolor/${size}x${size}/apps/brackets.png"
  done

  # Copy samples
  sudo cp -R "$SRC_DEST/brackets/samples" "/opt/brackets/samples"
  # Copy www
  sudo cp -R "$SRC_DEST/brackets/src" "/opt/brackets/www"
}

export -f brackets_install
