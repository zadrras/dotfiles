#!/usr/bin/env bash

HOME=$HOME
PWD=`pwd`

#Arch icon for menu button
cp $PWD/arch-icon/start-here.png /usr/share/icons/Adwaita/24x24/places/start-here.png
cp $PWD/arch-icon/start-here.svg /usr/share/icons/Adwaita/scalable/places/start-here.svg

#Mate themes
mkdir -p $HOME/.themes
cp $PWD/mate-themes/themes/* $HOME/.themes/ -r

#Mate panel
cp $PWD/mate-panel/my.layout /usr/share/mate-panel/layouts/
mate-panel --layout my --reset
