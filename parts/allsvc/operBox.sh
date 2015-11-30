#!/bin/bash
source $parts/env.sh

clear

echo
echo "##############################################"
echo "#              All svc operation             #"
echo "##############################################"
echo
echo    "[1]  fetch tags"
echo	"[2]  checkout to master"
echo	"[3]  checkout to off branch"
echo	"[4]  check if int and off tag on the same commit"
echo
echo    "[B]ack"
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

                "1")
                        echo ">> fetch tags "
			echo
			$parts/allsvc/fetchAllTags.sh $bddoPath
                        ;;
                "2")
                        echo ">> checkout to master"
                        echo
 			$parts/allsvc/checkMaster.sh $bddoPath
                        ;;
		"3")
			echo ">> checkout to off branch"
			echo
			$parts/allsvc/checkOff.sh $bddoPath
			;;
		"4")
			echo ">> check int and off tag"
			echo
			$parts/allsvc/checkIntOffTag.sh $bddoPath
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

