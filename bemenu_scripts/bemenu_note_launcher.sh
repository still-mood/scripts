#!/bin/bash 
	
root="$HOME/log_journal/pages/" 



task="$(echo -e "Add\nRemove\nEdit\nExit" | bemenu -c -p "Choose Option >" -l 4 -W 0.4)" 



case "${task}" in 
	Add) 
		filename="$(bemenu -c -p "Add File" -W 0.4 < /dev/null )"
		
		if [[ ! -z "${filename}" ]]; then 
			nvim "${filename}" 
			mv "${filename}" "${filename}.md"
			notify-send "${filename}.md created successfully" 
		else 
			notify-send "Could not create file, field left blank" 
		fi 
		;; 
	Remove) 
		
	remove_filename="$(ls -t1 | bemenu -c -W 0.4 -l -5)" 
		if [[ -n "${remove_filename}" ]]; then
		
		while true; do
			choice="$(demnu -c -p "Do you wish to delete ${remove_filename} )"  < /dev/null   				if [ "${choice}" == [Yy] ]; then 
				rm "${remove_filename}".md
				exit 0
		break
			else
					notify-send "Input field left blank, Nothing Changed"
					exit 0 
			fi
			done
		else 
			notify-send "${filename} not removed"
		fi 
			;;
	Edit) 
			echo "Edit"
			;;
	*) 
		echo "Unknown answer"
		;;
	esac 
