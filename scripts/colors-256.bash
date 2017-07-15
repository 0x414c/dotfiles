#!/usr/bin/env bash

## This program is free software. It comes without any warranty, to
## the extent permitted by applicable law. You can redistribute it
## and/or modify it under the terms of the Do What The Fuck You Want
## To Public License, Version 2, as published by Sam Hocevar. See
## http://sam.zoy.org/wtfpl/COPYING for more details.

## Foreground/Background
for fgbg in 38 48; do
    ## Colors
    for color in {0..256}; do
        ## Display the color
        echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
        ## Display 10 colors per lines
        if [[ $((($color + 1) % 10)) == 0 ]]; then
            ## New line
            echo
        fi
    done
    ## New line
    echo
done

## EOF
