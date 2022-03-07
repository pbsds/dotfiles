#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

#$DIR/setup/setup_desktop.sh

# download backgrounds
false && (
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
false && (
    file="$(ls ~/Pictures/backgrounds_randomized -1 | shuf -n 1)"
    (
        echo "[org/gnome/desktop/background]"
        echo "picture-uri='file://$HOME/Pictures/backgrounds_randomized/$file'"
        echo "picture-options='zoom'"
    ) | dconf load /
)


eval "$DIR/scripts/lxterminal"

eval "$DIR/scripts/f3d"

#eval "$DIR/scripts/pandoc"
eval "$DIR/scripts/python"
eval "$DIR/scripts/rust"
#eval "$DIR/scripts/haskell"


# install x

cat <<EOF | xargs sudo pacman -S --noconfirm
    firefox
    mpv
    eog
    sshuttle
    discord
    transmission-gtk
    scrcpy
EOF

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
cat <<EOF | xargs pamac build --no-confirm
    spotify
    slack-desktop
    transmission-remote-gui-gtk2
EOF

#todos:
# - last.fm
# - autofs
# - steam
