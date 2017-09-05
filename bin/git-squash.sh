#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Missing parameter: number of commits to squash."
    exit 1
fi

echo "Squashing $1 commits..."
git reset --soft HEAD~$1
git log --format=%B%n --reverse "HEAD@{1}" -n $1 > _msg.txt
git commit -t _msg.txt
rm _msg.txt
echo "Done!"
