if !has('nvim')
  set nocompatible
endif

filetype off

"-------------------------------------------------------------------------------
" Plugins

call plug#begin('~/.vim/plugged')

  " UI
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'lilydjwg/colorizer'

  " Integrations
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sleuth'
  Plug 'myusuf3/numbers.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'unblevable/quick-scope'

  " Debugging
  Plug 'w0rp/ale'

  " Syntax
  Plug 'mxw/vim-jsx'
  Plug 'nikvdp/ejs-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

call plug#end()

filetype plugin on
filetype indent on

"-------------------------------------------------------------------------------
" General Settings

let mapleader=","
let maplocalleader=","

set encoding=utf-8
set history=200
set fileformats=unix,dos,mac
set wildmenu
set updatetime=300

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

fun! Refresh()
  set noconfirm
  bufdo e!
  syntax on
  set confirm
endfun

nnoremap <leader>r :call Refresh()<CR>

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

set wrap

" Highlight over 80 columns
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/

"-------------------------------------------------------------------------------
" UI Settings

syntax on
colorscheme onedark
let g:onedark_termcolors=16

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

set background=dark

" let g:php_folding=1
" set foldmethod=syntax

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
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" fzf
nnoremap <leader>p :Files<CR>
nnoremap <leader>P :GFiles<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" Ale
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tsserver', 'eslint'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\}

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

nmap <leader>f <Plug>(ale_fix)

" Mustache shortcuts
let g:mustache_abbreviations = 1

" Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Better tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>i

" Visual vertical movement
nnoremap j gj
nnoremap k gk

"-------------------------------------------------------------------------------
" CoC settings
set hidden
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
