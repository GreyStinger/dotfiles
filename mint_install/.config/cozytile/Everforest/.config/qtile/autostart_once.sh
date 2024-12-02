#!/bin/bash

# Apply wallpaper using wal
wal -b 232A2E -i ~/.config/xinit/qtile_wallpapers/fog_forest_2.png

clipster -d &

# Start picom
picom --config ~/.config/picom/picom.conf &


