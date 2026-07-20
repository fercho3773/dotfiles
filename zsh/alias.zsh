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
  lah="clear && ls -lah" \
  psa="ps aux" \
  cls="clear" \
	ka="killall" \
	g="git" \
	e='$EDITOR' \
	v='$EDITOR' \
  vi='$EDITOR'

# others
alias \
  xloc-install="xbps-install -R hostdir/binpkgs" \
  qmk="make clean && sudo make install" \


# if exists, do alias
[ -x "$(command -v btop)" ]     && alias top="btop"
[ -x "$(command -v nvim)" ]     && alias vim="nvim" vimdiff="nvim -d"
[ -x "$(command -v pfetch)" ]   && alias fetch="pfetch"
[ -x "$(command -v zathura)" ]  && alias pdf="zathura"

[ -x "$(command -v grep)" ]  && compdef rg=grep && alias \
  grep="rg --color=auto"

[ -x "$(command -v bat)" ]  && \
  alias cat="bat"

[ -x "$(command -v eza)" ] && \
  compdef eza=ls  && \
  alias \
  tree="clear && eza --tree --icons --level=3" \
  lah="clear && eza -lah --git --group-directories-first" \
  ll="clear && eza -lh  --git --icons --group-directories-first" \
  ls="clear && eza --icons -l"

[ -x "$(command -v feh)" ]  && alias feh="feh \
--auto-zoom \
--cache-size 10 \
--draw-filename \
--draw-tinted \
--preload \
--recursive \
--scroll-step 150 \
"
# file manager
[ -x "$(command -v vifm)" ]  && alias fm="vifm"

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
    xbps-pkgdb \
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
unset  x

