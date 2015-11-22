call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Enable mouse
set mouse=a

" Fast saving
nmap <leader>w :w!<cr>

" Line number
set number

" Toggle absolute and relative line numbering
nnoremap <leader>n :call NumberToggle()<cr>

" When a new file is opened, all folds should be expanded
set foldlevel=99

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Search settings
set ignorecase
set smartcase
" set hlsearch
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells

" NERDTree keyboard shortcut
nmap <leader>nt :NERDTree<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coloring themes and fonts 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:airline_theme = 'powerlineish'

" Syntax highlighting for Golang
set runtimepath+=$GOROOT/misc/vim
let mapleader = ','
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

" CtrlP plugin
set runtimepath^=~~/.vim/bundle/ctrlp.vim

" Always display the status line
set laststatus=2

" Set vim-airline font
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline_powerline_fonts = 1

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
