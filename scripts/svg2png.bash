#!/usr/bin/env bash

__dir="$1"
echo 'Using '$__dir
for file in $(find "$__dir" -depth -name '*.svg')
do
echo 'Converting '$file
rsvg-convert "$file" -o $(echo "$file" | sed -e 's/svg$/png/')
done

## EOF
