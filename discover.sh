#! /usr/bin/env bash

echo "Let me find you a nice binary in /usr/bin!"

# Acquire all executables available and package them into an array.
bins=( $(ls -a /usr/bin) )

# Selection of a random index from the "bins" array using $[RANDOM % n].
index=$[RANDOM % ${#bins[@]}]
selected_bin=${bins[$index]}

echo "Run \"man $selected_bin\""
