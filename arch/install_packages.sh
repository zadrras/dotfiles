#!/usr/bin/env sh

pacaur -Syu `cat pacman_deps.txt` --needed

pip install --upgrade --user -r pip_deps.txt
