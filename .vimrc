
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
colorscheme molokai

if has("gui_running")
  syntax on
  set hlsearch
  colorscheme molokai
  set bs=2
  set ai
  set ruler
endif

