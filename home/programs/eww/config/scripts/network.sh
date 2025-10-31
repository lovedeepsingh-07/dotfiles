#!/usr/bin/env bash

nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2 || echo "Disconnected"
