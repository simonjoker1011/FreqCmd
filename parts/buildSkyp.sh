#!/bin/bash

cd $1

# echo ">> do pull: $1"
# echo
# git pull origin master
# echo
read -s -p "plz ensure have already done checkout job" yn1
echo

read -e -p "clean & build all? (y/n) " yn

echo

if [ $yn ]&&[ $yn == "y" ]; then

        if [ -f *.txt ]; then
                rm *.txt
        fi

	if [ -f skyp-* ]; then
                rm bddo-*
        fi

	nohup gradle cleanall all tarprod&> $(date "+%Y%m%d_%H%M%S").txt&
	
	echo "*********************************************"
	echo "*					    *"
	echo "* plz tail $(date "+%Y%m%d_%H%M%S").txt in skyp path *"
	echo "*					    *"
	echo "*********************************************"
	echo
else
	echo ">> canceled"
fi

echo
