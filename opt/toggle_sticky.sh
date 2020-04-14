#!/bin/sh
wmctrl -r :ACTIVE: -b toggle,sticky

#wmctrl -r :ACTIVE: -b toggle,above # does not toggle off
wmctrl -r :ACTIVE: -b $(
		[[ $(xprop -id $(
			xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW |
			awk "{print \$2}"
		) _NET_WM_STATE) =~ "ABOVE" ]] &&
		echo "remove" ||
		echo "add"
	),above

notify-send --hint int:transient:1 "Toggle sticky" "Stickyness was toggled"
