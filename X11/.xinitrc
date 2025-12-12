#! /bin/zsh

xclip &
xcompmgr &
setxkbmap -layout 'es' &
xset -r rate 180 30 &

dunst & 
dwmblocks &

#pipewire &
#pipewire-pulse &
#wireplumber &

feh --bg-scale $WALLPAPER &
brightnessctl s 14% &
sct 2400 &
# redshift -t 2800:3750 -l 40:70 &
# wal --theme base16-gruvbox-hard --saturate 1.0 -l

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

while type dwm > /dev/null; do
	dwm && continue || break
done
