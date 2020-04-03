#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

# download backgrounds
(
    mkdir -p ~/Pictures/backgrounds_randomized
    cd ~/Pictures/backgrounds_randomized
    curl "http://pvv.ntnu.no/~pederbs/backgrounds.txt" |
    ( while read line; do
        (
        wget -q "$line"
        echo "$line"
        ) &
    done
    wait )
)

# set random bg
(
    file="$(ls ~/Pictures/backgrounds_randomized -1 | shuf -n 1)"
    (
        echo "[org/gnome/desktop/background]"
        echo "picture-uri='file://$HOME/Pictures/backgrounds_randomized/$file'"
        echo "picture-options='zoom'"
    ) | dconf load /
)

#todos:
# - eog
# - mpv
# - last.fm
# - spotify
# - automounts?
# - entr


sudo bash -c ":" || exit 1
function install {
	if ! pacman -Qi $1 > /dev/null; then
		sudo pacman --noconfirm -S $1
	fi
}


# install x

#todo: spotify, slack, steam, chromium, discord, autofs, mpv, eog
# pip, sshuttle, dnsutils
