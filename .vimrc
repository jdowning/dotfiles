set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-scripts/Gist.vim'
Plugin 'vim-scripts/Specky'
Plugin 'kien/ctrlp.vim'
Plugin 'walm/jshint.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-markdown'
Plugin 'Lokaltog/vim-powerline'
Plugin 'rodjek/vim-puppet', { 'name': 'puppet' }
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tsaleh/vim-tmux'
Plugin 'avakhov/vim-yaml'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-endwise'
call vundle#end()

syntax on
filetype plugin indent on
colorscheme jellybeans
set shell=zsh

set ai                                                       " always set autoindenting on
set backspace=2                                              " Fix broken backspace in some setups
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8                                           " UTF-8
set expandtab                                                " insert space characters whenever the tab key is pressed
set hlsearch                                                 " highlight search terms
set ignorecase                                               " ignore case when searching
set incsearch                                                " show search matches as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
"set paste
set pastetoggle=<F2>                                         " shortcut to toggle :set paste
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftround                                               " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2                                             " number of spaces to use for autoindenting
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set showmatch                                                " set show matching parenthesis
set smartcase                                                " ignore case if search pattern is all lowercase, case-sensitive otherwise
set tabstop=4                                                " a tab is four spaces
set title                                                    " change the terminal's title

" keyboard shortcuts
let mapleader = ","
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>p :Tabularize /=>/l1<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "★"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
let g:syntastic_javascript_checkers = ["jshint"]

" http://vim.1045645.n5.nabble.com/How-to-disable-netrw-to-generate-history-file-tp4248939p4256854.html
au VimLeave * if filereadable("~/.netrwhist")|call delete("~/.netrwhist")|endif

" you don't need to use : for commands
nnoremap ; :

" Enable fancy mode
let g:Powerline_symbols = 'fancy'   " Powerline

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" cap is ruby
autocmd BufRead,BufNewFile *.cap set filetype=ruby

" sudo save
cnoremap sudow w !sudo tee % >/dev/null
