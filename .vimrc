set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'Raimondi/delimitMate'
  Plugin 'tpope/vim-surround'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'

call vundle#end()

"map <C-n> :NERDTreeToggle<CR>
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"better tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>i

"ctrl-p invocation
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 50
let g:ctrlp_follow_symlinks = 1

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
syntax on
set hlsearch
set incsearch
set mouse=a
set nu
set ruler
set scrolloff=4
set ttyfast
"set columns=80
"set wrapmargin=8
"set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
set showmatch
set ignorecase
set smartcase
set smarttab
set history=200
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set cmdheight=2
set showcmd
set noerrorbells
set cursorline
set autoindent
set smartindent
set nobackup
set nowb
set noswapfile
"set t_Co=256
set encoding=utf-8
autocmd BufWritePre * :%s/\s\+$//e
