# functions

# vifm set working directory after exit
vicd()  {
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# show ip address
netinfo ()  {
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

# package cleanup
pac() {
  echo "xbps-remove -yo && xbps-remove -OO && vkpurge rm all" 
  xbps-remove -yo && xbps-remove -OO && vkpurge rm all ; 
}

# package information
#paq() { [ -n "$1" ] && xbps-query -RS $@ ; } #query
paq() {
  if [ -z "$2" ]; then 
    clear && echo "xbps-query -R"
    PACKAGE="$(xpkg | fzf --multi --query="$1")"
    [ -n "$PACKAGE" ] && xbps-query -R $PACKAGE
  else
    echo "xbps-remove -Ry"
    xbps-remove -Ry "$@"
  fi
}

# list manually installed
pal() { 
  xpkg -m | column
}

pam() { 
  xbps-pkgdb -m $@
} # hold package

# pkg number
pan() {
  echo "xpkg | wc -l"
  xpkg | wc -l
}

# pkg update
pau() { 
  echo "xbps-install -Suy"
  xbps-install -Suy
}

# pkg remove
par() {
  if [ -z "$1" ]; then 
    clear && echo "xbps-remove -Ry"
    PACKAGE="$(xpkg | fzf --multi --query="$1")"
    [ -n "$PACKAGE" ] && xbps-remove -Ry $PACKAGE
  else
    xbps-remove -Ry "$@"
  fi
}

# find or install
paf() {
  if [ -z "$2" ]; then
    clear && echo "xbps-query -RS"
    PACKAGE="$(xpkg -a | fzf --multi --query="$*" --preview="xbps-query -RS {}")"
    [ -n "$PACKAGE" ] && xbps-install -Sy $PACKAGE
  else
    xbps-install -Sy "$@"
  fi
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


# search local bin
# se() {
#	choice="$(find ~/.local/bin -mindepth 2 -printf '%P\n' | fzf)"
#	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
#}

# extract zip files
extract() {
  case $1 in
    *.tar.gz|*.tgz) tar -xzf "$1";;
    *.tar.bz2|*.tbz2) tar -xjf "$1";;
    *.zip) unzip "$1";;
    *.rar) unrar x "$1";;
    *.7z) 7z "$1";; 
    *.iso) 7z "$1";; 
    *) echo "Unknown archive format";;
  esac
}

# compress into a zip file
# compress() {
#
#}
