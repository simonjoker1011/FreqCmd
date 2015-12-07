#! /bin/bash

function press2continue(){

        echo    
        echo "press return button to continue."
        read -s

}


# ===========================================
# 先輸入系統所需要的資料
host="192.168.1.116"		# 遠端主機
id="simonhuang"			# 遠端主機的 FTP 帳號
pw='simon!#!& '		# 該帳號的密碼

basedir[0]="/etc/"	# 本地端的欲被備份的目錄
basedir[1]="/home/"
basedir[2]="/var/spool/mail"
basedir[3]="/var/spool/cron"
basedir[4]="/root"

remotedir="~/remote.bak"	# 備份到遠端的何處？

# ===========================================

for dir in ${basedir[@]}
do
	echo ">> backup $dir"
	echo

	rsync -av -e ssh $dir ${id}@${host}:${remotedir}$dir | grep rsync

done



