#!/bin/bash

# Make data dir for sqlite time tracking
echo "Making sure ~/data directory exists for future items"
mkdir ~/data

# Update and install programs
update_system_and_install_programs() {
    echo "Installing and updating system components"
    sleep 1
    sudo apt update
    sudo apt upgrade -y
    sudo apt-get install pipx git neovim gcc cmake python3 picom rofi dunst \
        python3-full python3-pip unzip zsh wget thunar cava pulseaudio \
        alsa-utils playerctl alacritty tmux ranger fonts-jetbrains-mono \
        brightnessctl sqlite3 bat xinit imagemagick feh -y
}

update_system_and_install_programs

# Enable for installing the best nerd font

install_fonts() {
    echo "Installing fonts..."
    sleep 1

    # Save dir
    original_dir=$(pwd)

    echo "Downloading JetBrainsMono v3.3.0 from github"
    # Install fonts
    wget -P ~/.local/share/fonts \
        https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
    cd ~/.local/share/fonts || return # WARNING: This could be a source of uncertainty
    unzip JetBrainsMono.zip
    rm JetBrainsMono.zip

    echo "Refreshing font cache"
    fc-cache -fv

    # Reset
    cd "$original_dir" || return # WARNING: This could be a source of uncertainty
    echo "Finished installing fonts"
}

install_fonts

# Clipster
install_clipster() {
    echo "Installing clipster python script into .local/bin/clipster"
    ## Install clipster
    wget -P ~/.local/bin \
        https://raw.githubusercontent.com/mrichar1/clipster/refs/heads/master/clipster

    ## Make clipster executable
    chmod +x ~/.local/bin/clipster

    current_shell=$(ps -p $$ -o -cmd=)
    if [[ $current_shell == *"zsh"* ]]; then
        read -rp "Detected zsh shell is in use, add clipster to zsh PATH? [y/N]: " answer
        answer=${answer:-N}
        answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
        if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
            echo "Adding ~/.local/bin to zsh path"
            if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
                echo "Added ~/.local/bin to PATH in .zshrc"
            else
                echo "~/.local/bin is already in the PATH in .zshrc"
            fi
        else
            echo "Skipped adding ~/.local/bin to zsh path"
        fi
    elif [[ $current_shell == *"zsh"* ]]; then
        read -p "Detected bash shell is in use, add clipster to bash PATH? [y/N]: " answer
        answer=${answer:-N}
        answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
        if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
            echo "Adding ~/.local/bin to bash path"
            if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
                echo "Added ~/.local/bin to PATH in .bashrc"
            else
                echo "~/.local/bin is already in the PATH in .bashrc"
            fi
        else
            echo "Skipped adding ~/.local/bin to bash path"
        fi
    else
        echo "You are not using bash or zsh so please manually add ~/.local/bin to your path"
    fi
    echo "Finished installing clipster"
}

install_clipster

# pipx env's
echo "Setting up pipx"
pipx ensurepath
echo "Installing pywal and qtile using pipx"
pipx install pywal qtile
echo "Injecting psutil into qtile pipx env"
pipx inject qtile psutil

# copying hidden files
echo "Copying config files to .config"
cp -r ./mint_install/.* ~/

echo "Making all coppied scripts executable"
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

