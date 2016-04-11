#!/usr/bin/env bash

layout=$(setxkbmap -query | awk 'END{print $2}')
case $layout in
    us)
        setxkbmap lt
        ;;
    lt)
        setxkbmap us
        ;;
esac
