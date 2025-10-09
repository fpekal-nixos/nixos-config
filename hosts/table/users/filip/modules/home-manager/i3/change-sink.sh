#!/usr/bin/env bash
# Raw sink names
# CHOICE=$(pactl list sinks | grep "Name: " | awk '{print $2}' | rofi -dmenu -l 5)

declare -A map=(
	["Słuchawki"]="alsa_output.usb-SteelSeries_Arctis_Pro_Wireless-00.stereo-game"
	["Głośniki"]="alsa_output.pci-0000_00_1f.3.analog-stereo"
	["Bluetooth"]="bluez"
)

CHOICE=$(printf "%s\n" "${!map[@]}" | rofi -dmenu -i -p "Audio")
MAPPED="${map[$CHOICE]}"

pactl set-default-sink "$MAPPED"
