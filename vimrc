if has('vim_starting')
  exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/golang/lint/misc/vim')
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'justinmk/vim-dirvish'

" Syntax/Alignment
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'

" Cursor
Plug 'Lokaltog/vim-easymotion'

" Productivity
Plug '907th/vim-auto-save'

" Display
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'

" Syntax
Plug 'osyo-manga/vim-watchdogs', { 'for': 'all' } | Plug 'osyo-manga/shabadou.vim'
Plug 'cohama/vim-hier'
Plug 'dannyob/quickfixstatus'

" Markdown or texts
Plug 'https://gist.github.com/fda08ddb08cdd90c40f4.git', {'for' : ['markdown', 'md'] }
Plug 'previm/previm', { 'for' : ['markdown', 'md', 'rst'] }
      \| Plug 'tyru/open-browser.vim', { 'for' : ['markdown', 'md', 'rst'] }

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/switch.vim'

"" Languages
Plug 'rodjek/vim-puppet',         { 'for': 'puppet' }
Plug 'mattn/emmet-vim',           { 'for': ['html', 'javascript'] }
Plug 'nvie/vim-flake8',           { 'for': 'python' }
Plug 'vim-ruby/vim-ruby',         { 'for': ['ruby', 'eruby'] }
Plug 'vim-perl/vim-perl',         { 'for': 'perl' }
Plug 'vim-jp/vim-go-extra',       { 'for': 'go' }
Plug 'elixir-lang/vim-elixir',    { 'for': 'elixir' }
Plug 'yoppi/fluentd.vim',         { 'for': 'fluentd' }
Plug 'glidenote/roadworker.vim',  { 'for': 'ruby.roadworker' }
Plug 'markcornick/vim-terraform', { 'for': 'terraform' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
Plug 'racer-rust/vim-racer',      { 'for': 'rust' }
Plug 'mpyatishev/vim-sqlformat',  { 'for': 'sql' }
Plug 'stevearc/vim-arduino',      { 'for': 'arduino' }
Plug 'slim-template/vim-slim',    { 'for': 'slim' }
Plug 'posva/vim-vue',             { 'for': 'vue' }
Plug 'google/vim-jsonnet',        { 'for': 'jsonnet' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'sudar/vim-arduino-syntax',  { 'for': 'ino' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim',  { 'for': ['ts', 'tsx'] }
Plug 'MaxMEllon/vim-jsx-pretty'

" Development
Plug 'thinca/vim-quickrun'

"" Operators / Text objects (textobj)
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'thinca/vim-textobj-between'

call plug#end()

augroup vimrc
  autocmd!
augroup END

if filereadable(expand('~/.vim/plugins.rc.vim'))
  source ~/.vim/plugins.rc.vim
endif

filetype plugin indent on

" Display
if !has('gui_running')
  set t_Co=256
endif
set background=dark
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
set formatoptions+=mM
set pumheight=20
set wildmenu
set lazyredraw
set showmatch
set matchtime=1
set scrolloff=5
runtime macros/matchit.vim
if has('mac')
  set guifont=Cica:h16
  set printfont=Cica:h12
endif

" Encode and Files
set encoding=utf8
set fileencoding=utf8
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
autocmd FileType *
      \ if &l:omnifunc == ''
      \| setlocal omnifunc=syntaxcomplete#Complete
      \| endif

" Keymaps
nnoremap Y y$
