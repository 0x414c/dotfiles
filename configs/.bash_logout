#!/usr/bin/env bash

##
## ~/.bash_logout
##


## When leaving the console clear the screen to increase privacy
## NOTE: `tput' is a part of `ncurses'
if [[ "${SHLVL}" == 1 ]]; then
    [[ "$(command -v 'tput')" != 0 ]] && { command tput clear; command tput reset; }
fi

## EOF
