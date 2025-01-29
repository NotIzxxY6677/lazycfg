#!/bin/bash

# This whole thing only exists because I DON'T KNOW HOW TO USE ARCHINSTALL and is why relying on script yes!

# Synchronize time [Arch Wiki says to do so, not sure if it's crucial[
timedatectl

# Partitioning [Arch Wiki says to use fdisk, but i cannot automate that]
parted /dev/sda <<EOF
mklabel gpt
mkpart primary fat32 1MiB 1024MiB
mkpart primary linux-swap 1025MiB 7168MiB
mkpart primary ext4 7169MiB 100%
set 1 boot on
print
quit
EOF

# Formatting partitions [because obviously]
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

# Mounting partitions [Hey! keep that order in check otherwise things might break here...]
mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2

# Installing base system [because why not?]
pacstrap /mnt base linux linux-firmware intel-ucode

# Generating fstab [Might be an important step but hey who tf knows]
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into new system [Basically enter the installed system to set boot entries and other stuff]
arch-chroot /mnt /bin/bash <<EOF

# Set timezone
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

# Localization
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Hostname
echo "Arch_Linux" > /etc/hostname

# Root password [Note: change the password with your desired root account password, choose a strong one or disable it]
echo "root:password" | chpasswd

# Install bootloader
bootctl install
echo "default arch" > /boot/loader/loader.conf
echo "timeout 5" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf

cat <<BOOT > /boot/loader/entries/arch.conf
title Arch_Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=/dev/sda3 rw
BOOT

bootctl update

pacman -S dhcpcd --noconfirm
systemctl enable dhcpcd

# End of chroot commands
EOF

# Exit chroot
echo "Exiting chroot environment."

# Unmount (nah do it manually)
# umount -R /mnt
# swapoff -a

# Base System Installation Complete
echo "Installation complete! Add the other packages from 'RP.sh' "
