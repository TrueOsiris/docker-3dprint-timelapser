#!/bin/bash
while true
do
	if [[ -z $(find /mnt/cache -type f -mmin -10 2>/dev/null) ]]; 
	then 
		echo "Newest file is older than 10 minutes. Starting move process"; 
		d=`date +%Y-%m-%d_%H%M`;
		echo "Creating folder /mnt/timelapse_vids/$d";
		mkdir "/mnt/timelapse_vids/$d";
		chown -R nobody:nogroup "/mnt/timelapse_vids/$d";
		chmod -R 777 "/mnt/timelapse_vids/$d";
		find /mnt/cache -type f -mmin -10 -exec mv "{}" "/mnt/timelapse_vids/$d/" \;
	else 
		echo "Newest file is younger than 10 minutes. Doing nothing"; 
	fi
	sleep 60
done
#tail -f /dev/null
