#!/bin/bash
function ${lowedit}_install {
  if [[ $DEST_TYPE == "system" ]]; then
    cd $SRC_DEST/${lowedit}-shell
    sudo install -dm755 "/opt/${lowedit}"
    sudo cp -R out/Release/lib "/opt/${lowedit}/lib"
    sudo cp -R out/Release/locales "/opt/${lowedit}/locales"
    sudo cp -R out/Release/node-core "/opt/${lowedit}/node-core"
    sudo install -Dm644 out/Release/cef.pak "/opt/${lowedit}/cef.pak"
    sudo install -Dm644 out/Release/devtools_resources.pak "/opt/${lowedit}/devtools_resources.pak"
    sudo install -Dm755 out/Release/Brackets "/opt/${lowedit}/Brackets"
    sudo install -Dm755 out/Release/Brackets-node "/opt/${lowedit}/Brackets-node"
    sudo install -Dm755 $SRC_DEST/${lowedit}2 "/opt/${lowedit}/${lowedit}"
    for size in 32 48 128 256; do
      sudo install -Dm644 "out/Release/appshell${size}.png" "/opt/${lowedit}/appshell${size}.png"
    done

    sudo ln -sf /opt/${lowedit}/${lowedit} "/usr/bin/${lowedit}"

    sudo install -Dm644 installer/linux/debian/${lowedit}.desktop "/usr/share/applications/${lowedit}.desktop"
    sudo sed -i -e 's/Categories=Development/Categories=Development;TextEditor;/g' \
           -e 's|MimeType=text/html;|MimeType=application/javascript;application/json;application/postscript;application/x-csh;application/x-desktop;application/x-httpd-eruby;application/x-httpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-latex;application/x-msdos-program;application/x-ruby;application/x-sh;application/x-shellscript;application/x-sql;application/x-tcl;application/x-tex;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/css;text/csv;text/html;text/plain;text/xml;text/xml-dtd;text/x-asm;text/x-bibtex;text/x-boo;text/x-c++;text/x-c++hdr;text/x-c++src;text/x-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-eiffel;text/x-fortran;text/x-go;text/x-haskell;text/x-java;text/x-java-source;text/x-lua;text/x-makefile;text/x-markdown;text/x-objc;text/x-pascal;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-scala;text/x-scheme;text/x-sh;text/x-tcl;text/x-tex;text/x-vala;text/yaml;|g' "/usr/share/applications/${lowedit}.desktop"

    sudo install -Dm644 installer/linux/debian/package-root/usr/share/icons/hicolor/scalable/apps/${lowedit}.svg "/usr/share/icons/hicolor/scalable/apps/${lowedit}.svg"
    for size in 32 48 128 256; do
      sudo install -Dm644 "out/Release/appshell${size}.png" "/usr/share/icons/hicolor/${size}x${size}/apps/${lowedit}.png"
    done

    # Copy samples
    sudo cp -R "$SRC_DEST/${lowedit}/samples" "/opt/${lowedit}/samples"
    # Copy www
    sudo cp -R "$SRC_DEST/${lowedit}/src" "/opt/${lowedit}/www"
  else
    cd $SRC_DEST/${lowedit}-shell
    install -dm755 "$HOME/.local/share/${lowedit}"
    cp -R out/Release/lib "$HOME/.local/share/${lowedit}/lib"
    cp -R out/Release/locales "$HOME/.local/share/${lowedit}/locales"
    cp -R out/Release/node-core "$HOME/.local/share/${lowedit}/node-core"
    install -Dm644 out/Release/cef.pak "$HOME/.local/share/${lowedit}/cef.pak"
    install -Dm644 out/Release/devtools_resources.pak "$HOME/.local/share/${lowedit}/devtools_resources.pak"
    install -Dm755 out/Release/Brackets "$HOME/.local/share/${lowedit}/Brackets"
    install -Dm755 out/Release/Brackets-node "$HOME/.local/share/${lowedit}/Brackets-node"
    install -Dm755 $SRC_DEST/${lowedit}2 "$HOME/.local/share/${lowedit}/${lowedit}"
    ln -sf "$HOME/.local/share/${lowedit}/${lowedit}" "$HOME/.local/bin/${lowedit}"

    if ! [[ -d $HOME/.local/share/icons ]]; then
      mkdir -p $HOME/.local/share/icons
    fi

    if ! [[ -d $HOME/.local/share/applications ]]; then
      mkdir -p $HOME/.local/share/applications
    fi

    if ! [[ -d $HOME/.local/bin ]]; then
      mkdir -p $HOME/.local/bin
      printf 'PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
    fi

    install -Dm755 installer/linux/debian/${lowedit}.desktop "$HOME/.local/share/applications/${lowedit}.desktop"
    sed -i -e 's/Categories=Development/Categories=Development;TextEditor;/g' \
           -e 's|MimeType=text/html;|MimeType=application/javascript;application/json;application/postscript;application/x-csh;application/x-desktop;application/x-httpd-eruby;application/x-httpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-latex;application/x-msdos-program;application/x-ruby;application/x-sh;application/x-shellscript;application/x-sql;application/x-tcl;application/x-tex;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/css;text/csv;text/html;text/plain;text/xml;text/xml-dtd;text/x-asm;text/x-bibtex;text/x-boo;text/x-c++;text/x-c++hdr;text/x-c++src;text/x-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-eiffel;text/x-fortran;text/x-go;text/x-haskell;text/x-java;text/x-java-source;text/x-lua;text/x-makefile;text/x-markdown;text/x-objc;text/x-pascal;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-scala;text/x-scheme;text/x-sh;text/x-tcl;text/x-tex;text/x-vala;text/yaml;|g' \
           -e "s|/opt|$HOME/.local/share|g" "$HOME/.local/share/applications/${lowedit}.desktop"

    install -Dm755 installer/linux/debian/package-root/usr/share/icons/hicolor/scalable/apps/${lowedit}.svg \
    "$HOME/.local/share/icons/hicolor/scalable/apps/${lowedit}.svg"

    for size in 32 48 128 256; do
      install -Dm755 "out/Release/appshell${size}.png" "$HOME/.local/share/icons/appshell${size}.png"
    done

    for size in 32 48 128 256; do
      install -Dm755 "out/Release/appshell${size}.png" "$HOME/.local/share/icons/hicolor/${size}x${size}/apps/${lowedit}.png"
    done

    # Copy samples
    cp -R "$SRC_DEST/${lowedit}/samples" "$HOME/.local/share/${lowedit}/samples"
    # Copy www
    cp -R "$SRC_DEST/${lowedit}/src" "$HOME/.local/share/${lowedit}/www"
  fi
}

export -f ${lowedit}_install
