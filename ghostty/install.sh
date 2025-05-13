#!/usr/bin/env bash
set -e
if [ -e "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ] ||
   [ -h "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ]
then
	rm "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
fi

ln -s "$HOME/.dotfiles/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
