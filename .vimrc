
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night-Bright
"colorscheme molokai
set number
set hlsearch
set bs=2
set ai
set ruler

" http://vim.1045645.n5.nabble.com/How-to-disable-netrw-to-generate-history-file-tp4248939p4256854.html
au VimLeave * if filereadable("[path here]/.netrwhist")|call delete("[path here]/.netrwhist")|endif 
