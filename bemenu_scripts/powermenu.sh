#!/bin/bash 





choice="$(echo -e "Power off\nReboot\nSuspend\nLogout\nExit" | bemenu -c -p ":> " -l 5 -W 0.4)" 

case "${choice}" in 
	"Power off") 
		systemctl poweroff
		;;
	Reboot)
		systemctl reboot
		;;
	Suspend)
		systemctl suspend
		;; 
	Logout) 
		loginctl terminate-session "$XDG_SESSION_ID"
		;;
	Exit) 
		exit 0 
		;;
	*) 
		notify-send "What" 
		;; 
	esac 
