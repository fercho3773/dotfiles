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

# 2.X11 config files
#[ -f "$HOME/.Xmodmap" ]     && xmodmap "$HOME/.Xmodmap"
[ -f "$HOME/.Xresources" ]  && xrdb -merge "$HOME/.Xresources"
[ -f "$HOME/wall.jpg" ]     && xwallpaper --zoom "$HOME/wall.jpg"

# 3. start pipewire 
# This is not needed when using pure alsa
pipewire & 

# 4. start dwm
dbus-run-session dwm 
#dwm

# This is not required when using seamless-restart patches for dwm
#while type dwm > /dev/null; do
#	dwm && continue || break
#done

# 5. start pipewire
# Not needed when using alsa only
