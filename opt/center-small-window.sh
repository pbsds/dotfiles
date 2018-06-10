#!/bin/bash
#bound to ctrl+super+up
focus=$(xdotool getwindowfocus)

xdotool windowsize $focus 70% 70%
xdotool windowmove $focus 15% 1%
