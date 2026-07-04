# require super user

for x in \
    mount \
    umount \
    sv \
    su \
    shutdown \
    poweroff \
    reboot \
    iptables \
    nftables \
    ufw \
    apt \
    apt-get \
    dnf \
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
[ -x "$(command -v btop)" ]     && alias top="btop"
[ -x "$(command -v nvim)" ]     && alias vim="nvim" vimdiff="nvim -d"
[ -x "$(command -v zathura)" ]  && alias pdf="zathura"
[ -x "$(command -v pfetch)" ]   && alias fetch="pfetch"
#[ -x "$(command -v lf)" ]       && alias fm="lf"
[ -x "$(command -v noice)" ]    && alias fm="noice"

# verbose
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner" \
  free="free -h"

# color and candy eye
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# abbreviations
alias \
  psa="ps aux" \
  cls="clear" \
	ka="killall" \
	g="git" \
	e='$EDITOR' \
	v='$EDITOR' \
  vi='$EDITOR'
