#!/bin/zsh

# initial setup
# =============

# set keyboard layout
loadkeys i386/dvorak/dvorak-programmer.map.gz &&

# ensure the system clock is accurate
timedatectl set-ntp true &&

# partition sda
# =============

# make partition table
# you will have to confirm this
parted /dev/sda mklabel msdos &&

# make partition
parted /dev/sda mkpart primary ext4 0% 100% &&

# format partition
mkfs.ext4 /dev/sda1 &&

# mount the partition
mount /dev/sda1 /mnt &&

# installation
# ============

# install base system
pacstrap /mnt base &&

# generate /etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab &&

cd /mnt/ &&
wget https://raw.githubusercontent.com/JakobBruenker/dotfiles/master/scripts/newroot.sh &&
chmod +x newroot.sh &&

# change root
echo 'The intial installation is complete. Please run "arch-chroot /mnt" and' &&
echo 'make sure that the variables in ./newroot.sh are set correctly.' &&
echo 'After you''re done, please run it.'
