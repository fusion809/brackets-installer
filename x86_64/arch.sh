#!/bin/bash

if comex brackets; then                       # Check if Brackets is already installed

  printf "Brackets is already installed!"

else

  printf "Would you rather install Brackets from: A) a Debian binary (faster) or B) from source (slower, but more reliable)? [A/B] "
  read preference

  if [[ $preference == "A" ]]; then
    brackaur bin
  elif [[ $preference == "B" ]]; then
    brackaur
  fi

fi
