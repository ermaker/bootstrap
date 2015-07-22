#!/bin/bash

VAGRANT_VERSION="1.7.3"
VAGRANT_DEB=vagrant_${VAGRANT_VERSION}_x86_64.deb
if ! command -v vagrant &>/dev/null; then
  wget "https://dl.bintray.com/mitchellh/vagrant/${VAGRANT_DEB}"
  sudo dpkg -i $VAGRANT_DEB
  rm -f $VAGRANT_DEB
fi
