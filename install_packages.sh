#!/usr/bin/env bash

pacman -S --needed base-devel git xclip ctags

git clone https://aur.archlinux.org/package-query-git.git
cd package-query-git
makepkg -si
cd ..
rm package-query-git -rf

git clone https://aur.archlinux.org/yaourt-git.git
cd yaourt-git
makepkg -si
cd ..
rm yaourt-git -rf
