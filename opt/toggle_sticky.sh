#!/bin/sh

#wmctrl -r :ACTIVE: -b toggle,sticky,above # does not toggle off on 'above' on gnome

action=$(
	[[ $(xprop -id $(
		xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW |
		awk "{print \$2}"
	) _NET_WM_STATE) =~ "ABOVE" ]] &&
	echo "remove" ||
	echo "add"
)
title="$(
	xdotool getactivewindow getwindowname
)"

wmctrl -r :ACTIVE: -b $action,sticky,above

notify-send --hint int:transient:1 "Toggle sticky" "$action sticky on $title"
