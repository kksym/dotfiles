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
        xset m 1 10 &
        exec urxvt -e "weechat-curses" &
        exec xpad &
        exec xflux -l 51.9 -g -4.9 &
		exec xmonad
		;;
esac

