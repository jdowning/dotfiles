#!/usr/bin/env bash
set -e
mkdir -p "$HOME/.config/mise"
ln -s "$HOME/.dotfiles/mise/config.toml" "$HOME/.config/mise/config.toml"
