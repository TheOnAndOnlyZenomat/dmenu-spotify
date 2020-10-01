#!/bin/sh

#!/bin/bash

currentsong=$(playerctl metadata 2>/dev/null| grep 'spotify xesam:title' | cut -c 35-)

declare options=("play
pause
next
prev
volume")

choice=$(echo -e "$options" | dmenu -i -p "$currentsong")
temp=$(mktemp dl.XXXX)

case "$choice" in
	play)
		playerctl play
		;;
	pause)
		playerctl pause
		;;
	next)
		playerctl next
		;;
	prev)
		playerctl previous
		;;
    volume)
        volumeusr=$(dmenu -i -p "Volume: " < $temp)
        echo $volumeusr
        playerctl volume $volumeusr
esac

rm -rf $temp