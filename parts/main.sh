#!/bin/bash
source $parts/env.sh

function press2continue(){
	
	echo	
	echo "press return button to continue."
	read -s

}


	case $1 in
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
			press2continue
			;;
		"6")
			echo ">> grep string in debug log (TBD)"
			echo
			;;
		"8")
			echo "gradle clean & build"
			echo
			$parts/buildAll.sh $bddoPath
			press2continue
			;;
		"10")
			echo ">> append change-Id in svc"
			echo
	                $parts/apdIdSvc.sh		
			press2continue	
			;;
		"11")
			echo ">> unzip ear (TBD)"
			echo
			;;
		"t")
			echo ">> input custom command (press q to exit)"
			echo
			$parts/testCommand.sh
			echo
			press2continue
			;;
		"e")
			echo ">> edit test script"
			echo
			vim $basePath/test.sh
			;;
		"r")
			echo ">> run test script"
			echo
			$basePath/test.sh
			press2continue
			;;
		"s")
			echo ">> entering option menu"
			echo
		        $parts/optionBox.sh			
			;;

		"m")
			clear
			cat $parts/memo.txt
			press2continue
			;;
		"q")
			echo ">> exit"
			echo
			
			;;
		"b")
			echo ">> backup system"
			echo
			press2continue
			;;
		*)
			echo ">> plz select a command above"
			echo
			press2continue
			;;
	esac















