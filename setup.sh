#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

backup_and_link() {
	src="$1"
	dest="$2"

	if [ ! -e "$src" ]; then
		echo "Skipping: $src does not exist"
		return
	fi

	if [ -L "$dest" ]; then
		echo "Removing existing symlink: $dest"
		rm "$dest"
	elif [ -e "$dest" ]; then
		echo "Backing up existing: $dest"
		mkdir -p "$BACKUP_DIR"
		mv "$dest" "$BACKUP_DIR/"
	fi

	mkdir -p "$(dirname "$dest")"

	echo "Linking: $dest -> $src"
	ln -s "$src" "$dest"
}

# nvim

backup_and_link "$DOTFILES/nvim" "$HOME/.config/nvim"

# kitty

backup_and_link "$DOTFILES/kitty" "$HOME/.config/kitty"

# zshrc

backup_and_link "$DOTFILES/shells/zshrc" "$HOME/.zshrc"
