#! /usr/bin/env bash

# It would be pointless to attempt to use git commands in a directory that was
# not a git repository.
if [[ ! -d .git ]]
then
    exit 1;
fi

# We are in a git repo and now we need the status of the branch.
status=$(git status)

# These are various states of "git status", while they don't represent all of
# the states, it is good for a bash prompt.
case $status in
    *"branch is ahead"*) echo -e "\e[32m";;
    *"working tree clean"*) echo -e "\e[35m";;
    *"Changes to be committed"*) echo -e "\e[36m";;
    *"Untracked files"*) echo -e "\e[31m";;
    *) echo -e "\e[37m";;
esac

