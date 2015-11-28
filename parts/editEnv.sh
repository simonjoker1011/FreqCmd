#!/bin/bash

echo "plz input 1) old position 2) new position: "
read -e -p ">> " oldpos newpos

if [ $oldpos ]&&[ $newpos ]
then
	sed -ie "s/$oldpos/$newpos/g" $parts/env.sh
	echo
	echo ">> done!!"
	echo
fi
