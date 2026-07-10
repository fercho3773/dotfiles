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

ln -sfn "$dots/.xinitrc" "$HOME/.xinitrc"
ln -sfn "$dots/.Xresources"  "$HOME/.Xresources"
ln -sfn "$dots/.zshrc" "$HOME/.zshrc"

ln -sfn "$dots/dunst" "$conf/dunst"
ln -sfn "$dots/nvim" "$conf/nvim"
ln -sfn "$dots/tmux" "$conf/tmux"
ln -sfn "$dots/zathura" "$conf/zathura"
ln -sfn "$dots/zsh" "$conf/zsh"

# Notes:
# ln : makes links between files
#  -s : symbolic instead of hard links
#  -f : force
#  -n : no dereference
