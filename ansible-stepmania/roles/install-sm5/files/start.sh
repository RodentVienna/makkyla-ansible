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

# try to clone displays for streming – but if it's not possible for some reason , that's fine as well
xrandr --output HDMI-0 --same-as DVI-D-0 --mode 1280x720 --scale-from 1920x1080 || true

# force vsync off
export __GL_SYNC_TO_VBLANK=0

pasuspender /stepmania/stepmania

if [[ $? -ne 0 ]]; then
  # wait until enter is pressed
  read -p "Press enter to continue"
fi
