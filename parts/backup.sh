#! bin/bash

# ===========================================
# 先輸入系統所需要的資料
host="192.168.1.116"		# 遠端主機
id="simonhuang"			# 遠端主機的 FTP 帳號
pw='simon!#!& '		# 該帳號的密碼

basedir="/backup/weekly"	# 本地端的欲被備份的目錄
remotedir="/home/backup"	# 備份到遠端的何處？

# ===========================================

backupfile=weekly.tar.bz2

cd $basedir/..
  tar -jpc -f $backupfile $(basename $basedir)

ftp -n "$host" > ${basedir}/../ftp.log 2>&1 <<EOF
user $id $pw
binary
cd $remotedir
put $backupfile
bye
EOF
