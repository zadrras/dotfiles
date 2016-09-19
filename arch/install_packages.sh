#!/usr/bin/env sh

pacaur -Syu `cat pacman_deps.txt` --needed

sudo pip install --upgrade -r pip_deps.txt
