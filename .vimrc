
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night-Bright
"colorscheme molokai

set bs=2
set ai
set ruler
set pastetoggle=<F2>
set title         " change the terminal's title
set tabstop=4     " a tab is four spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" http://vim.1045645.n5.nabble.com/How-to-disable-netrw-to-generate-history-file-tp4248939p4256854.html
au VimLeave * if filereadable("[path here]/.netrwhist")|call delete("[path here]/.netrwhist")|endif 
" you don't need to use : for commands
nnoremap ; :

nmap <F3> :NumbersToggle<CR>        " mapping f3 to NumbersToggle
set laststatus=2                    " Always show the statusline

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline

