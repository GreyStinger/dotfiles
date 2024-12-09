#!/usr/bin/env bash

# Path to the Hyprland socket
SOCKET_PATH="/run/user/$(id -u)/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

# Function to get the current active workspace
get_active_workspace() {
    hyprctl activeworkspace -j | jq -r '.name'
}

# Function to check if a workspace has open windows
has_open_windows() {
    workspace="$1"
    windows=$(hyprctl workspaces -j | jq -r --arg workspace "$workspace" '.[] | select(.name == $workspace) | .windows')
    if [ "$windows" -gt 0 ]; then
        echo "true"
    else
        echo "false"
    fi
}

# Generate workspace buttons with box
generate_workspace_widget() {
    active_workspace=$(get_active_workspace)
    widget="(box :class \"workspaces\" \
            :orientation \"h\" \
            :space-evenly true \
            :homogeneous true \
            :halign \"start\""
    for i in $(seq 1 9); do
        if [ "$i" = "$active_workspace" ]; then
            cls="workspace active-workspace"
        else
            cls="workspace"
        fi

        if [ "$(has_open_windows "$i")" = "true" ]; then
            cls="$cls active-windows"
        else
            cls="$cls no-windows"
        fi
        widget+="  (button \
                    :onclick \"hyprctl dispatch workspace $i\" \
                    (workspace-item :cls \"$cls\" :text $i))"
    done
    widget+=")"
    echo "$widget"
}

# Function to send updates to EWW
update_eww() {
    workspace_widget=$(generate_workspace_widget)
    echo "$workspace_widget"
}

# Initial update
update_eww

# Listen for events from the Hyprland socket and update the widget on workspace or window changes
socat -u UNIX-CONNECT:"$SOCKET_PATH" - | while read -r event; do
    if [[ "$event" == *"workspace"* || "$event" == *"window"* ]]; then
        update_eww
    fi
done

