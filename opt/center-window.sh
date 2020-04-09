#!/bin/bash
#bound to ctrl+super+down

#sets WINDOW, X, Y, WIDTH, HEIGHT and SCREEN(which doesn't work)
eval "$(xdotool getactivewindow getwindowgeometry --shell)"

#calculate center of window
CX=$(expr $X + $WIDTH / 2)
CY=$(expr $Y + $HEIGHT / 2)

xrandr |
	grep ' connected' |
	sed -e "s/ /\\n/g" |
	grep -E "[0-9]+x[0-9]+\\+[0-9]+\\+[0-9]" |
	sed -e "s/[x+]/ /g" |
while read DW DH DX DY; do
	#check if center of window is within this monitor
	if ! [ $CX -ge $DX -a $CX -lt $(expr $DX + $DW) ]; then continue; fi
	if ! [ $CY -ge $DY -a $CY -lt $(expr $DY + $DH) ]; then continue; fi

	# todo, perhaps use perl or something faster, expr doesn't like floats?
	if python -c "exit(($DW / $DH * 9) < 20)"; then
		echo current monitor: $DW $DH $DX $DY - wide mode
		W="74"
		H="93"
		X="13"
		Y="2"
	else
		echo current monitor: $DW $DH $DX $DY - normal mode
		W="90"
		H="82"
		X="5"
		Y="8"
	fi
	xdotool windowsize $WINDOW $(expr $DW \* $W / 100) $(expr $DH \* $H / 100)
	xdotool windowmove $WINDOW $(expr $DX + $DW \* $X / 100) $(expr $DY + $DH \* $Y / 100)

	break
done
