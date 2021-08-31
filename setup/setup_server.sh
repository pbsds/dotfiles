#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

eval "$DIR/scripts/sshd"
