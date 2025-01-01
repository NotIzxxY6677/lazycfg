#!/bin/bash

#Create a Normal User account MANUALLY.
pacman -S sudo nano
useradd -m -G wheel -s /bin/bash pc
#passwd pc
#<PASSWORD>
#Uncomment wheel from sudoers file using nano in '/etc/sudoers' .

#Install driver-related packages:
sudo pacman -S mesa vulkan-intel intel-graphics-compiler intel-gmmlib intel-metee igsc intel-media-driver libva-utils rkcommon opencl-headers

#Install printer related drivers/apps:
sudo pacman -S hplip

#Install yay (AUR Helper)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
