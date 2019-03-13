#!/bin/bash
#bound to ctrl+super+left

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
	if [ $CX -ge $DX -a $CX -lt $(expr $DX + $DW) ]; then
	if [ $CY -ge $DY -a $CY -lt $(expr $DY + $DH) ]; then
		echo $DW $DH $DX $DY
		
#		xdotool windowsize $WINDOW 60% 64%
		xdotool windowsize $WINDOW $(expr $DW \* 60 / 100) $(expr $DH \* 64 / 100)
#		xdotool windowmove $WINDOW 2% 3%
		xdotool windowmove $WINDOW $(expr $DX + $DW \* 2 / 100) $(expr $DY + $DH \* 3 / 100)
		
		break
	fi
	fi
done


