" #NeoBundle {{{1
" ##setup {{{2
if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
  set rtp+=$GOROOT/misc/vim
  exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/golang/lint/misc/vim')
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"}}}
" ##plugin {{{2
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \ }}
NeoBundleLazy 'Shougo/neocomplete.vim', {
  \ "autoload": {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet', {
  \ 'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet-snippets', {
  \ 'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': {'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCurrentDir']}}
NeoBundle 'Align'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'Tacahilo/vim-foldtext'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'rhysd/vim-textobj-anyblock'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-auto-save'
NeoBundle 'kien/ctrlp.vim'
NeoBundleLazy 'vim-perl/vim-perl', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {
  \ 'autoload': {'filetypes': ['ruby', 'eruby']}}
NeoBundleLazy 'nvie/vim-flake8', {
  \ 'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'puppetlabs/puppet-syntax-vim', {
  \ 'autoload': {'filetypes': ['puppet']}}

filetype plugin indent on
NeoBundleCheck
" }}}
" }}}

" #Preferences {{{1
" ##Display {{{2
syntax enable
set background=dark
colorscheme default
set number
set title
set showcmd
set ruler
set list
set showmatch
set matchtime=3
set listchars=eol:$,tab:>\ ,extends:<
set laststatus=2
set ambiwidth=double

if has('mac')
  set guifont=RictyForPowerline-Regular
  set guifontset=RictyForPowerline-Regular
  set guifontwide=RictyForPowerline-Regular
endif
"}}}
" ##Snippets and Dict {{{2
augroup filetypedetect
  autocmd! BufNewFile,BufRead Gemfile,*.rake set filetype=ruby
  autocmd! BufNewFile,BufRead *.psgi,*.t   set filetype=perl
  autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END
"}}}
" ##Encode and Files{{{2
set encoding=utf-8
set fileencoding=utf-8
set hidden
set autoread
set backupdir=$HOME/.backup/vim
set browsedir=buffer
set directory=$HOME/.backup/vim
set history=10000
set noswapfile
 "}}}
" ##Search {{{2
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
"}}}
" ##Input {{{2
set cindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed
set nf=""
"}}}
" ##Keymaps {{{2
nnoremap go :<C-u>call append('.', '')<CR>
nnoremap gO :normal! O<ESC>j
"" for perl
inoremap <C-d> $
inoremap <C-a> @
"}}}
"}}}

" #Plug-in {{{1
" ##NeoComplete {{{2
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

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ##NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
" ##unite.vim {{{2
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1
let g:unite_enable_split_vertically=1
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
"}}}
" ##syntastic {{{2
let g:syntastic_check_on_open=0
let g:syntastic_always_populate_loc_list=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}
" ##vim-operator-surround {{{2
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
" ##vim-indent-guides {{{2
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"}}}
" ##vim-quickrun {{{2
let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'outputter/buffer/split': ':botright',
      \  'hook/time/enable': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"}}}
" ##ctrlp {{{2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bundle)$|vendor/ruby',
  \ 'file': '\v\.(so)$',
  \ }
" }}}
" ##memolist {{{2
let g:memolist_memo_suffix = "md"
let g:memolist_path = "~/memo"
let g:memolist_prompt_tags = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-auto-preview"
map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
" }}}
" ##lightline {{{2
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
" }}}
" ##textobj-multiblock {{{2
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
" }}}
let g:auto_save = 1
nnoremap - :Switch<cr>
"}}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=1
" vim: foldtext=Foldtext_base()
