#! /bin/sh

#xrandr --dpi 96 &
xset -r rate 90 75 &
setxkbmap -layout 'es' &
setxkbmap -option "caps:swapescape,altwin:left_alt_win" & # swap capslock w/ escape and swap super with lalt

dunst &
dwmblocks &
xhidecursor &
xss-lock --slock &

brightnessctl s 25% &
sct 3200 &

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap 
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
