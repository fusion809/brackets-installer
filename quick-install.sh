#!/bin/bash

# This is a quick install script to install Brackets ASAP
export REPO=https://github.com/fusion809/brackets-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the brackets-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/brackets-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the brackets-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/brackets-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of brackets-installer. ==>\n"
    ## git
    if [[ -d $GHUBM/brackets-installer/.git ]]; then
      cd $GHUBM/brackets-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/brackets-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/brackets-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUBM
    fi

  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/brackets-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the brackets-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/brackets-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of brackets-installer. ==>\n"

    ## git
    if [[ -d $GHUB/brackets-installer/.git ]]; then
      cd $GHUB/brackets-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/brackets-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/brackets-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/brackets-installer-master/brackets-installer/ -C $GHUB
    fi
  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/brackets-installer ]]; then
  cd $GHUB/brackets-installer
  ./installer.sh
elif [[ -d $GHUBM/brackets-installer ]]; then
  cd $GHUBM/brackets-installer
  ./installer.sh
fi
