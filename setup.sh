#!/usr/bin/env bash

stow --adopt xinitrc
stow --adopt git
git submodule update --init --recursive

stow --adopt ranger
stow --adopt zsh
stow --adopt nvim
stow --adopt bash
stow --adopt xonsh
stow --adopt polybar
stow --adopt i3
stow --adopt termite
stow --adopt alacritty
stow --adopt makepkg

nvim +'PlugInstall | qall'

systemctl enable thinkfan
systemctl enable laptop-mode

sudo cp scripts/* /usr/local/bin/
sudo cp systemd_services/* /etc/systemd/system/
systemctl enable i3lock
