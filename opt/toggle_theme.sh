#!/bin/bash

current="$(dconf read /org/gnome/desktop/interface/gtk-theme | cut -c2- | rev | cut -c2- | rev)"

case "$current" in
    "vimix-dark-laptop-ruby")  new="vimix-light-laptop-ruby" ;;
    "vimix-dark-ruby")         new="vimix-light-ruby" ;;
    "vimix-light-laptop-ruby") new="vimix-dark-laptop-ruby" ;;
    "vimix-light-ruby")        new="vimix-dark-ruby" ;;
esac

echo $new

cat <<EOF |
[org/gnome/desktop/interface]
gtk-theme='$new'
EOF
dconf load /
