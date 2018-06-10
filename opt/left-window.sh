#!/bin/bash
#bound to ctrl+super+left
focus=$(xdotool getwindowfocus)

xdotool windowsize $focus 60% 64%
xdotool windowmove $focus 2% 3%
