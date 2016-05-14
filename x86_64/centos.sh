#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if [[ $preference == "A" ]]; then

  cd /etc/yum.repos.d/
  wget -cqO- https://copr.fedorainfracloud.org/coprs/mosquito/brackets/repo/epel-7/mosquito-brackets-epel-7.repo > /tmp/mosquito-brackets-epel-7.repo
  sudo mv /tmp/mosquito-brackets-epel-7.repo /etc/yum.repos.d/
  sudo yum update
  sudo yum install -y brackets
  cd -

else

  if ! [[ -f /usr/lib/libudev.so.0 ]]; then
    curl -sL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.x86_64.rpm > /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm
    if ! `comex bsdtar`; then
      sudo yum install -y bsdtar
    fi
    bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm -C /tmp
    sudo cp -a /tmp/lib64/libudev.so.0* /usr/lib/
  fi
  centos-build

fi
