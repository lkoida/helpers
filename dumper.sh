#!/bin/bash

date=$(date +"%d-%b-%Y")
backup_path="/var/www/dumps"
#need to set actual name for database 
#add this script to crontab twice in a week
#save in 2 places(local and maybe remote and send weekly report(in future))
sudo mysqldump designer_db > db_$date.sql

if [ -d $backup_path/dump_$date ]
	then
	  rm -r $backup_path/dump_$date
fi    
mkdir $backup_path/dump_$date
mv *.sql $_

cd $backup_path/dump_$date

tar -cvzf dump_$date.tar.gz *.sql
rm *.sql

echo "files zipped"
