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
chmod +x newroot.sh.zsh &&

# change root
echo 'PLEASE MAKE SURE THE VARIABLES IN ./newroot.sh ARE SET CORRECTLY' &&
echo 'AND THEN RUN IT AFTER PRESSING ENTER (PRESS ENTER NOW)' &&
read &&
exec arch-chroot /mnt &
