# functions

netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}

# xbps helper
# Credits to kitu
# https://www.youtube.com/watch?v=CbtKcPpmP5A

# cleanup
pac() { 
  xbps-remove -yo && xbps-remove -OO && vkpurge rm all ; 
}

# install
pai() { [ -n "$1" ] && xbps-install -Sy "$@"; } 

pal() { xpkg -m | column; } # list manually installed

pam() { xbps-pkgdb -m $@; } # hold package

pan() { xpkg | wc -l; } # number package

paq() { [ -n "$1" ] && xbps-query -RS $@ ; } #query

pau() { xbps-install -Suy; } #update

# remove
par() {
  if [ -z "$2" ]; then 
    clear && echo "xbps-remove -Ry"
    PACKAGE="$(xpkg | fzf --multi --query="$1")"
    [ -n "$PACKAGE" ] && xbps-remove -Ry $PACKAGE
  else
    xbps-remove -Ry "$@"
  fi
}

# find
paf() {
  clear && echo "xbps-query -RS"
  PACKAGE="$(xpkg -a | fzf --multi --query="$*" --preview="xbps-query -RS {}")"
  [ -n "$PACKAGE" ] && xbps-install -Sy $PACKAGE
}

# tmux stuff
tmux () {
  case "$1" in
        "as")
            shift
            command tmux attach-session -t "$@"
            ;;
        "ks")
            shift
            command tmux kill-session -t "$@"
            ;;
        "ns")
            shift
            command tmux new-session -s "$@"
            ;;
        *)
            command tmux "$@"
            ;;
  esac
}


# fzf fuzzy finder
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden

# find man pages
#fman() {
#    man -k . | 
#    fzf -q "$1" --prompt='man> ' --preview $'echo {} | 
#    tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | 
#    xargs -r man' |
#    tr -d '()' |
#    awk '{printf "%s ", $2} {print $1}' |
#    xargs -r man


se() {
	choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
	}

extract() {
  case $1 in
    *.tar.gz|*.tgz) tar -xzf "$1";;
    *.tar.bz2|*.tbz2) tar -xjf "$1";;
    *.zip) unzip "$1";;
    *.rar) unrar x "$1";;
    *.iso) 7z "$1";; 
    *) echo "Unknown archive format";;
  esac
}
