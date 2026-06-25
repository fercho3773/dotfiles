# require super user
for x in \
    mount \
    umount \
    sv \
    su \
    shutdown \
    poweroff \
    reboot \
    pacman \
    vsv \
    vkpurge \
    xbps-reconfigure \
    xbps-remove \
    xbps-install
do
  if command -v doas >/dev/null 2>&1; then
     alias $x="doas $x"
  else
    alias $x="sudo $x"
  fi
done
unset x

# if exists, do alias
[ -x "$(command -v btop)" ] && alias top="btop"
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"
[ -x "$(command -v zathura)" ] && alias pdf="zathura"
[ -x "$(command -v pfetch)" ] && alias fetch="pfetch"
[ -x "$(command -v lf)" ] && alias fm="lf"

# verbose
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner"

# color and candy eye
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# abbreviations
alias \
	ka="killall" \
	g="git" \
	e='$EDITOR' \
	v='$EDITOR'
