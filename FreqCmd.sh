#!/bin/bash

clear

export parts=$basePath/parts
$parts/commandBox.sh

source $parts/env.sh


no=0

until [ $no == "q" ]
do
	read -e -p "command: " no
	echo

	if [ -z $no ]
		then
		no=0
	fi

	$parts/main.sh $no


	clear		 
	$parts/commandBox.sh
done















