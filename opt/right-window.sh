#!/bin/bash
#bound to ctrl+super+right
focus=$(xdotool getwindowfocus)

xdotool windowsize $focus 60% 64%
xdotool windowmove $focus 38% 31%
