#! /bin/sh

#xrandr --dpi 96 &
xset -r rate 100 50 &
setxkbmap -layout 'es' &

dunst
dwmblocks
xhidecursor
xss-lock --slock

brightnessctl s 25%
sct 3200

[[ -f ~/.Xresources ]] && xmodmap ~/.Xmodmap 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/wall.jpg ]]    && xwallpaper --zoom ~/wall.jpg

#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &

pipewire &
pipewire-pulse &
wireplumber &

dbus-run-session dwm 

#while type dwm > /dev/null; do
#	dwm && continue || break
#done
