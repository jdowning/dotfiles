#!/usr/bin/env bash
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
