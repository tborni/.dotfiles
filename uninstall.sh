#!/usr/bin/env bash

RESTORE_DIR=~/.dotfiles/.restore

restore_file() {
	local src=$1
	local dest=$2
	if [ -e "$src" -o -L "$src" ]; then
		# avoid problems with overwriting symlinks
		rm "$dest"
		cp -P "$src" "$dest"
	else
		rm "$dest"
	fi
}

if [ -d "$RESTORE_DIR" ]; then
	echo "Start uninstall..."

	restore_file "$RESTORE_DIR/.bashrc" ~/.bashrc		
	restore_file "$RESTORE_DIR/.vimrc" ~/.vimrc		
	restore_file "$RESTORE_DIR/.gitconfig" ~/.gitconfig		

	if [ -e ~/.bashrc ]; then
		source ~/.bashrc
	fi

	rm -rf "$RESTORE_DIR"

	echo "Uninstall finished"
else
	echo "Restore directory $RESTORE_DIR not found. Nothing to uninstall."	
fi
