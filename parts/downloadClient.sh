source $parts/env.sh
PATCH_DATE=`date +%Y%m%d`

function doDownload () 
{
	if [ ! -d $basePath/ClientApps ]
	then
		echo make dir ClientApps
		mkdir ClientApps
	fi

	cd $basePath/ClientApps/

	if [ ! -d "$PATCH_DATE" ]
	then
		echo make dir $PATCH_DATE
		mkdir $PATCH_DATE
	fi

	cd $PATCH_DATE

	echo download android apk:
	scp bddandadm0@192.168.1.29:/home/bddandadm0/dev/sky/sku/prod/android/bddi-*.apk .
	
	if [ -f bddi-$bddo_tag-$PATCH_DATE.apk ]
	then
		cp $parts/aIntegration.js .	
		sed -i "s/bddo_tag/$bddo_tag/g" aIntegration.js
		sed -i "s/date&time/$(date "+%Y\/%m\/%d") $(date "+%H:%M:%S")/g" aIntegration.js
		sed -i "s/date/$(date "+%Y%m%d")/g" aIntegration.js
	else
		echo no apk: v$bddo_tag
	fi
	
	echo
	echo download ios ipa:
	scp iosadm01@192.168.1.23:/Users/iosadm01/Desktop/BuddyDo\\\ `date +%Y"-"%m"-"%d`*/BuddyDo.ipa .

	if [ -f BuddyDo.ipa ]
	then
		mv BuddyDo.ipa bddi-$bddo_tag-$PATCH_DATE.ipa
		cp $parts/iIntegration.js .
		cp $parts/manifesti.plist .

		sed -i "s/bddo_tag/$bddo_tag/g" iIntegration.js
		sed -i "s/date&time/$(date "+%Y\/%m\/%d") $(date "+%H:%M:%S")/g" iIntegration.js
	        sed -i "s/bddo_tag/$bddo_tag/g" manifesti.plist
	        sed -i "s/date/$(date "+%Y%m%d")/g" manifesti.plist
	else
		echo no ipa: v$bddo_tag
		echo
	fi

}


read -e -p "Tag Name (press q to exit): " bddo_tag

if [ -z "$bddo_tag" ]; then

	echo 
	echo "plz input tag name!!"
	echo
elif [ $bddo_tag == "q" ]; then

	echo
	echo "exit"
	echo
else
	echo
	echo Today: $PATCH_DATE Tag: $bddo_tag
	echo
	doDownload
fi

