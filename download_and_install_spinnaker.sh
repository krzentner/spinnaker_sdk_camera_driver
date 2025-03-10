#!/usr/bin/env bash
set -x

CWD=`pwd`

export DEBIAN_FRONTEND=noninteractive

# install basic packages
sudo apt-get update
sudo apt-get install -q -y --no-install-recommends \
    build-essential tree wget dirmngr gnupg2 vim nano git debconf-utils libunwind-dev iputils-ping dialog apt-utils

wget https://coe.northeastern.edu/fieldrobotics/spinnaker_sdk_archive/spinnaker-$SPINNAKER_VERSION-$SPINNAKER_LINUX_ARCH-pkg.tar.gz -nv

tar -zxvf spinnaker-$SPINNAKER_VERSION-$SPINNAKER_LINUX_ARCH-pkg.tar.gz
cd spinnaker-$SPINNAKER_VERSION-$SPINNAKER_LINUX_ARCH

# auto accept spinnaker license agreements
echo libspinnaker libspinnaker/present-flir-eula note '' | sudo debconf-set-selections
echo libspinnaker libspinnaker/accepted-flir-eula boolean true | sudo debconf-set-selections

sudo dpkg -i *.deb

cd ..

