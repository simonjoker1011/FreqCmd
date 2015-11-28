#!/bin/bash
clear

$basePath/commandBox.sh
source $basePath/env.sh


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
			echo ">> fetch all svc tags"
			echo
			$basePath/allsvc/operBox.sh
        	        ;;
	        "2")
	                echo ">> retag 1 svc tag"
			echo
			$basePath/retag.sh
	                ;;
		"5")
			echo ">> download android apk & ios ipa"
			echo
	                $basePath/downloadClient.sh $bddoPath			
			;;
		"6")
			echo ">> grep string in debug log (TBD)"
			echo
			;;
		"7")
			echo ">> checkout branch"
			echo
			$basePath/checkoutBranch.sh
			;;	
		"8")
			echo ">> push to gerrit"
			echo
	                $basePath/push2Gerrit.sh			
			;;
		"9")
			echo ">> append change-Id on commit"
			echo
	                $basePath/apdIdCmt.sh			
			;;
		"10")
			echo ">> append change-Id in svc"
			echo
	                $basePath/apdIdSvc.sh			
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
			;;
		"s")
			echo ">> entering option menu"
			echo
		        $basePath/optionBox.sh			
			;;

		"q")
			echo ">> exit"
			echo
			break
			;;
		*)
			echo ">> plz select a command above"
			echo
			;;
	esac
		 
	echo "press return button to continue."
	read -s
	clear
	$basePath/commandBox.sh
done















