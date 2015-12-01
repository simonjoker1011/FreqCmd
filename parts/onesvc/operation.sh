#!/bin/bash
source $parts/env.sh
thisfolder=$parts/onesvc

function press2continue(){

        echo "press return button to continue."
        read -s

}

clear

cmd=0

until [ $cmd == "b" ]
do
	$thisfolder/operBox.sh

        read -e -p "command: " cmd

        if [ -z $cmd ]
        then
                cmd=0
        fi

        case $cmd in

		"1")
			echo ">> tag on commit"
			;;
                "2")
                        echo ">> retag"
			echo
			$thisfolder/retag.sh
                        ;;
 		"3")
			echo ">> checkout to master"
			echo
			$thisfolder/checkoutMaster.sh
			;;
		"4")
			echo ">> checkout to off branch"
			echo
			$thisfolder/checkoutBranch.sh
			;;
	        "5")
                        echo ">> append change-Id on commit"
                        echo
			$thisfolder/apdIdCmt.sh
                        ;;
		"6")
                        echo ">> push to gerrit"			
			echo
			$thisfolder/push2Gerrit.sh
			;;
		"7")
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
	press2continue
done

echo

