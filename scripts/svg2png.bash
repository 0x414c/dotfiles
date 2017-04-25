#!/usr/bin/env bash

dir="${1}"
echo "Using ${dir}"
for file in $(find "${dir}" -depth -name '*.svg'); do
    echo "Converting ${file}"
    rsvg-convert "${file}" -o $(echo "${file}" | sed -e 's/svg$/png/')
done

## EOF
