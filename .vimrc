set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

  Plugin 'scrooloose/nerdtree'
  Plugin 'Raimondi/delimitMate'
  Plugin 'tpope/vim-surround'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'tpope/vim-fugitive'

call vundle#end()

map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
syntax on
set hlsearch
set incsearch
set mouse=a
set nu
set ruler
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
"set wrap
set autoindent
set smartindent
set nobackup
set nowb
set noswapfile
"set t_Co=256
set encoding=utf-8
autocmd BufWritePre * :%s/\s\+$//e
