#!/bin/bash

cd $1

gradle forall -Pcmd="git reset HEAD --hard && git checkout master"

read -p "do pull from master branch? (y/n) " yn

if [ $yn == y ] 
then
	gradle forall -Pcmd="git pull origin master"
fi
