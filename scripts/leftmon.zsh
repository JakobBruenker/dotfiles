#!/bin/zsh
xrandr --output HDMI1 --primary --mode 1920x1080 --left-of eDP1
feh --bg-fill ~/dotfiles/proprietary/background0.jpg
discord-canary &
setxkbmap -option caps:swapescape
xmodmap ~/.Xmodmap
