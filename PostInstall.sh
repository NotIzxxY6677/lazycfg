#!/bin/bash

#Create a Normal User account MANUALLY and get sudo installed.
#pacman -S sudo nano
#useradd -m -G wheel -s /bin/bash pc
#passwd pc
#<PASSWORD>
#Uncomment wheel from sudoers file using nano(or your preferred text editor in CLI) in '/etc/sudoers' .

#Install driver-related packages:
sudo pacman -S mesa vulkan-intel intel-media-driver libva-intel-driver libva-utils intel-gpu-tools

#Install libraries-type packages?
sudo pacman -S opencl-headers clinfo ocl-icd

#Install yay (AUR Helper)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version

#Install hyprland ecosystem stuff, for packages that don't exist in official repo, just use YAY
#sudo pacman -S hyprpaper hyprpicker hypridle hyprlock xdg-desktop-portal-hyprland hyprpolkitagent hyprland-qt-support qt6-wayland qt5-wayland

# "Read https://wiki.archlinux.org/title/Intel_graphics#Washed_out_colors. By the way, another potential fix for washed-out colors is to set your refresh rate to one unit higher than your screen's native refresh rate. This has worked for me."
