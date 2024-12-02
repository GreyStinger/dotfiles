#!/bin/bash

# Apply wallpaper using wal
wal -b 282738 -i ~/.config/xinit/qtile_wallpapers/120_-_KnFPX73.jpg

clipster -d &

# Start picom
picom --config ~/.config/picom/picom.conf &
