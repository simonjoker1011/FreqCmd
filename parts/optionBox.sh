#!/bin/bash
source $basePath/env.sh

clear

echo
echo "##############################################"
echo "#                Setup Menu                  #"
echo "##############################################"
echo
echo	"[S]how all env variable"
echo	"[E]dit env variable"
echo	"[B]ack"
echo

cmd=0

until [ $cmd == "b" ]
do
	read -e -p "command: " cmd

	if [ -z $cmd ]
	then
		cmd=0
	fi

	case $cmd in

		"s")
			echo ">> show all env variable: "
			echo
			cat $basePath/env.sh
			echo
			;;
		"e")
			echo ">> edit env variable"
			echo
#			cat $basePath/env.sh
			$basePath/editEnv.sh
			;;
		"b")
			;;
		*)
			echo ">> plz select a command above!!"
			echo
			;;
	esac
done

echo
