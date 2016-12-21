#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

PATH=$PATH:/usr/bin/core_perl:/usr/local/bin
LANG=en_US.UTF-8
EDITOR=nvim