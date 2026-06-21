#! /bin/sh

xclip &
xcompmgr &
xrandr --dpi 96 &
xset -r rate 100 50 &

setxkbmap -layout 'es' &

dunst & 
dwmblocks &
xss-lock -- slock &
xhidecursor &

#pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber &

brightnessctl s 20% &
sct 3200 &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/wall.jpg]] && xwallpaper --zoom ~/wall.jpg


while type dwm > /dev/null; do
	dwm && continue || break
done
