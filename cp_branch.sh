#! /usr/bin/env bash

# git cli tool allows listing all branches, which the one checked out is
# prepended with an asterick. After fetching that, I stripped off the asterick,
# and that's the branch found.
branch=$(git branch -a | grep '*' | cut -d" " -f2)

echo "Copied $branch to clipboard"

# This is the very system-dependent part of the script. If you don't have xclip
# this won't work.
echo $branch | xclip -selection clipboard
