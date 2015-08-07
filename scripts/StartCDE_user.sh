#!/bin/sh

# kill off xserver.  For example, if you are running lightdm:
sudo systemctl stop lightdm

# note, you do not need to run rpc.ttdbserver.  If you *really* want to,  
# then start it with /usr/dt/bin/rpc.ttdbserver and confirm its running
# rpcinfo -p

# You can log off root and into your regular user here

# add /usr/dt/bin to your PATH
export PATH=$PATH:/usr/dt/bin
export LANG=C
# Start CDE
startx /usr/dt/bin/Xsession

## EOF
