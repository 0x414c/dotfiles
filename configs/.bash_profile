#!/usr/bin/env bash

##
## ~/.bash_profile
##


## Pick up all the stuff from user's config if it's present
[[ -r "${HOME}"'/.bashrc' ]] && command source "${HOME}"'/.bashrc'


## Set user-specific environment vars
command export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
command export GDK_USE_XFT=1
command export QT_XFT=1
command export PATH="${PATH:+${PATH}:}""/usr/dt/bin:${HOME}/bin:${HOME}/opt/bin:${HOME}/local/bin:${HOME}/dotfiles/scripts"

## EOF
