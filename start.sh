#!/bin/bash
while true
do
	if [[ -z $(find /mnt/cache -type f -mmin -10 2>/dev/null) ]]; 
	then 
		echo "Newest file is older than 10 minutes. Starting move process"; 

	else 
		echo "Newest file is younger than 10 minutes. Doing nothing"; 
	fi
	sleep 60
done
#tail -f /dev/null
