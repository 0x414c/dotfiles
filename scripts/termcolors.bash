#!/bin/bash

## termcolors - display all terminal color combinations
## Steve Kinzler, steve@kinzler.com, Nov 98
## http://kinzler.com/me/home.html#unixcfg

## direct adaptation of a script in the Colour-ls mini-HOWTO document

esc='['

cat <<'EOF'
      40      41      42      43      44      45      46      47
EOF

for fore in 30 31 32 33 34 35 36 37; do
    line1="${fore} "
    line2='   '
    for back in 40 41 42 43 44 45 46 47; do
        line1="${line1}${esc}${fore};${back}m  Norm  ${esc}0m"
        line2="${line2}${esc}01;${fore};${back}m  Bold  ${esc}0m"
    done
    echo "${line1}"; echo "${line2}"
done
