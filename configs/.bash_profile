#!/usr/bin/env bash

#
# ~/.bash_profile
#

## Pick up all the stuff from user's config if it's present
[[ -r ~/.bashrc ]] && . ~/.bashrc

## Set user-specific env. vars
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export PATH=$PATH:/usr/dt/bin:$HOME/bin:$HOME/opt/bin:$HOME/.local/bin
