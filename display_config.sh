#! /usr/bin/env bash

# Collect all connected displays.
displays=$(xrandr -q | grep ' connected ' | cut -d" " -f1)

# The beginning of the xrandr command, this should be a constant no matter
# what is connected.
xrandr_cli="xrandr --output eDP-1-1 --mode 1920x1080"

# Determine where the laptop display will be positioned relatively to the
# other display.
# HDMI-0 = home
# DP-1-1 = work
case ${displays[@]}
in
    *"HDMI-0"*)
        xrandr_cli="$xrandr_cli --left-of HDMI-0 --output HDMI-0 --auto";;
    *"DP-1-1"*)
        xrandr_cli="$xrandr_cli --right-of DP-1-1 --output DP-1-1 --auto";;
esac

$($xrandr_cli)
