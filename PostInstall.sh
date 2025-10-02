#!/bin/bash

#Create a Normal User account MANUALLY and get sudo installed.
#pacman -S sudo nano
#useradd -m -G wheel -s /bin/bash pc
#passwd pc
#<PASSWORD>
#Uncomment the ‘wheel’ group in the sudoers file using nano (or your preferred CLI text editor) located at /etc/sudoers .

#Install driver-related packages maybe:
sudo pacman -S mesa

#Install yay (AUR Helper) // Uncomment 
#sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install Hyprland https://hypr.land/
