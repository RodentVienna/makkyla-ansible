#!/bin/bash

/stepmania/stepmania &
while true; do
    if [ -f "/home/stepmania/.stepmania-5.1/Save/Preferences.ini" ]; then
        sleep 3
        break
    fi
    sleep 1
done
sync
pkill stepmania
