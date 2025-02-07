#!/usr/bin/env bash

SESSION_NAME="main"

# Function to set padding using kitten
set_padding() {
    local padding=$1
    kitty @ set-spacing padding=$padding
}

set_padding 4

# Check if the tmux session exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Attach to the existing session
    tmux attach-session -t $SESSION_NAME
else
    # Create a new session and attach
    tmux new-session -s $SESSION_NAME
fi

set_padding 20
