wmname LG3D &

unclutter -root &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap -option caps:swapescape
[[ -f ~/.Xmodmap ]] && xmodmap .Xmodmap

feh --bg-fill ~/dotfiles/proprietary/background0.jpg

xrandr | grep "HDMI1 connected" > /dev/null &&
xrandr --output HDMI1 --primary --auto --left-of eDP1 &&
feh --bg-fill ~/dotfiles/proprietary/background0.jpg &&
skypeforlinux

urxvtd -q -o -f &

exec dwm
