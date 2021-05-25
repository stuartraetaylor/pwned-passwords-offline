#!/usr/bin/env bash
PWNED_VERSION="v7"

if [ -z "$1" ]; then
    echo 'Usage: ./upgrade-repo.sh <version-string>'
    echo 'e.g., ./upgrade-repo.sh v7'
    exit 1
fi

for f in `grep --directories=skip -l $PWNED_VERSION *`; do
    echo "Updating $f"
    sed -i "s/$PWNED_VERSION/$1/g" "$f"
done

git status
