#!/usr/bin/env bash

# Apply wallpaper using wal
wal -b 232A2E -i ~/Wallpaper/fog_forest_2.png &&

clipster -d &

# Start picom
picom --config ~/.config/picom/picom.conf &

