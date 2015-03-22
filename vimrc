scriptencoding utf-8

" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set rtp+=~/.vim/bundle/neobundle.vim/
  set rtp+=$GOROOT/misc/vim
  exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/golang/lint/misc/vim')
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"" plugin
NeoBundle 'Shougo/vimproc', { 'build' : {
  \   'mac'   : 'make -f make_mac.mak',
  \   'linix' : 'make',
  \   'unix'  : 'gmake',
  \ }}
NeoBundleLazy 'Shougo/neocomplete.vim', {"autoload": {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet', {'autoload': {'insert': 1}}
NeoBundleLazy 'tacahilo/neosnippet-snippets', {'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/unite.vim', {'autoload': {'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCurrentDir']}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload': {'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCurrentDir']}}
" NeoBundle 'rcmdnk/vim-markdown'
NeoBundle '907th/vim-auto-save'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'autofmt'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'clones/vim-zsh'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'glidenote/serverspec-snippets'
NeoBundle 'gtags.vim'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kannokanno/previm'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'open-browser.vim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'rhysd/vim-textobj-anyblock'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'tacahilo/itamae-snippets'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vimwiki'
NeoBundle 'w0ng/vim-hybrid'
NeoBundleLazy 'lambdalisue/vim-gista', { 'autoload': {
      \  'commands': ['Gista'],
      \  'mappings': '<Plug>(gista-',
      \  'unite_sources': 'gista',
      \}}
NeoBundleLazy 'vim-perl/vim-perl', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {
  \ 'autoload': {'filetypes': ['ruby', 'eruby']}}
NeoBundleLazy 'nvie/vim-flake8', {
  \ 'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'rodjek/vim-puppet', {
  \ 'autoload': {'filetypes': ['puppet']}}
NeoBundleLazy 'puppetlabs/puppet-syntax-vim', {
  \ 'autoload': {'filetypes': ['puppet']}}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Preferences
"" Display
syntax enable
set background=dark
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
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=8
endif

set showmatch
set matchtime=1
runtime macros/matchit.vim

if has('mac')
  set guifont=RictyForPowerline-Regular
  set guifontset=RictyForPowerline-Regular
  set guifontwide=RictyForPowerline-Regular
endif

"" Filetype
augroup filetypedetect
  autocmd! BufNewFile,BufRead Gemfile,*.rake set filetype=ruby
  autocmd! BufNewFile,BufRead *.psgi,*.t     set filetype=perl
  autocmd! BufNewFile,BufRead *.mkd,*.md     set filetype=markdown
  autocmd! BufNewFile,BufRead *.tt           set filetype=tt2html
augroup END

"" Encode and Files
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

"" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"" Input
set cindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed
set nrformats=""

" https://gist.github.com/rbtnn/8540338 http://d.hatena.ne.jp/hyuki/20140122/vim#c
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

"" Keymaps
nnoremap go :<C-u>call append('.', '')<CR>
nnoremap gO :normal! O<ESC>j
nnoremap Y y$
"" for perl
inoremap <C-d> $
inoremap <C-a> @

" Plug-in
"" NeoComplete
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
function! s:my_cr_func()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

" Dictionary
let $VIMHOME = $HOME . '/.vim'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'ruby' : $VIMHOME.'/dict/ruby.dict',
    \ 'perl' : $VIMHOME.'/dict/perl.dict',
    \ 'php' : $VIMHOME.'/dict/php.dict'
\ }

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/bundle/serverspec-snippets,~/.vim/bundle/itamae-snippets'

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"" unite.vim
call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'direction': 'botright',
      \ 'ignorecase': 1,
      \ 'smartcase': 1,
      \})
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,u :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,l :<C-u>Unite location_list<CR>
" grep http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,c :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']

"" vim-operator-surround
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" delete or replace most inner surround
" if you use vim-textobj-multiblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" if you use vim-textobj-anyblock
nmap <silent>sda <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>sra <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" if you use vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

"" easy-motion
let g:EasyMotion_do_mapping = 0
nmap t <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"" indentLine
let g:indentLine_faster = 1
let g:indentLine_color_term = 232

"" easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'outputter/buffer/split': ':botright',
      \  'hook/time/enable': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"" ctrlp
" set wildignore+=**/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bundle)$',
  \ 'file': '\v\.(so)$',
  \ }

"" memolist
let g:memolist_memo_suffix = "md"
let g:memolist_path = "~/memo"
let g:memolist_prompt_tags = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-auto-preview"
map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>

"" lightline
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

"" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0

"" textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"" instant_markdown
" gem install redcarpet
" npm -g install instant-markdown-d
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

"" vim-markdown
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_frontmatter=1

"" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

nnoremap - :Switch<cr>
let g:gista#github_user = 'tacahilo'
