# necessary for java gui stuff
wmname LG3D &

unclutter -root &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#setxkbmap -option caps:swapescape
#[[ -f ~/.Xmodmap ]] && xmodmap .Xmodmap

feh --bg-fill ~/dotfiles/proprietary/background0.jpg

# TODO: decide automatically what to do based on which outputs are connected
xrandr | grep "HDMI-1 connected" > /dev/null &&
xrandr | grep "DVI-D-1 connected" > /dev/null &&
xrandr --output HDMI-1 --noprimary --auto --right-of DVI-D-1
#xrandr | grep "HDMI1 connected" > /dev/null &&
#xrandr --output HDMI1 --secondry --auto --left-of eDP1
# feh --bg-fill ~/dotfiles/proprietary/background0.jpg
nitrogen --restore

# xcompmgr -c -r 12 -o 0.75 -l 0.096 -O 0.10 -f &
compton -c -r 12 &
exec dwm
