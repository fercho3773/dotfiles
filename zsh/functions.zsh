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

# tmux helper
tmux () {
case "$1" in
"as")
  shift
  if [[ -z "$1" ]]; then
  tmux list-session \
    | fzf --header "tmux attach-session -t" \
    | sed 's/:.*//' \
    | read xyz && tmux attach-session -t "$xyz" || unset xyz
  else
    tmux attach-session -t "$1"
  fi
  ;;
"ks")
  shift
  if [[ -z "$1" ]]; then
  tmux list-session \
    | fzf --header "tmux kill-session -t" \
    | sed 's/:.*//' \
    | read xyz && tmux kill-session -t "$xyz" || unset xyz
  else
    tmux kill-session -t "$1" && echo "Killed tmux session: $1"
  fi
  ;;
"ns")
  shift
  command tmux new-session -s "$@"
  ;;
"ls")
  shift
  command tmux list-sessions
  ;;
*)
  command tmux "$@"
  ;;
esac
}

# fzf
fzfcleanfind() {
  clear | fd --type f --exclude .git --exclude dist | fzf
}
zle -N fzfcleanfind
bindkey '^F' fzfcleanfind

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
