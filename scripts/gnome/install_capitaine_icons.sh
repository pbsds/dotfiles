#!/usr/bin/env bash

# todo, update instead of reinstall?

(
	mkdir -pv ~/.icons
	cd ~/.icons
	rm -rf la-capitaine-icon-theme
	git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
)

