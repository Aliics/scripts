#! /usr/bin/env bash

# Obtain all connected displays via xrandr
displays=( $(xrandr -q | grep ' connected ' | cut -d" " -f1) )

# If there is only one display make it 1920x1080, as it is likely my
# laptop display.
if [ ${#displays[@]} -lt 2 ]
then
    xrandr --output ${displays[0]} --mode 1920x1080
    exit 0
fi

# There are multiple displays and the laptop display should be configured to
# either sit on the right or the left depending on what type it is.
xrandr_command="xrandr"
for d in ${displays[@]}
do
    mode="1920x1080"
    dpi="96"
    position=""
    primary=""

    # DP-1-1 is the Apple monitor at work, I place my laptop to the right of
    # it, it has a resolution of 2560x1440.
    # HDMI-1-1 is my home monitor, which the laptop is placed to the left of 
    # it, this one uses 1920x1080.
    case $d
    in
    "DP-1-1")
        mode="2560x1440"
        dpi="102"
        position="--right-of $d"
        primary="--primary ";;
    "HDMI-1-1")
        position="--left-of $d"
        primary="--primary ";;
    esac

    # Concat this all together to build the xrandr command.
    xrandr_command="$xrandr_command$position --output $d $primary--mode $mode
    --dpi $dpi "
done

$($xrandr_command)
