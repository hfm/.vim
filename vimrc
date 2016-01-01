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
Plug 'justinmk/vim-dirvish'

" Syntax
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'

" Cursor
Plug 'Lokaltog/vim-easymotion'

" Productivity
Plug '907th/vim-auto-save'
Plug 'VOoM'

" Display
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'

" Completion
Plug 'Shougo/neocomplete.vim', { 'on': [] }
      \| Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim', { 'on': [] }
Plug 'hfm/neosnippet-snippets',       { 'on': [], 'for': 'snippet' }
Plug 'honza/vim-snippets',            { 'on': [], 'for': 'snippet' }
Plug 'glidenote/serverspec-snippets', { 'on': [], 'for': 'snippet' }
Plug 'hfm/itamae-snippets',           { 'on': [], 'for': 'snippet' }
Plug 'hfm/terraform-snippets.vim',    { 'on': [], 'for': 'snippet' }

Plug 'cohama/lexima.vim', { 'on'  : [] }
Plug 'AndrewRadev/switch.vim'
Plug 'mattn/sonictemplate-vim'

augroup load_on_insert
  autocmd!
  autocmd InsertEnter * call plug#load('neocomplete.vim', 'neosnippet.vim', 'neosnippet-snippets', 'serverspec-snippets', 'itamae-snippets', 'terraform-snippets.vim', 'lexima.vim')
                     \| NeoCompleteEnable | autocmd! load_on_insert
augroup END

" Syntax
Plug 'osyo-manga/vim-watchdogs', { 'for': 'all' } | Plug 'osyo-manga/shabadou.vim'
Plug 'cohama/vim-hier'
Plug 'dannyob/quickfixstatus'
Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Markdown or texts
Plug 'https://gist.github.com/fda08ddb08cdd90c40f4.git', {'for' : ['markdown', 'md'] }
Plug 'kannokanno/previm', { 'for' : ['markdown', 'md', 'rst'] }
      \| Plug 'open-browser.vim', { 'for' : ['markdown', 'md', 'rst'] }
Plug 'glidenote/memolist.vim', { 'on' : ['MemoNew', 'MemoList', 'MemoGrep'] }

" Languages
Plug 'rodjek/vim-puppet',         { 'for': 'puppet' }
Plug 'mattn/emmet-vim',           { 'for': 'html' }
Plug 'nvie/vim-flake8',           { 'for': 'python' }
Plug 'vim-ruby/vim-ruby',         { 'for': ['ruby', 'eruby'] }
Plug 'vim-perl/vim-perl',         { 'for': 'perl' }
Plug 'vim-jp/vim-go-extra',       { 'for': 'go' }
Plug 'nsf/gocode',                { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'elixir-lang/vim-elixir',    { 'for': 'elixir' }
Plug 'yoppi/fluentd.vim',         { 'for': 'fluentd' }
Plug 'kchmck/vim-coffee-script',  { 'for': 'coffee' }
Plug 'glidenote/roadworker.vim',  { 'for': 'ruby.roadworker' }
Plug 'markcornick/vim-terraform', { 'for': 'terraform' }

" Development
Plug 'thinca/vim-quickrun', { 'on' : 'Quickrun' }

"" Operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'

" Text objects (textobj)
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'thinca/vim-textobj-between'

call plug#end()

if filereadable(expand('~/.vim/plugins.rc.vim'))
  source ~/.vim/plugins.rc.vim
endif

filetype plugin indent on

" Display
set t_Co=256
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
