#!/usr/bin/env bash

# Mpstat things for cpu
coproc mpstat_coproc (mpstat 2)
MPSTAT_FD=${mpstat_coproc[0]}
MPSTAT_PID=$COPROC_PID

cleanup() {
    kill "$MPSTAT_PID" 2>/dev/null
    wait "$MPSTAT_PID" 2>/dev/null
}
trap cleanup EXIT

UNKNOWN_BATTERY="󰂑 "
NOT_CHARGING_ICON="󱈑 "

# Predeclares for my brain
prev_day=""
suffix=""
battery_display=""
cpu_display="  ??.?%"
mem_display=""
status=""

sleep_to_next_sec() {
    local nanosecond sleep_time

    nanosecond=$(date +%N)
    sleep_time=$(awk -v ns="$nanosecond" 'BEGIN { print (1 - ns / 1e9) }')
    sleep "$sleep_time"
}

read_cpu_usage() {
    while read -r -t 0.1 -u "$MPSTAT_FD" line; do
        if [[ -z $line ]] || [[ $line == *"CPU"* ]] || [[ $line == *"Linux"* ]]; then
            continue
        fi

        if [[ $line == *"all"* ]]; then
            line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # whitespace
            read -r -a fields <<<"$line"                                     # array read
            cpu_idle="${fields[-1]}"                                         # idle field
            cpu_idle=$(echo "$cpu_idle" | tr ',' '.')                        # possible comma as decimal separator
            cpu_usage=$(awk "BEGIN {printf \"%.1f\", 100 - $cpu_idle}")
            cpu_display="  $cpu_usage%"
            break
        fi
    done
}

calculate_memory_usage() {
    local mem_used mem_total mem_free mem_used_gb mem_total_gb
    read -r mem_total mem_free <<<"$(awk '/MemTotal/ {total=$2} /MemAvailable/ \
        {available=$2} END {print total, available}' /proc/meminfo)"
    mem_used=$((mem_total - mem_free))
    mem_used_gb=$(awk -v used="$mem_used" 'BEGIN {printf "%.1f", \
        used/1024/1024}')
    mem_total_gb=$(awk -v total="$mem_total" 'BEGIN {printf "%.1f", \
        total/1024/1024}')

    mem_display="  $mem_used_gb/$mem_total_gb GiB"
}

calculate_battery_status() {
    local battery_status battery_state
    battery_status=$(acpi -b)
    battery_percent=$(echo "$battery_status" | grep -oP '\d+%' | tr -d '%')
    battery_state=$(echo "$battery_status" | awk '{print $3}' | tr -d ',')
    if [ "$battery_state" = "Discharging" ]; then
        if ((100 == "$battery_percent")); then
            battery_icon="󰁹 "
        elif ((90 < "$battery_percent")); then
            battery_icon="󰂂 "
        elif ((80 < "$battery_percent")); then
            battery_icon="󰂁 "
        elif ((70 < "$battery_percent")); then
            battery_icon="󰂀 "
        elif ((60 < "$battery_percent")); then
            battery_icon="󰁿 "
        elif ((50 < "$battery_percent")); then
            battery_icon="󰁾 "
        elif ((40 < "$battery_percent")); then
            battery_icon="󰁽 "
        elif ((30 < "$battery_percent")); then
            battery_icon="󰁼 "
        elif ((20 < "$battery_percent")); then
            battery_icon="󰁻 "
        elif ((10 < "$battery_percent")); then
            battery_icon="󰁺 "
        elif ((0 < "$battery_percent")); then
            battery_icon="󰂎 "
        else
            battery_icon="$UNKNOWN_BATTERY"
        fi
    elif [ "$battery_state" = "Charging" ]; then
        if ((100 == "$battery_percent")); then
            battery_icon="󰂅 "
        elif ((90 < "$battery_percent")); then
            battery_icon="󰂋 "
        elif ((80 < "$battery_percent")); then
            battery_icon="󰂊 "
        elif ((70 < "$battery_percent")); then
            battery_icon="󰢞 "
        elif ((60 < "$battery_percent")); then
            battery_icon="󰂉 "
        elif ((50 < "$battery_percent")); then
            battery_icon="󰢝 "
        elif ((40 < "$battery_percent")); then
            battery_icon="󰂈 "
        elif ((30 < "$battery_percent")); then
            battery_icon="󰂇 "
        elif ((20 < "$battery_percent")); then
            battery_icon="󰂆 "
        elif ((10 < "$battery_percent")); then
            battery_icon="󰢜 "
        elif ((0 < "$battery_percent")); then
            battery_icon="󰢟 "
        else
            battery_icon="$UNKNOWN_BATTERY"
        fi
    else
        battery_icon="$NOT_CHARGING_ICON"
    fi

    battery_display="$battery_icon$battery_percent%"
}

calculate_date() {
    local day
    day=$(date +"%-d")

    if [ "$day" != "$prev_day" ]; then
        prev_day="$day"
        if [ "$day" -ge 11 ] && [ "$day" -le 13 ]; then
            suffix="th"
        else
            case "${day: -1}" in
            1) suffix="st" ;;
            2) suffix="nd" ;;
            3) suffix="rd" ;;
            *) suffix="th" ;;
            esac
        fi
    fi

    date_and_time_display=$(date +"%X %A the $day$suffix, %B")
}

while true; do
    # Do things that might delay time status set early

    # Battery Calculation with icons for charging and discharging
    calculate_battery_status

    # Calc Usages
    calculate_memory_usage
    read_cpu_usage # Can do this now because it is 2 sec averaged anyway

    sleep_to_next_sec

    calculate_date

    # Prep for xroot
    status=" $cpu_display | $mem_display | $battery_display | $date_and_time_display "

    xsetroot -name "$status"
done
