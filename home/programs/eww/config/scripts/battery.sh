#!/usr/bin/env bash

BATTERY_PATH="/sys/class/power_supply/BAT0"

capacity=$(cat "$BATTERY_PATH/capacity")
status=$(cat "$BATTERY_PATH/status")

echo "Bat: $capacity% ($status)"
