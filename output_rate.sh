#! /usr/bin/env bash

rates=( $(xrandr -q | grep '*' | cut -d'*' -f1 | awk -F' ' '{print $NF}') )

echo ${rates[0]}
