#!/usr/bin/env bash

DIR=$(git rev-parse --show-toplevel)


([ '$@' == "" ] \
	&& find "$DIR/config/dconf" -type f \
	|| ls -1 "$@"
) | grep "\.ini$" |
while read file; do
    echo "cat \"$file\" | dconf load /"
    cat "$file" | dconf load /
done
