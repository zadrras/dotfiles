#!/usr/bin/env bash

git submodule update --init --recursive

nvim +PlugInstall +qall
