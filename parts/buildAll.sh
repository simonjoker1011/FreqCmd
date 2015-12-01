#!/bin/bash

cd $1

echo ">> do pull: $1"
echo
git pull origin master
echo

read -e -p "clean & build all? " yn

echo

if [ $yn ]&&[ $yn == "y" ]; then

	nohup gradle cleanall all&> $(date "+%Y%m%d_%H%M%S").txt&
	
	echo "*********************************************"
	echo "*					    *"
	echo "* plz tail $(date "+%Y%m%d_%H%M%S").txt in bddo path *"
	echo "*					    *"
	echo "*********************************************"
	echo
else
	echo ">> canceled"
fi

echo
