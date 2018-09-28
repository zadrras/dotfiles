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
stow alacritty

nvim +'PlugInstall | qall'

systemctl enable thinkfan
systemctl enable laptop-mode

sudo cp scripts/* /usr/local/bin/
sudo cp systemd_services/* /etc/systemd/system/
systemctl enable i3lock
