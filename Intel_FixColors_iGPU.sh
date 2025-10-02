#!/bin/bash

sudo cp 80-i915.rules /etc/udev/rules.d/
sudo cp intel-wayland-fix-full-color /usr/local/bin/

# Add one more unit to your native screen refresh rate if this does not work.
# https://wiki.archlinux.org/title/Intel_graphics#Washed_out_colors
