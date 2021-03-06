#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

eval "$DIR/scripts/micro"
eval "$DIR/scripts/rmate"
eval "$DIR/scripts/fzf"
eval "$DIR/scripts/git_user_config"

#symlinks
eval "$DIR/scripts/symlinks/micro"
eval "$DIR/scripts/symlinks/ssh"
eval "$DIR/scripts/symlinks/profile"
