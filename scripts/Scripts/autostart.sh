#!/bin/bash

wlsunset -t 2000 -T 4500 -l -41.2 -L 174.7 &
disown
hyprlock
awww-daemon &
disown
wal -R &
disown
waybar &
disown
swaync &
disown
wl-paste --watch cliphist store &
disown
swayidle -w -C /home/Lachlan/Stream/swayidle-config &
disown
