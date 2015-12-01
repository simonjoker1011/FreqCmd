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
echo "to which branch? "
echo "	1) $bddoOffBranch"
echo "	2) $bddcOffBranch"
echo "	3) $skypOffBranch"

read -p ">> " branch
echo

case $branch in
	"1")
		checkout $svc $bddoOffBranch
		;;
	"2")
		checkout $svc $bddcOffBranch
		;;
	"3")
		checkout $svc $skypOffBranch
		;;
esac

echo


