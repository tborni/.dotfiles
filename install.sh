#!/usr/bin/env bash

set -e

echo "Start configuration..."

backup_file() {
    local src=$1
    local dest=$2
    if [ -e "$src" ]; then
        cp -P "$src" "$dest"
        echo "Backup of $src created"
    fi
}

RESTORE_DIR=~/.dotfiles/.restore
if [ -d "$RESTORE_DIR" ]; then
	echo "Restore directory already exists"
else
	mkdir "$RESTORE_DIR"

	backup_file ~/.bashrc "$RESTORE_DIR/.bashrc"
	backup_file ~/.vimrc "$RESTORE_DIR/.vimrc"
	backup_file ~/.gitconfig "$RESTORE_DIR/.gitconfig"
fi


ln -sf ~/.dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig

source ~/.bashrc

echo "Configuration finished!"
