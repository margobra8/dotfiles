#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top -c ~/.config/polybar/config-top.ini -r &
polybar bottom -c ~/.config/polybar/config-bottom.ini -r &

is_DP3_connected() {
my_laptop_external_monitor=$(xrandr --query | grep 'DP3')
if [[ ! $my_laptop_external_monitor = *disconnected* ]]; then
   echo "true"
else
   echo "false"
fi
}

# launch extra bar in second monitor if external monitor is connected
if [[ $(is_DP3_connected) == "true" ]]; then
   polybar top-external -c ~/.config/polybar/config-top-external.ini -r &
fi

# fix tray over fullscreen windows
#sleep 2
#TRAYWINID=$(xwininfo -name "Polybar tray window" | grep -m 1 -o "0x[a-f0-9]\+" --color=never)
#xdo lower $TRAYWINID &
