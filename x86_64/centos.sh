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

  centos-build

fi
