#!/bin/bash

a="vimix-dark-ruby"
b="vimix-light-ruby"

current="$(dconf read /org/gnome/desktop/interface/gtk-theme | cut -c2- | rev | cut -c2- | rev)"

if [ "$current" == "$a" ]; then
	new="$b"
else
	new="$a"
fi

echo $new

cat <<EOF |
[org/gnome/desktop/interface]
gtk-theme='$new'
EOF
dconf load /
