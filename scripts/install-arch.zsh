#!/bin/zsh

# before running this script, make sure you are connected to the internet, and
# set up these variables
# TODO: these are removed upon chroot
hostname=ArchVM
city=Europe/Berlin
username=user
interface=enp0s3

# initial setup
# =============

# set keyboard layout
loadkeys i386/dvorak/dvorak-programmer.map.gz

# ensure the system clock is accurate
timedatectl set-ntp true

# partition sda
# =============

# make partition table
# you will have to confirm this
parted /dev/sda mklabel msdos

# make partition
parted /dev/sda mkpart primary ext4 0% 100%

# format partition
mkfs.ext4 /dev/sda1

# mount the partition
mount /dev/sda1 /mnt

# installation
# ============

# install base system
pacstrap /mnt base

# configuring system
# ==================

# generate /etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab

# change root
arch-chroot /mnt

# set timezone
ln -sf /usr/share/zoneinfo/$city /etc/localtime

# generate /etc/adjtime
hwclock --systohc

# set locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf

# set keybaord layout persistently
echo KEYMAP=dvorak-programmer >> /etc/vconsole.conf

# hostname
echo $hostname > /etc/hostname
head -n -2 /etc/hosts > tmpetchosts
mv tmpetchosts /etc/hosts
echo "127.0.0.1  $hostname.localdomain  $hostname" >> /etc/hosts
echo "" >> /etc/hosts
echo '# End of file' >> /etc/hosts

# set up internet connection
systemctl enable dhcpcd@$interface.service

# set root password
# you will have to enter this
echo PLEASE ENTER ROOT PASSWORD
passwd

# install sudo
pacman -S sudo

# set up new user
useradd -m -G wheel $username

# set up password for new user
# you will have to enter this
echo PLEASE ENTER PASSWORD FOR $username
passwd $username

# boot loader
pacman -S grub os-prober
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# install git because we'll need it later
pacman -S git

# uncomment the line that says
# %wheel ALL=(ALL) ALL
EDITOR=vi
visudo

# at this point, you can reboot into the installed OS
