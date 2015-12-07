#! /bin/bash

cmd=0

until [ $cmd == 'q' ]
do
	read -e cmd

	if [ -z $cmd ]; then
		cmd=0
	elif [ $cmd == 'q' ]; then
		break
	else
		$cmd
	fi

	echo
done
