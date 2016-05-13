#!/bin/bash

# This is a quick install script to install brackets ASAP
export REPO=https://github.com/fusion809/brackets-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/brackets-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the brackets-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/brackets-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
    fi
  else
    printf "The brackets-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if [[ -d $GHUBM/brackets-installer/.git ]]; then
        cd $GHUBM/brackets-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUBM/brackets-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUBM/brackets-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUBM/brackets-installer
  ./installer.sh
else
  cd $GHUB

  if ! [[ -d $GHUB/brackets-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the brackets-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/brackets-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
    fi
  else
    printf "The brackets-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if [[ -d $GHUB/brackets-installer/.git ]]; then
        cd $GHUB/brackets-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUB/brackets-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUB/brackets-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUB/brackets-installer
  ./installer.sh
fi
