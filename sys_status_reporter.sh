#!/bin/bash

# trim ve buyukten kucuge çevirmeyi kaldirmaya kiyamadim :)
location=$(echo $HOSTNAME | cut -c 7-9 | tr '[:upper:]' '[:lower:]')
if [ $location == ist ]
then
        location="ank"
else
        location="ist"
fi

usage=$(df -h | grep rootfs | awk '{print $5}' | cut -c 1-2)
usage_limit="10"
if [ "$usage" -lt "$usage_limit" ];
then
        hdd_usage="Sufficient disk space";
else
        hdd_usage="!!! Insufficient disk space !!!";
fi

hdd_status=$(df -h)
log_folder_var=$(du -hs /var/log)
log_folder_log_local=$(du -hs /root/log_backups)
log_folder_log_remote=$(du -hs /root/"$location"_log_backups)
echo -e "##### System Status Check #####"
echo -e "##### $(date "+%d.%m.%Y %H:%M") #####\n"
echo -e "HDD Usage limit: %$usage_limit\n"
echo -e "HDD Usage: $hdd_usage\n"
echo -e "##### HDD Status #####\n$hdd_status\n"
echo -e "##### Log folders #####"
echo -e "var/log dir:\n$log_folder_var"
echo -e "log_backups dir:\n$log_folder_log_local"
echo -e "remote_log_backups dir:\n$log_folder_log_remote"
