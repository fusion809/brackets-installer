printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is the default] "
read preference

if [[ $preference == "A" ]]; then

  sudo dnf copr enable mosquito/brackets
  sudo dnf update
  sudo dnf install -y brackets

elif [[ $preference == "B" ]]; then

  fedora-build

fi
