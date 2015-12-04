#!/bin/bash

echo "D 	$(date +"%D")"
echo "YmdHMS 	$(date +"%Y_%m_%d_%H_%M_%S")"

echo $basePath
echo $parts

echo

cd $basePath/ClientApps

pwd
files=$(ls $basePath/ClientApps)

#echo $files

latesttime=0
latestfile=0
time=0
filetime=0

for file in $files
do		
	printf "[ $file ]\n" 
	printf ">> `stat -c %Y $file`\n"
	printf ">> `stat -c %y $file`\n"
	filetime=`stat -c %Y $file`
	if [ $filetime>$time ]; then
		time=$filetime
		latesttime=`stat -c %y $file`
		latestfile=$file
		

	printf "$time	$latesttime	$latestfile"
	echo

	fi
done

echo
printf "latest \nfile: $latestfile \ntime: $latesttime"
