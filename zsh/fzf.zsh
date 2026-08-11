# fzf zsh file
export FZF_DEFAULT_COMMAND="fd \
--type f \
--hidden \
--strip-cwd-prefix \
--exclude .git \
--exclude dist \
--info right
"

export _FZF_PREVIEW_CMD="bat \
--color=always \
--style=plain,numbers \
--line-range=:500 {}
"

export FZF_DEFAULT_OPTS=" \
--info right \
--border=rounded \
--height=90% \
--highlight-line
--layout=reverse \
--margin=3 \
--padding=0 \
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

_fzf_clean_find() {
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
