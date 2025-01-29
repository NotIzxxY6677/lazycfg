#!/bin/bash

sudo cp 80-i915.rules /etc/udev/rules.d/
sudo cp intel-wayland-fix-full-color /usr/local/bin/

# Add one more unit to your native screen's refresh rate if this does not work.
