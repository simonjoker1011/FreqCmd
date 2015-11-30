#!/bin/bash

function pull(){

read -e -p "pull from $2? (y/n) " yn

if [ $yn ]; then
	if [ $yn == "y" ]; then
		echo
		cd $1 
		gradle cobranch
	else
		echo ">> dont pull"
	fi
else
	echo ">> dont pull"
fi

echo
}


source $parts/env.sh

cd $1

gradle forskyp -Pcmd="git clean -fd && git reset HEAD --hard && git checkout $skypOffBranch"

pull $skypPath $skypOffBranch

cd $1

gradle forbddc -Pcmd="git clean -fd && git reset HEAD --hard && git checkout $bddcOffBranch"

pull $bddcPath $bddcOffBranch

cd $1

gradle forapps -Pcmd="git clean -fd && git reset HEAD --hard && git checkout $bddoOffBranch"

pull $bddoPath $bddoOffBranch

