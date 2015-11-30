#!/bin/bash
source $parts/env.sh
operBox=$parts/onesvc/operBox.sh


clear

cmd=0

until [ $cmd == "b" ]
do
	$operBox

        read -e -p "command: " cmd

        if [ -z $cmd ]
        then
                cmd=0
        fi

        case $cmd in

                "1")
                        echo ">> retag"
			echo
                        ;;
                "2")
                        echo ">> append change-Id on commit"
                        echo
                        ;;
		"3")
                        echo ">> push to gerrit"			
			echo
			;;
		"4")
			echo ">> checkout to master"
			echo
			;;
		"5")
			echo ">> checkout to off branch"
			echo
			;;
		"6")
			echo ">> check diff between int and off tags"
			echo
			;;
                "b")
                        ;;
                *)
                        echo ">> plz select a command above!!"
                        echo
                        ;;
        esac
	echo
done

echo

