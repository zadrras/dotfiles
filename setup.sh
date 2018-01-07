#!/usr/bin/env bash

stow xinitrc
stow git
git submodule update --init --recursive

stow ranger
stow zsh
stow nvim
stow bash
stow xonsh
stow polybar
stow i3
stow termite

nvim +'PlugInstall | qall'

systemctl enable thinkfan
systemctl enable laptop-mode
