#!/bin/bash
source $parts/env.sh

clear

echo
echo "##############################################"
echo "#                svc operation               #"
echo "##############################################"
echo
echo    "[1]  retag"
echo    "[2]  append change-Id on latest commit"
echo    "[3]  push to gerrit"
echo	"[4]  checkout to master"
echo	"[5]  checkout to off branch"
echo	"[6]  check if int and off tag on the same commit"
echo
echo    "[B]ack"
echo

