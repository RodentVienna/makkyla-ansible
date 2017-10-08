#!/bin/bash

# wait until pulseaudio has started, pasuspender doesn't work otherwise
while [ -z "$(pidof pulseaudio)" ]; do
  sleep 0.5
done

trap 'pkill unclutter; xset +dpms; xset s on' EXIT

# disable sleeps
xset -dpms 
xset s off

# hide mouse cursor if not moved
unclutter -idle 1 -root &

pasuspender /stepmania/stepmania

if [[ $? -ne 0 ]]; then
  # wait until enter is pressed
  read -p "Press enter to continue"
fi
