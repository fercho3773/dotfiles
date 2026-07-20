#!/bin/sh

set euo -pipefail

dots="$HOME/dotfiles"
lbin="$HOME/.local/bin"
conf="$HOME/.config/"

mkdir -p "$conf"
mkdir -p "$lbin"

# Creates a symlink for each file in lbin
for file in "$dots/bin"/*; do
    [ -e "$file" ] || continue
    ln -sfn "$file" "$lbin/$(basename "$file")"
done

# single files
#ln -sfn "$dots/.asoundrc"     "$HOME/.asoundrc"
ln -sfn "$dots/.xinitrc"      "$HOME/.xinitrc"
ln -sfn "$dots/.Xresources"   "$HOME/.Xresources"
ln -sfn "$dots/.zshrc"        "$HOME/.zshrc"

# .config
for x in \
  feh \
  dunst \
  mpv \
  nvim \
  tmux \
  zathura \
  zsh
do
  mkdir -p "$conf/$x" 
  ln -sfn "$dots/$x" "$conf/x"
done
unset x

# Notes:
# ln : makes links between files
#  -s : symbolic instead of hard links
#  -f : force
#  -n : no dereference
