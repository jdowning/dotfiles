#!/usr/bin/env bash
set -e
if [ ! -f "$HOME/coffeelint.json" ]
then
  ln -s "$HOME/.dotfiles/js/coffeelint.json" "$HOME/coffeelint.json"
fi
