#!/bin/sh

# before running the script, set these variables
hostname=ArchVM
city=Europe/Berlin
username=user
interface=enp0s3

# set timezone
ln -sf /usr/share/zoneinfo/$city /etc/localtime &&

# generate /etc/adjtime
hwclock --systohc &&

# set locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&
echo LANG=en_US.UTF-8 >> /etc/locale.conf &&

# set keybaord layout persistently
echo KEYMAP=dvorak-programmer >> /etc/vconsole.conf &&

# hostname
echo $hostname > /etc/hostname &&
head -n -2 /etc/hosts > tmpetchosts &&
mv tmpetchosts /etc/hosts &&
echo "127.0.0.1  $hostname.localdomain  $hostname" >> /etc/hosts &&
echo "" >> /etc/hosts &&
echo '# End of file' >> /etc/hosts &&

# set up internet connection
systemctl enable dhcpcd@$interface.service &&

# set root password
# you will have to enter this
echo PLEASE ENTER ROOT PASSWORD &&
passwd &&

# install sudo
pacman -S sudo &&

# set up new user
useradd -m -G wheel $username &&

# set up password for new user
# you will have to enter this
echo PLEASE ENTER PASSWORD FOR $username &&
passwd $username &&

# boot loader
pacman -S grub os-prober &&
grub-install --recheck /dev/sda &&
grub-mkconfig -o /boot/grub/grub.cfg &&

# install git because we'll need it later
pacman -S git &&

# uncomment the line that says
# %wheel ALL=(ALL) ALL
echo 'PLEASE UNCOMMENT THE LINE THAT SAYS "%wheel ALL=(ALL) ALL"' &&
echo 'AFTER PRESSING ENTER (PRESS ENTER NOW)' &&
read &&
EDITOR=vi &&
visudo &&

# at this point, you can reboot into the installed OS
echo 'The installation is finished. At this point, you can reboot into the' &&
echo 'installed OS and proceed with the configuration.' &&
echo 'You should also remove this script from /.'
