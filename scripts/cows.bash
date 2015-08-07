#!/usr/bin/env bash

for cf in $(cowsay -l | tail -n +2); do
    echo $cf
	uname -a | cowsay -f $cf
	echo
done

exit 0

## EOF
