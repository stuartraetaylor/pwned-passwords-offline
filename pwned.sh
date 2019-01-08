#!/bin/bash
# MIT License - Copyright (c) 2019 Stuart Taylor - https://github.com/stuartraetaylor

dir="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

pwnedfile="${1:-$dir/pwned-passwords-ordered-by-hash.txt}"
echo "Using pwned file: ${pwnedfile/$dir\//}"

if [ ! -f "$pwnedfile" ]; then
    echo "File not found"
    exit 2
fi

lookbin="${2:-$dir/bin/look}"
echo "Using look command: ${lookbin/$dir\//}"

if [ ! -f "$lookbin" ]; then
    echo "Command not found"
    exit 2
fi

echo -n "Password: "
read -s passwd
echo "$(echo "$passwd" | sed -r 's/./*/g')"

result=$($lookbin -bf $(echo -n "$passwd" | sha1sum | cut -d' ' -f1) "$pwnedfile")
e=$?

if [ $e -gt 1 ]; then
    exit $e
fi

echo -n "Pwned: "

if [ $e -eq 1 ]; then
    echo "not pwned."
    exit $e
fi

#echo "$(echo -n "$result" | cut -d':' -f2) times"
echo "pwned!"

exit 0

