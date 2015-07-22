#!/bin/bash

CHEF_VERSION="0.6.2-1"
CHEF_DEB=chefdk_${CHEF_VERSION}_amd64.deb
if ! command -v berks &>/dev/null; then
  \curl -sSL "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/${CHEF_DEB}" -o $CHEF_DEB
  sudo dpkg -i $CHEF_DEB
  rm -f $CHEF_DEB
fi
