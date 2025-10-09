#!/usr/bin/env bash
CHOICE=$(pactl list sinks | grep "Name: " | awk '{print $2}' | rofi -dmenu -i -p "Audio")

pactl set-default-sink "$CHOICE"
