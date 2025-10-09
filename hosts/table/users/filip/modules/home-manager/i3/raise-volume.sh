#!/usr/bin/env bash
SINK=$(pactl get-default-sink)
VOLUME=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | tr -d '%')
NEW=$((VOLUME + 2))
[ "$NEW" -gt 100 ] && NEW=100
pactl set-sink-volume "$SINK" "${NEW}%"
