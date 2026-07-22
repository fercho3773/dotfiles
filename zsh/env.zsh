# statusbar and binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar/:$PATH"
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"
unsetopt PROMPT_SP 2>/dev/null

# Default programs:
export IMGVIEWER="feh"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="librewolf"

# manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="moor"
export MANROFFOPT="-c"

# system
export QT_QPA_PLATFORMTHEME="gtk2"

# wine
export WINEPREFIX="$HOME/wineprefixes/default"

# python
export VIRTUAL_ENV_DISABLE_PROMPT=1

# moor/moar (pager)
 export MOOR="--follow \
  --colors=256 \
  --render-unprintable=whitespace \
  --statusbar=plain \
  --tab-size=4 \
  --wrap"

# fzf fuzzy finder
export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --hidden \
  --strip-cwd-prefix \
  --exclude .git \
  --exclude dist
"

export _FZF_PREVIEW_CMD="bat \
  --color=always \
  --style=plain,numbers \
  --line-range=:500 {}
"

export FZF_DEFAULT_OPTS=" \
  --border=rounded \
  --height=90% \
  --highlight-line
  --layout=reverse \
  --margin=3 \
  --padding=0 \
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# eza
#export EZA_STRICT # makes eza error when two command-line options are incompatible
#export EZA_ICONS_AUTO

