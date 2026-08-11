# verbose
alias \
  bc="bc -ql" \
  cp="cp -iv" \
  ln='ln -iv' \
  mv="mv -iv" \
  rm="rm -vI" \
  mkd="mkdir -pv" \
  ffmpeg="ffmpeg -hide_banner" \
  free="free -h" \
  xargs="xargs --verbose"

# color and candy eye
alias \
  diff="diff --color=auto" \
  ccat="highlight --out-format=ansi" \
  grep="grep --color=auto" \
  ls="ls -hN --color=auto --group-directories-first" \
  ip="ip -color=auto"

# abbreviations 
alias \
  {lg,lgit}="lazygit" \
  psa="ps aux" \
  ka="killall" \
  img='$IMGVIEWER' \
  {v,vi,e}='$EDITOR' \
  py="python3"

# typo
alias \
  {clr,claer}="clear" \
  {les,lses}="less" \
  {moer,mroe}="more" \
  {whihc,whic,wihch}="which"

# others
alias \
  {cls,csl}="clear; ls" \
  {soap,open}="xdg-open" \
  lah="clear && ls -lah" \
  {xli,xloc-install}="xbps-install -R hostdir/binpkgs" \
  {pdate,printdate}="date '+%Y-%m-%d %H:%M:%S'" 
  
# make
alias \
  {mka,qmk}="make clean ; make ; make install" \
  mki="make install" mku='make uninstall' mkc='make clean' mkk='make' 

# git
alias \
  {g,gti}="git"\
  gclone="git clone --progress" \
  gdiff="git diff --stat" \
  gpush="git push -v" \
  gpull="git pull -v" \
  gfetch="git fetch -v --progress" \
  {gst,gstat}="git status -sb" \
  glog="git log --graph --decorate | less" \
  glogg="git log --oneline --graph --decorate | less" \
  {gcom,gcomm}="git commit -v"

# network
alias \
  curl="curl -v" \
  ping="ping -v" \
  {p3,ping3}="ping -3 -v" \
  scp="scp -v" \
  ssh="ssh -v"
  wget="wget -v --show-progress" \

# if exists, do alias
[ -x "$(command -v leaf)" ]  && alias md="leaf -w"
[ -x "$(command -v bat)" ]  && alias cat="bat"
[ -x "$(command -v btop)" ]     && alias top="btop"
[ -x "$(command -v nvim)" ]     && alias vim="nvim" vimdiff="nvim -d"
[ -x "$(command -v pfetch)" ]   && alias fetch="pfetch"
[ -x "$(command -v vifm)" ]  && alias fm="vifm"
[ -x "$(command -v zathura)" ]  && alias pdf="zathura" {pdfin,zatt}="zathura -"

[ -x "$(command -v eza)" ] && compdef eza=ls  && alias \
tree="clear && eza --tree --icons --level=3" \
lah="clear && eza -lah --git --group-directories-first" \
ll="clear && eza -lh --git --icons --group-directories-first" \
ls="clear && eza --icons -l"

[ -x "$(command -v feh)" ] && alias feh="feh \
--auto-zoom \
--cache-size 10 \
--draw-filename \
--draw-tinted \
--preload \
--recursive \
--scroll-step 150 \
"

[ -x "$(command -v grep)" ] && compdef rg=grep && alias \
grep="rg --color=auto"

# require super user
for x in \
visudo \
mount umount \
sv su \
shutdown poweroff reboot \
iptables nftables ufw \
apt apt-get dnf \
pacman paru yay \
vsv vpm vkpurge \
xbps-pkgdb xbps-reconfigure xbps-remove xbps-install
do
  if command -v doas >/dev/null 2>&1; then
     alias $x="doas $x"
  else
    alias $x="sudo $x"
  fi
done
unset  x
