#!/bin/bash

source $parts/env.sh


function checkoutNdelete(){
	echo 
	echo "checkout to master & delete branch $1"

	cd $2
	gradle forapps -Pcmd="git reset HEAD --hard && git checkout master"
	gradle forapps -Pcmd="git branch -D $1"
}

echo "current off branch: "
echo "			skyp:	$skypOffBranch"
echo "			bddc:	$bddcOffBranch"
echo "			bddo:	$bddoOffBranch"
echo

read -e -p "sure to delete? (y/n) " yn

if [ $yn ]&&[ $yn=="y" ]; then

	checkoutNdelete $skypOffBranch $skypPath
	checkoutNdelete $bddcOffBranch $bddcPath
	checkoutNdelete $bddoOffBranch $bddoPath

else
	echo
	echo ">> canceled"
fi
