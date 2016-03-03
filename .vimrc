if !has('nvim')
  set nocompatible
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

"-------------------------------------------------------------------------------
" Vundle Plugins

call vundle#begin()

  " UI
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'lilydjwg/colorizer'

  " Integrations
  Plugin 'Raimondi/delimitMate'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary.git'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'

  " Syntax
  Plugin 'derekwyatt/vim-scala'
  Plugin 'mxw/vim-jsx'
  Plugin 'nikvdp/ejs-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'keith/tmux.vim'

call vundle#end()

filetype plugin on
filetype indent on

"-------------------------------------------------------------------------------
" General Settings

set encoding=utf-8
set history=200
set fileformats=unix,dos,mac

set backspace=indent,eol,start

" Enable persistent undos
set undofile
set undolevels=5000
set undodir=$HOME/.vim_undo_files

set mouse=a
set ttymouse=xterm2
set cursorline

set t_Co=256

"-------------------------------------------------------------------------------
" Buffer Settings

" Disable backup
set nobackup
set nowb
set noswapfile

" Trims all trailing whitespace before writing
autocmd BufWritePre * :%s/\s\+$//e

autocmd FocusLost * silent! wa

"-------------------------------------------------------------------------------
" Text Settings

" Two space tabs or bust
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent

set nowrap

" Highlight over 80 columns
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/

"-------------------------------------------------------------------------------
" UI Settings

syntax on

set hlsearch

set scrolloff=4

" Show partially typed commands
set cmdheight=2
set showcmd

set ruler
set ttyfast

set noerrorbells

" Line numbers
set number
set numberwidth=2

set showmatch

set splitright

"-------------------------------------------------------------------------------
" Search/Autocomplete

set incsearch
set ignorecase
set smartcase

"-------------------------------------------------------------------------------
" Plugin/Remap Settings

" NERDTree
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 50
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|_site|output)|(\.(swp|ico|git|svn))$'

" Better tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>i
