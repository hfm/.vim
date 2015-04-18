" skip if vim-tiny or vim-small
if !1 | finish | endif

if &compatible
  set nocompatible
endif

" NeoBundle
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  set rtp+=$GOROOT/misc/vim
  exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/golang/lint/misc/vim')
endif

call neobundle#begin(expand('~/.vim/bundle/'))
if neobundle#has_cache()
  NeoBundleLoadCache
else
  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'Shougo/vimproc.vim', { 'build': {
        \ 'mac'  : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ }}

  call neobundle#load_toml('~/.vim/neobundle.toml')
  call neobundle#load_toml('~/.vim/neobundlelazy.toml', {'lazy' : 1})

  NeoBundleSaveCache
endif

if filereadable(expand('~/.vim/plugins.rc.vim'))
  source ~/.vim/plugins.rc.vim
endif
call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" Display
syntax enable
colorscheme hybrid
set number
set title
set showcmd
set ruler
set list
set listchars=eol:$,tab:>\ ,extends:<
set laststatus=2
set ambiwidth=double
set pumheight=20
set showmatch
set matchtime=1
runtime macros/matchit.vim
if has('mac')
  set guifont=RictyForPowerline-Regular
  set guifontset=RictyForPowerline-Regular
  set guifontwide=RictyForPowerline-Regular
endif

" Encode and Files
set encoding=utf-8
set fileencoding=utf-8
set hidden
set autoread
set backupdir=$HOME/.backup/vim
set browsedir=buffer
set directory=$HOME/.backup/vim
set history=10000
set noswapfile
set nofoldenable

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Input
set cindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed
set nrformats=""

" Keymaps
nnoremap Y y$
"" for perl
inoremap <C-d> $
inoremap <C-a> @
