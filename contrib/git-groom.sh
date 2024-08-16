#!/bin/bash

# Fetch latest remote repository status, pruning deleted branches
git fetch -p

# Identify and forcefully delete local branches with no tracked remote
git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1 }' | xargs -r git branch -D

echo "Git groom completed. Branches with no remote tracking have been forcefully removed."
