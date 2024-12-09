#!/usr/bin/env bash

# Function to get memory usage details
get_memory_usage() {
    free -h | awk '/^Mem/ {
        used = $3
        total = $2
        gsub(/i/, "", used)
        gsub(/i/, "", total)
        printf "%s/%s", used, total
    }'
}

# Call the function and output the result
get_memory_usage

