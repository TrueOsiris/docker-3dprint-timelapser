#!/bin/bash
while true
do
	if [[ -z $(find /mnt/cache -type f -mmin -10 2>/dev/null) ]]; 
	then 
		echo "Newest file is older than 10 minutes. Starting move process"; 
		d=`date +%Y-%m-%d_%H%M`;
		echo "Creating folder /mnt/timelapse_vids/$d";
		mkdir -v "/mnt/timelapse_vids/$d";
		chown -v -R nobody:nogroup "/mnt/timelapse_vids/$d";
		chmod -v -R 777 "/mnt/timelapse_vids/$d";
		find /mnt/cache -v -type f -mmin -10 -exec mv -v "{}" "/mnt/timelapse_vids/$d/" \;
	else 
		echo "Newest file is younger than 10 minutes. Doing nothing"; 
	fi
	sleep 300;
done
#tail -f /dev/null
