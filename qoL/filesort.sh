#!/bin/bash 


DOWNLOADS="/home/louis/Downloads/"
PICTURES="/home/louis/Pictures/"
DOCUMENTS="/home/louis/Documents/"



for item in "$DOWNLOADS"/*; do 
	if [ -d "$item" ]; then #-d means directory, so if item is a directory....  
		: 
	elif [ -f "$item" ]; then #-f means file. 
		ext="${item##*.}" 
		if [[ "${ext}" = "jpeg" ]] || [[ "${ext}" = "jpg" ]] || [[ "${ext}" = "png" ]]; then 
			mv "${item}" "$PICTURES/"
		elif [[ "${ext}" = "txt" ]] || [[ "${ext}" = "pdf" ]] || [[ ${ext} = "csv" ]] ; then
			mv "${item}" "$DOCUMENTS/"
		fi 
	fi
done
exit 0 
