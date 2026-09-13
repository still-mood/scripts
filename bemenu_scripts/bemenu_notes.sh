#!/bin/bash 

notebook="$HOME/log_journal/pages"


notes="$(ls -t1 "${notebook}" | bemenu  -c -B 2 -p "Select Note" -l 5 -W 0.2 )"


if [[ -n "${notes}" ]]; then

	nvim "${notebook}/${notes}"
else 
	exit 0 

fi 
