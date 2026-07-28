# fzf zsh file

fzfcleanfind() {
  clear | fd --type f --exclude .git --exclude dist | fzf
}
zle -N fzfcleanfind
bindkey '^F' fzfcleanfind

_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
