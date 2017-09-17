#!/bin/bash

# wait until pulseaudio has started, pasuspender doesn't work otherwise
while [ -z "$(pidof pulseaudio)" ]; do
  sleep 0.5
done

pasuspender /stepmania/stepmania

# wait until enter is pressed
read -p "Press enter to continue"
