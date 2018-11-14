#!/bin/bash

focus=$(xdotool getwindowfocus)
# getactivewindow instead?


decorated=$(
	xprop -id $focus -f _MOTIF_WM_HINTS 32c \
	| grep "^_MOTIF_WM_HINTS" \
	| tr -d " " \
	| cut -d"," -f 3
)

echo decorated: $decorated

if [ "$decorated" = "0" ]; then
	next=1
else
	next=0
fi


xprop -id $focus \
	-f _MOTIF_WM_HINTS 32c -set \
	_MOTIF_WM_HINTS "0x2, 0x0, 0x$next, 0x0, 0x0"

