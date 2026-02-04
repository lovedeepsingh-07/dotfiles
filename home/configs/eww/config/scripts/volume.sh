#!/usr/bin/env bash

out=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol=$(echo $out | awk '{print int($2 * 100)}')
if echo $out | grep -q MUTED; then
	echo "Muted"
else
	echo "Vol: $vol%"
fi
