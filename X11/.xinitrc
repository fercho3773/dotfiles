#! /bin/sh

xclip &
xcompmgr &
setxkbmap -layout 'es' &
xset -r rate 125 40 &

dunst & 
dwmblocks &
xss-lock -- slock &
xhidecursor &

#pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber &

xwallpaper --zoom ~/wall.jpg &
brightnessctl s 20% &
sct 3200 &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

while type dwm > /dev/null; do
	dwm && continue || break
done
