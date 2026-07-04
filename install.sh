#!/bin/sh

dots="$HOME/dotfiles"
lbin="$HOME/.local/bin"
conf="$HOME/.config/"

mkdir -p "$conf"
mkdir -p "$lbin"

ln -sf "$dots/bin/statusbar" "$lbin/statusbar"

ln -sf "$dots/.xinitrc" "$HOME/.xinitrc"
ln -sf "$dots/.Xresources"  "$HOME/.Xresources"
ln -sf "$dots/.zshrc" "$HOME/.zshrc"

ln -sf "$dots/dunst" "$conf/dunst"
ln -sf "$dots/nvim" "$conf/nvim"
ln -sf "$dots/tmux" "$conf/tmux"
ln -sf "$dots/zathura" "$conf/zathura"
ln -sf "$dots/zsh" "$conf/zsh"
