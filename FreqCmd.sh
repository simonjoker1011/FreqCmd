#!/bin/bash

function press2continue(){
	
	echo "press return button to continue."
	read -s

}


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

	case ${no} in
        	"1")
			$parts/allsvc/operBox.sh
        	        ;;
	        "2")
			$parts/onesvc/operation.sh
	                ;;
		"5")
			echo ">> download android apk & ios ipa"
			echo
	                $parts/downloadClient.sh $bddoPath			
			;;
		"6")
			echo ">> grep string in debug log (TBD)"
			echo
			;;
		"7")
			echo ">> checkout branch"
			echo
			$parts/checkoutBranch.sh
			;;	
		"8")
			echo ">> push to gerrit"
			echo
	                $parts/push2Gerrit.sh			
			;;
		"9")
			echo ">> append change-Id on commit"
			echo
	                $parts/apdIdCmt.sh			
			;;
		"10")
			echo ">> append change-Id in svc"
			echo
	                $parts/apdIdSvc.sh			
			;;
		"11")
			echo ">> unzip ear (TBD)"
			echo
			;;
		"t")
			echo ">> input custom command"
			echo
			read -e cmd
			$cmd 
			echo
			press2continue
			;;
		"s")
			echo ">> entering option menu"
			echo
		        $parts/optionBox.sh			
			;;

		"q")
			echo ">> exit"
			echo
			break
			;;
		*)
			echo ">> plz select a command above"
			echo
			press2continue
			;;
	esac
	
	clear		 
	$parts/commandBox.sh
done















