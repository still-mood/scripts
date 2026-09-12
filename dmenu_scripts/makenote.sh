#!/bin/bash 




root="$HOME/log_journal/pages" 



cd ${root} 




process="$(ls -t1 ${root} | dmenu -c -p "File" -l 10)"



if [[ -z "${process}" ]]; then
notify-send "File name is blank" 
exit 1
fi 




if [[ ! -f "${process}" ]]; then 

	nvim "${process}.md"
	exit 0
else

	action="$(echo -e "Edit\nDelete" | dmenu -c -p "${process}" -l 5 )"

	case "${action}" in 
		Edit) 
			nvim "${process}"
			exit 0 
			;;
		Delete) 

			delete_file="$(echo -e "Yes\nNo" | dmenu -c -l 3)"   
			if [[ "${delete_file}" == "No" ]]; then 
				exit 0 
			else 
				rm "${process}" 
			fi 
				exit 0 

			


			if [[ ! -f "${process}" ]]; then 
				notify-send "${process} deleted" 
			fi 
				exit 0 
			;;
		*) 
			echo no 
			exit 0
			;; 
		esac 

fi
