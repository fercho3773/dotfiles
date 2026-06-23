#!/bin/sh

whichsu() {
  if command -v doas >/dev/null 2>&1; then
    echo doas
  elif command -v sudo >/dev/null 2>&1; then
    echo sudo
  else
    echo "Neither sudo or doas is installed."
  fi
}

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
    alias $x="$whichsu $x"
done

unset x

# to do: move to bin local doc compiler
#alias \
#  tw="typst watch --pdf-standard 1.5" \
#  yta="yt-dlp -x -f 251 --embed-metadata --embed-thumbnail --no-playlist" \
#  mylatex="latexmk -pdf -pvc -auxdir=temp -outdir=. main.tex"\

[ -x "$(command -v btop)" ] && alias top="btop"
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"
[ -x "$(command -v zathura)" ] && alias pdf="zathura"

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
