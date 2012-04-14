#!/bin/bash


case $1 in
	#xfce)
		#exec startxfce4	
	
	gnome)
		urxvt &
		exec gnome-session
		;;

	*)
        sudo bitlbee -F
		xcompmgr &
		nitrogen --restore &
		xsetroot -cursor_name left_ptr -fg black -bg white &
        exec urxvt -e "weechat-curses" &
		exec xmonad
		;;
esac

