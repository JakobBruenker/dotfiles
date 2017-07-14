# download this script and run it

# make sure everything is up to date
sudo pacman -Syyu

# create links to all config files
mkdir -p ~/.local/share/stack
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
