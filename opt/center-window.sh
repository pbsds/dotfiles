#!/bin/bash
#bound to ctrl+super+down
focus=$(xdotool getwindowfocus)

xdotool windowsize $focus 90% 82%
xdotool windowmove $focus 5% 8%
