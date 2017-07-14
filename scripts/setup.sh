# download this script and run it
# but check whether you need the VM stuff
# (search for vm stuff)

# make sure everything is up to date
sudo pacman -Syyu --noconfirm &&

# create links to all config files
mkdir -p ~/.local/share/stack
mkdir -p ~/.config &&
ln -sf $PWD/ghc ~/.ghc &&
ln -sf $PWD/konsole ~/.config/ &&
ln -sf $PWD/nvim ~/.config/ &&
ln -sf $PWD/stack/config.yaml ~/.local/share/stack/config.yaml &&
ln -sf $PWD/haskeline ~/.haskeline &&
ln -sf $PWD/latexmkrc ~/.latexmkrc &&
ln -sf $PWD/vimperatorrc ~/.vimperatorrc &&
ln -sf $PWD/xinitrc ~/.xinitrc &&
ln -sf $PWD/Xmodmap ~/.Xmodmap &&
ln -sf $PWD/Xresources ~/.Xresources &&
ln -sf $PWD/zpreztorc ~/.zpreztorc &&
ln -sf $PWD/zprofile ~/.zprofile &&
ln -sf $PWD/zshrc ~/.zshrc &&

# required for compilation
sudo pacman -S --noconfirm gcc make fakeroot &&

# install yaourt
sudo pacman -S --noconfirm binutils pkg-config &&
mkdir ../aur &&
cd ../aur &&
git clone https://aur.archlinux.org/package-query.git &&
cd package-query &&
makepkg -si --noconfirm &&
cd .. &&
git clone https://aur.archlinux.org/yaourt.git &&
cd yaourt &&
makepkg -si --noconfirm &&
cd ../../dotfiles &&

# vm stuff
sudo pacman -S --noconfirm virtualbox-guest-modules-arch &&
sudo pacman -S --noconfirm virtualbox-guest-utils &&

# install xorg stuff
sudo pacman -S --noconfirm xorg-server xorg-xinit &&
sudo mkdir -p /etc/X11 &&
sudo ln -sf $PWD/xorg.conf.d /etc/X11/xorg.conf.d &&

# various programs that are started by startx
sudo pacman -S --noconfirm wmname unclutter feh xcompmgr &&

# custom dwm
cd ../aur &&
git clone https://github.com/JakobBruenker/dwm.git &&
cd dwm &&
sudo make clean install &&
cd ../../dotfiles &&
sudo ln -sf /usr/local/bin/dwm /bin/dwm &&

# set up zsh
# unfortunately, you will have to select the right prezto package
# you will also have to enter your password to be able to change the shell
sudo pacman -S --noconfirm zsh &&
yaourt prezto-git --noconfirm &&
chsh -s /bin/zsh &&

# dmenu
cd ../aur &&
git clone https://aur.archlinux.org/dmenu-git.git &&
cd dmenu-git &&
makepkg -si --noconfirm &&
cd ../../dotfiles &&
ln -sf $PWD/dmenu/config.h ~/aur/dmenu-git/src/dmenu/config.h &&
cd ../aur/dmenu-git &&
makepkg -efi --noconfirm &&
cd ../../dotfiles &&

# konsole
# you will need to select the correct fira font
sudo pacman -S --noconfirm konsole &&
yaourt fira-code-git &&

# install other programs
sudo pacman -S --noconfirm archlinux-keyring python-pip xclip &&
sudo pacman -S --noconfirm wget firefox htop mlocate &&

# vim
sudo pacman -S --noconfirm neovim &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
pip install neovim &&

echo 'The setup is finished.'
echo 'Restart the computer and enjoy your Arch Linux experience'
