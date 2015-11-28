#!/bin/bash

function checkout(){
	cd $skyPath/$1
	git checkout $2
	
	echo "have checkout $1 to $2"
	echo

	read -e -p "do pull from $2? (y/n) " yn
	echo

	if [ $yn == "y" ]
	then
		pull $2
	fi
}
function pull(){
	git pull origin $1
}

source $basePath/env.sh

read -e -p "checkout which svc? " svc

echo
echo "to which branch? "
echo "	1) master"
echo "	2) $bddoOffBranch"
echo "	3) $bddcOffBranch"
echo "	4) $skypOffBranch"

read -p ">> " branch
echo

case $branch in
	"1")
		checkout $svc master
		;;
	"2")
		checkout $svc $bddoOffBranch
		;;
	"3")
		checkout $svc $bddcOffBranch
		;;
	"4")
		checkout $svc $skypOffBranch
		;;
esac

echo


