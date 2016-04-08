#!/usr/bin/env bash

DIR=`dirname $0`

sudo $DIR/install_base_system.sh
$DIR/install_yaourt.sh
sudo $DIR/install_packages.sh

$DIR/setup_mate.sh
