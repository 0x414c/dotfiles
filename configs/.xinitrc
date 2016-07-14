#!/bin/sh

##
## ~/.xinitrc
##


## Executed by `startx' (run your window manager from here)


if [ -d '/etc/X11/xinit/xinitrc.d' ]; then
    for f in '/etc/X11/xinit/xinitrc.d/'*; do
      [ -x "${f}" ] && source "${f}"
    done
  
    unset f
fi


# export DE='gnome'
# exec gnome-session

# export DE='kde'
# exec startkde

# export DE='xfce'
# exec startxfce4
## ...or the Window Manager of your choice

## EOF
