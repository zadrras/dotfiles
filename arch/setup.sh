#!/usr/bin/env bash

DIR=`dirname $0`

sudo $DIR/install_base_system.sh
# gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
$DIR/install_pacaur.sh
sudo $DIR/install_packages.sh

$DIR/setup_mate.sh
