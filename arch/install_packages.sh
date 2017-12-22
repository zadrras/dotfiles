#!/usr/bin/env sh

pacaur -Syu `cat pacman_deps.txt` --needed
