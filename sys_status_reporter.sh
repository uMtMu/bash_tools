#!/bin/bash

# trim ve buyukten kucuge çevirmeyi kaldirmaya kiyamadim :)
location=$(echo $HOSTNAME | cut -c 7-9 | tr '[:upper:]' '[:lower:]')
if [ $location == ist ]
then
        location="ank"
else
        location="ist"
fi

hdd_status=$(df -h)
log_folder_var=$(du -hs /var/log)
log_folder_log_local=$(du -hs /root/log_backups)
log_folder_log_remote=$(du -hs /root/"$location"_log_backups)

echo -e "##### $(date) System Status Check\n"
echo -e "##### HDD Status\n$hdd_status\n"
echo -e "##### Log folders\n"
echo -e "var/log dir:\n$log_folder_var"
echo -e "log_backups dir:\n$log_folder_log_local"
echo -e "remote_log_backups dir:\n$log_folder_log_remote"
