#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

eval "$DIR/scripts/atom"
eval "$DIR/scripts/gnome"
eval "$DIR/scripts/micro/install.sh"
eval "$DIR/scripts/fzf"
eval "$DIR/scripts/git_user_config"
eval "$DIR/scripts/cli_tools"
eval "$DIR/scripts/cups"
eval "$DIR/scripts/fonts"

#symlinks
eval "$DIR/scripts/symlinks/atom"
eval "$DIR/scripts/symlinks/applications"
eval "$DIR/scripts/symlinks/micro"
#eval "$DIR/scripts/symlinks/opt" # done by gnome setup
eval "$DIR/scripts/symlinks/profile_extended"
eval "$DIR/scripts/symlinks/ssh"
