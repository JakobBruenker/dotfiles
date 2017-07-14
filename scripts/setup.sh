# download this script and run it

# make sure everything is up to date
sudo pacman -Syyu --noconfirm

# create links to all config files
mkdir -p ~/.local/share/stack
sudo mkdir -p /etc/X11
sudo ln -sf $PWD/xorg.conf.d /etc/X11/xorg.conf.d
ln -sf $PWD/ghc ~/.ghc
ln -sf $PWD/konsole ~/.local/share/konsole
ln -sf $PWD/nvim ~/.local/share/nvim
ln -sf $PWD/stack/config.yaml ~/.local/share/stack/config.yaml
ln -sf $PWD/haskeline ~/.haskeline
ln -sf $PWD/latexmkrc ~/.latexmkrc
ln -sf $PWD/vimperatorrc ~/.vimperatorrc
ln -sf $PWD/xinitrc ~/.xinitrc
ln -sf $PWD/Xmodmap ~/.Xmodmap
ln -sf $PWD/Xresources ~/.Xresources
ln -sf $PWD/zpreztorc ~/.zpreztorc
ln -sf $PWD/zprofile ~/.zprofile
ln -sf $PWD/zshrc ~/.zshrc

# required for compilation
sudo pacman -S --noconfirm gcc make fakeroot

# install yaourt
sudo pacman -S --noconfirm binutils pkg-config
mkdir aur
cd aur
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ../..

# install xorg stuff
sudo pacman -S --noconfirm 

# set up zsh
# unfortunately, you will have to select the right prezto package
# you will also have to enter your password to be able to change the shell
sudo pacman -S --noconfirm zsh
yaourt prezto-git --noconfirm
chsh -s /bin/zsh
