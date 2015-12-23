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
			echo ">> scp src to remote"
			$thisfolder/scp2rmt.sh
			press2continue
			;;
		"3")
			echo ">> tag on commit"
			press2continue
			;;
                "4")
                        echo ">> retag"
			echo
			$thisfolder/retag.sh
                	press2continue
		        ;;
 		"5")
			echo ">> checkout to master"
			echo
			$thisfolder/checkoutMaster.sh
			press2continue
			;;
		"6")
			echo ">> checkout to off branch"
			echo
			$thisfolder/checkoutBranch.sh
			press2continue
			;;
	        "7")
                        echo ">> append change-Id on commit"
                        echo
			$thisfolder/apdIdCmt.sh
		 	press2continue
                       ;;
		"8")
                        echo ">> push to gerrit"			
			echo
			$thisfolder/push2Gerrit.sh
			press2continue
			;;
		"9")
			echo ">> check diff between int and off tags"
			echo
			press2continue
			;;
                "b")
                        ;;
                *)
                        echo ">> plz select a command above!!"
                        echo
		 	press2continue
                       ;;
        esac
	echo
done

echo

