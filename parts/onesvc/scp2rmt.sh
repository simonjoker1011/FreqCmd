#!/bin/bash

source $parts/env.sh

read -e -p "scp which svc to remote(tpe116)? " svc
echo ">> scp $svc to tpe116"

scp -r $skyPath/$svc/src simonhuang@192.168.1.116:$skyPath/$svc

echo
echo done!!
echo
