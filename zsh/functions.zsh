# functions

# find man pages
#fman() {
#    man -k . | 
#    fzf -q "$1" --prompt='man> ' --preview $'echo {} | 
#    tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | 
#    xargs -r man' |
#    tr -d '()' |
#    awk '{printf "%s ", $2} {print $1}' |
#    xargs -r man

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


# search local bin
# se() {
#	choice="$(find ~/.local/bin -mindepth 2 -printf '%P\n' | fzf)"
#	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
#}

# compress into a zip file
# compress() {

# extract zip files
extract() {
  local fail() { echo "Could not extract file" }
  local pass_msg() { echo "File requires a password" }
  case $1 in
  *.tar.gz|*.tgz) tar -xzf "$1" || fail;;
  *.tar.bz2|*.tbz2) tar -xjf "$1" || fail;;
  *.tar.xz) tar -xvf "$1" || fail;;
  *.zip) unzip "$1" || fail;;
  *.rar) unrar x "$1" || fail;;
  *.7z) 7z "$1" || fail;; 
  *.iso) 7z "$1" || fail;; 
  *) echo "Unknown archive format";;
  esac
}

# compress into a zip file
# compress() {

# search local bin
# se() {
#	choice="$(find ~/.local/bin -mindepth 2 -printf '%P\n' | fzf)"
#	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
#}

# measure zsh startup time
timesh() {
  local output
  TIMEFMT='%*E'
  start=$( { time zsh -i -c exit; } 2>&1 )
  printf "Zsh startup time: %.2f ms\n" "$(( start * 1000 ))"
}


# interactive cd using zoxide & fzf
z() {
case "$1" in
"")
  local dir=$(  zoxide query --list --score | fzf \
        --nth 2.. --tac --no-sort --query "$*" \
        --bind 'enter:become:echo {2..}'
  ) && cd "$dir"
;;
*)  __zoxide_z "$@" && clear && pwd
;;
esac
}


