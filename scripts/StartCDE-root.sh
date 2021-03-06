#!/bin/sh

## kill off xserver.  For example, if you are running lightdm:
systemctl stop lightdm

## note, you do not need to run rpc.ttdbserver.  If you *really* want to,
## then start it with /usr/dt/bin/rpc.ttdbserver and confirm its running
## rpcinfo -p

export PATH=$PATH:/usr/dt/bin
export LANG=C
cd /usr/dt/bin
./dtlogin

## EOF
