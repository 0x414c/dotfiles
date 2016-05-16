#!/usr/bin/env bash

#
# ~/.bash_profile
#

## Pick up all the stuff from user's config if it's present
[[ -r $HOME'/.bashrc' ]] && source $HOME'/.bashrc'

## Set user-specific environment vars
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export GDK_USE_XFT=1
export QT_XFT=1
export PATH=$PATH":/usr/dt/bin:$HOME/bin:$HOME/opt/bin:$HOME/.local/bin:$HOME/dotfiles/scripts"
