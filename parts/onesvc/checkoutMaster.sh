#!/bin/bash

function checkout(){
	cd $skyPath/$1
	git checkout $2
	
	echo
	echo "have checkout $1 to $2"
	echo

	read -e -p "do pull from $2? (y/n) " yn
	echo

	if [ $yn ]&&[ $yn == "y" ]
	then
		pull $1 $2
	fi
}
function pull(){
	git pull origin $2
	echo
	echo ">> head of $1 is now on"
	echo
	git log --stat -1
}

source $parts/env.sh

read -e -p "checkout which svc? " svc
echo
		checkout $svc master

