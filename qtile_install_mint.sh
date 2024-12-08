#!/bin/bash

# Make data dir for sqlite time tracking
mkdir ~/data

# Update and install programs
sudo apt update
sudo apt upgrade -y
sudo apt-get install pipx git neovim gcc cmake python3 picom rofi dunst \
    python3-full python3-pip unzip zsh wget thunar cava pulseaudio alsa-utils \
    playerctl alacritty tmux ranger fonts-jetbrains-mono brightnessctl sqlite3 \
    bat xinit imagemagick feh -y

# Enable for installing the best nerd font

# # Save dir
# original_dir=$(pwd)
#
# # Install fonts
# wget -P ~/.local/share/fonts \
#     https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
# cd ~/.local/share/fonts
# unzip JetBrainsMono.zip
# rm JetBrainsMono.zip
# fc-cache -fv
#
# # Reset
# cd "$original_dir"

# Clipster

## Install clipster
wget -P ~/.local/bin \
    https://raw.githubusercontent.com/mrichar1/clipster/refs/heads/master/clipster

## Make clipster executable
chmod +x ~/.local/bin/clipster

# Install starship
# curl -sS https://starship.rs/install.sh | sh

# pipx env's
pipx ensurepath
pipx install pywal qtile
pipx inject qtile psutil

# copying hidden files
cp -r ./mint_install/.* ~/

# TODO: Make scripts executable all rofi scripts, and launch scripts
chmod +x ~/.config/qtile/autostart_once.sh
chmod +x ~/.config/rofi/scripts/*
chmod +x ~/.config/rofi/theme_scripts/*

echo "Pre-generating pywal colors..."
echo "Might take some time, hang on tight!"
wal -b 282738 -i ~/.config/xinit/qtile_wallpapers/Aesthetic2.png > /dev/null 2>&1
echo "Theme 1 ../done"
wal -b 282738 -i ~/.config/xinit/qtile_wallpapers/120_-_KnFPX73.jpg > /dev/null 2>&1
echo "Theme 2 ../done"
wal -i ~/.config/xinit/qtile_wallpapers/claudio-testa-FrlCwXwbwkk-unsplash.jpg > /dev/null 2>&1
echo "Theme 3 ../done"
wal -b 232A2E -i ~/.config/xinit/qtile_wallpapers/fog_forest_2.png > /dev/null 2>&1
echo "Theme 4 ../done"

