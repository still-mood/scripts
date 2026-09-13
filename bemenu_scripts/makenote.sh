#!/bin/bash 

#Creates a markdown file in my logseq pages directory
# 

direct="/home/louis/log_journal/pages"




cd "${direct}"

if [[ -z $1 ]]; then
	echo "Argument missing, Please provide a name"
	notify-send "Missing Filename" 
	exit 1
fi 

filename=$1 

if [[ ! -f "${filename}.md" ]]; then 
	nvim "${filename}.md"
	notify-send "${filename} created successfully"
	exit 0 
else 
	read -p "Overwrite ${filename}?" choice
		if [[ "${choice}" == 'y' ]] || [[ "$choice" == "Y" ]] ; then 
			nvim "${filename}.md"
			notify-send "$1.md edited successfully"
			exit 0
		else
			notify-send "Edit Canceled" 
			exit 0 
		fi
fi 

notify-send "Done" 
