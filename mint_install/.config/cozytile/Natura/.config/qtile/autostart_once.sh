#!/bin/bash

# Apply wallpaper using wal
wal -i ~/.config/xinit/qtile_wallpapers/claudio-testa-FrlCwXwbwkk-unsplash.jpg

clipster -d &

# Start picom
picom --config ~/.config/picom/picom.conf &


