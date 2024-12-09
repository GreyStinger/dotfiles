#!/usr/bin/env bash

# Run top command twice and get CPU usage information
cpu_info=$(top -bn2 | grep "Cpu(s)" | tail -n 1)

# Extract CPU usage values using awk
cpu_usage=$(echo "$cpu_info" | awk '{print $2 + $4}')

# Format the CPU usage as a percentage
result=$(echo "$cpu_usage" | xargs printf "%.1f%%")

# Output the result
echo "$result"

