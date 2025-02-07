#!/usr/bin/env bash

# dwmblocks &
bash ~/.config/home-manager/common/dwm/xroot.sh &

if xrandr | grep 'HDMI-1 connected' | grep -q '+'; then
  bash /home/jayden/.screenlayout/dual_monitor.sh
  xrandr --output HDMI-1 --mode 1920x1080 --rate 75
  feh --bg-fill ~/.config/wallpapers/you_challenge_me.jpg ~/.config/wallpapers/my_turn.jpg
else
  feh --bg-fill ~/.config/xinit/farewell.jpg
fi

while true; do
  sleep 1
done
