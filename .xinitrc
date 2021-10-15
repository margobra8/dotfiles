#!/bin/sh

sxhkd &
xsetroot -cursor_name left_ptr &
xset s off -dpms &
udiskie &
dunst &
picom -b
wal -R 
numlockx on &
#nitrogen --set-auto /home/marcos/wallpapers/wall3.jpg # Managed by pywal
xset r rate 300 50 &
#gnome-keyring (following 2 lines)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

exec bspwm
#exec openbox-session
