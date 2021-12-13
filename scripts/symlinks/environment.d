#!/bin/bash

# ensure sudo:
#sudo bash -c ":" || exit 1

#ensure user:
[ "$(whoami)" != "root" ] || echo "you can't be root for this"
[ "$(whoami)" != "root" ] || exit 1

DIR=$(git rev-parse --show-toplevel)

mkdir -p "$HOME/.config/environment.d"

find "$DIR/config/environment.d" -type f |
while read file; do
#    sudo ln -vsf "$file" "/environment.d/$(basename "$file")"
    ln -vsf "$file" "$HOME/.config/environment.d/$(basename "$file")"
done
