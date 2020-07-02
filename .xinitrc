#!/bin/sh

sxhkd &
xsetroot -cursor_name left_ptr &
udiskie &
dunst &
picom -b
wal -R 
#nitrogen --set-auto /home/marcos/wallpapers/wall3.jpg # Managed by pywal
exec bspwm
