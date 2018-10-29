+#!/bin/bash

# ensure sudo:
sudo bash -c ":" || exit 1

DIR=$(pwd)
#DIR=$(git rev-parse --show-toplevel)

ln -vsf "$DIR/config/dot_profile" "$HOME/.profile"
ln -vsf "$DIR/config/dot_atom/config.cson" "$HOME/.atom/config.cson"
ln -vsf "$DIR/config/dot_atom/keymap.cson" "$HOME/.atom/keymap.cson"
ln -vsf "$DIR/config/micro/bindings.json" "$HOME/.config/micro/bindings.json"
ln -vsf "$DIR/config/micro/settings.json" "$HOME/.config/micro/settings.json  "

#application shortcuts
find "$DIR/config/applications" -type f |
while read file; do
    ln -vsf "$file" "$HOME/.local/share/applications/$(basename "$file")"
done

#opt
find "$DIR/opt" -type f |
while read file; do
    sudo ln -vsf "$file" "/opt/$(basename "$file")"
done
