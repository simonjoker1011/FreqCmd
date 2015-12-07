#!/bin/bash

echo "D 	$(date +"%D")"
echo "YmdHMS 	$(date +"%Y_%m_%d_%H_%M_%S")"

echo $basePath
echo $parts

echo

cd $basePath/ClientApps

pwd
files=$(ls $basePath/ClientApps)
echo

#echo $files

echo ============= part1 =============

filesBT=$(ls -alt $basePath/ClientApps)

# echo $filesBT

 echo $filesBT





echo ============= part2 =============

latesttime=0
latestfile=0
time=0
# filetime=0

for file in $files
do	
	echo
	ls
	echo
	
	printf "[ $file ]\n" 
	printf ">> `stat -c %Y $file`\n"
	printf ">> `stat -c %y $file`\n"
	filetime=`stat -c %Y $file`
	if [ $filetime-$time>0 ]; then
		time=$filetime
		latesttime=`stat -c %y $file`
#		latestfile=$file
		
		printf "$time	$latesttime	$latestfile"
		echo
	else 
		echo less
	fi
	
	echo
done

echo
printf "latest \nfile: $latestfile \ntime: $latesttime"
