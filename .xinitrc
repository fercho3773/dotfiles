#! /bin/bash

xset -r rate 90 75 &
setxkbmap -layout 'es' &

clipmenud &
dunst &
dwmblocks &
sxhkd &
xhidecursor &
xss-lock --slock &

brightnessctl s 25% &
sct 3200 &

#[ -f "$HOME/.Xmodmap" ]     && xmodmap "$HOME/.Xmodmap"
[ -f "$HOME/.Xresources" ]  && xrdb -merge "$HOME/.Xresources"
[ -f "$HOME/wall.jpg" ]     && xwallpaper --zoom "$HOME/wall.jpg"

#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &

#pipewire &
#pipewire-pulse &
#wireplumber &

# dbus
dbus-run-session dwm 

# nodbus
dwm

# This is not required when using seamless-restart patches for dwm
#while type dwm > /dev/null; do
#	dwm && continue || break
#done
