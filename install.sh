#!/usr/bin/env  bash

set -euo pipefail

dots="$HOME/dotfiles"
lbin="$HOME/.local/bin"
conf="$HOME/.config/"

mkdir -p "$conf"
mkdir -p "$lbin"

# creates a symlink for each file in lbin
for file in "$dots/bin"/*; do
  [ -e "$file" ] || continue
  ln -sfn "$file" "$lbin/$(basename "$file")"
done

# single files
#ln -sfn "$dots/.asoundrc"     "$HOME/.asoundrc"
ln -sfn "$dots/.xinitrc"      "$HOME/.xinitrc"
ln -sfn "$dots/.Xresources"   "$HOME/.Xresources"
ln -sfn "$dots/.zshrc"        "$HOME/.zshrc"

ln -sfn "$dots/starship.toml" "$conf/starship.toml"

# .config
for x in \
  feh \
  dunst \
  latexmk \
  mpv \
  nvim \
  tmux \
  zathura \
  zsh
do
  mkdir -p "$conf/$x" || echo "fail"
  ln -sfn "$dots/$x" "$conf/x" | echo "done $x" || echo "fail"
done
unset x

# Notes:
# ln : makes links between files
#  -s : symbolic instead of hard links
#  -f : force
#  -n : no dereference
