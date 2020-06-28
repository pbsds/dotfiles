#!/usr/bin/env bash

# todo, update instead of reinstall?
# todo, use pamac instead? need to figure out ubuntu
# todo, switch to https://drasite.com/flat-remix ?

(
	mkdir -pv ~/.icons
	cd ~/.icons
	rm -rf la-capitaine-icon-theme
	git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
)

