#!/bin/bash

#Create a Normal User account MANUALLY.
pacman -S sudo nano
useradd -m -G wheel -s /bin/bash pc
#passwd pc
#<PASSWORD>
#Uncomment wheel from sudoers file using nano in '/etc/sudoers' .

#Install driver-related packages:
sudo pacman -S mesa vulkan-intel intel-media-driver libva-intel-driver libva-utils intel-gpu-tools

#Install libraries-type packages?
sudo pacman -S opencl-headers clinfo ocl-icd

#Install printer related drivers/apps:
sudo pacman -S hplip

#Install yay (AUR Helper)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
