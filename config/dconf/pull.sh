#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)

find "$DIR/config/dconf" -type f | grep "\.ini$" |
while read file; do
    (
    cat "$file" | grep "^\[.*\]$" | rev | cut -c2- | rev | cut -c2- |
    while read path; do
        echo "[$path]"
        dconf dump "/$path/" | tail -n +2 | sed -e '1,/^$/!d' | grep .
        echo
    done
    ) > "$file.new"
    rm "$file"
    mv "$file.new" "$file"
done
