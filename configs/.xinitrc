#!/bin/sh

##
## ~/.xinitrc
##


## This script is called from `startx' (and other programs which call `xinit').
## NOTE: This script is evaluated by POSIX shell (`/bin/sh', typically
## provided by Dash).  You should avoid using features that are
## not supported in POSIX shell.  See `mywiki.wooledge.org/Bashism'.
## NOTE: `.xinitrc' is only for configuring the initialization of `xinit'.
## If you want the script to be called whenever an X Session is started,
## then you should use `.xsession' instead.


if [ -d '/etc/X11/xinit/xinitrc.d' ]; then
    for __script__ in '/etc/X11/xinit/xinitrc.d/'*; do
        [ -x "${__script__}" ] && source "${__script__}"
    done

    unset __script__
fi


## Run Window Manager of your choice from here:
# export DE='gnome'
# exec gnome-session

# export DE='kde'
# exec startkde

# export DE='xfce'
# exec startxfce4

## EOF
