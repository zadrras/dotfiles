#!/usr/bin/env bash

stow git
git submodule update --init --recursive

stow ranger
stow fish
stow nvim
stow bash
stow xonsh
stow polybar
stow i3
stow termite

nvim +'PlugInstall | qall'
