call plug#begin('~/.vim/plugged')
Plug '907th/vim-auto-save'
Plug 'Lokaltog/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tomtom/tcomment_vim'

" Display
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'

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

"" Development
Plug 'MaxMEllon/vim-jsx-pretty',  { 'for': ['javacsript', 'typescript'] }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'cohama/vim-hier'
Plug 'dag/vim-fish'
Plug 'dannyob/quickfixstatus'
Plug 'google/vim-jsonnet',        { 'for': 'jsonnet' }
Plug 'https://gist.github.com/fda08ddb08cdd90c40f4.git', {'for' : ['markdown', 'md'] }
Plug 'leafgarland/typescript-vim',{ 'for': ['javacsript', 'typescript'] }
Plug 'markcornick/vim-terraform', { 'for': 'terraform' }
Plug 'mattn/emmet-vim',           { 'for': ['html', 'javascript'] }
Plug 'mattn/vim-goimports'
Plug 'mpyatishev/vim-sqlformat',  { 'for': 'sql' }
Plug 'nvie/vim-flake8',           { 'for': 'python' }
Plug 'pangloss/vim-javascript',   { 'for': ['javacsript', 'typescript'] }
Plug 'posva/vim-vue',             { 'for': 'vue' }
Plug 'previm/previm', { 'for' : ['markdown', 'md', 'rst'] }
Plug 'racer-rust/vim-racer',      { 'for': 'rust' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
Plug 'slim-template/vim-slim',    { 'for': 'slim' }
Plug 'thinca/vim-quickrun'
Plug 'vim-ruby/vim-ruby',         { 'for': ['ruby', 'eruby'] }
Plug 'yoppi/fluentd.vim',         { 'for': 'fluentd' }

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
