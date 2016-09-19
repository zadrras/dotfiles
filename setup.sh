#!/usr/bin/env bash

stow git
git submodule update --init --recursive

stow ranger
stow fish
stow nvim
nvim +'PlugInstall | qall'
