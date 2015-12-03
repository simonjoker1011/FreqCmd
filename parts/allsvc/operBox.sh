#!/bin/bash
source $parts/env.sh
all=$parts/allsvc

clear

echo
echo "##############################################"
echo "#              All svc operation             #"
echo "##############################################"
echo
echo    "[1]  fetch & fetch tags"
echo	"[2]  checkout to master"
echo	"[3]  checkout to off branch"
echo	"[4]  check if int and off tag on the same commit"
echo	"[5]  delete current off branch"
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
                        echo ">> fetch "
			echo
			$all/fetchAllTags.sh $bddoPath
                        ;;
                "2")
                        echo ">> checkout to master"
                        echo
 			$all/checkMaster.sh $bddoPath
                        ;;
		"3")
			echo ">> checkout to off branch"
			echo
			$all/checkOff.sh $bddoPath
			;;
		"4")
			echo ">> check int and off tag"
			echo
			$all/checkIntOffTag.sh $bddoPath
			;;
		"5")	
			echo ">> delete current off branch"
			echo
			$all/deleteBranch.sh
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

