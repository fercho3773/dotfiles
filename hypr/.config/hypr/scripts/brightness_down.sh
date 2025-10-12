#!/bin/bash

# Actual brightness
current=$(brightnessctl g)
max=$(brightnessctl m)
min=$((max / 100))
step=$((max / 50))
new=$((current - step))

if [ "$new" -lt "$min" ]; then
  new=$min
fi

brightnessctl s "$new"
