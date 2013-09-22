" #NeoBundle {{{1
" ##setup {{{2
set nocompatible

if has('vim_starting')
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
  \ "autoload": {"insert": 1}}
NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': {'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCurrentDir']}}
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'tsukkee/unite-tag'
NeoBundleLazy 'Shougo/vimfiler.vim', {
  \ 'autoload': {
  \   'commands': ['VimFilerTab', 'VimFiler', 'VimFilerExplorer'],
  \   'mappings': ['<Plug>(vimfiler_switch)'],
  \   'explorer': 1,
  \ }}
NeoBundleLazy 'Shougo/neosnippet', {
  \ 'autoload': {'insert': 1}}
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Tacahilo/vim-foldtext'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Align'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'vim-perl/vim-perl', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'c9s/perlomni.vim', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'y-uuki/unite-perl-module.vim', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'y-uuki/perl-local-lib-path.vim', {
  \ 'autoload': {'filetypes': ['perl']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {
  \ 'autoload': {'filetypes': ['ruby', 'eruby']}}
NeoBundleLazy 'nvie/vim-flake8', {
  \ 'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'rodjek/vim-puppet', {
  \ 'autoload': {'filetypes': ['puppet']}}
NeoBundleLazy 'tpope/vim-markdown.git', {
  \ 'autoload': {'filetypes': ['markdown']}}
NeoBundle 'csexton/jekyll.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mattn/sonictemplate-vim'

filetype plugin indent on
NeoBundleCheck
" }}}
" }}}

" #Preferences {{{1
" ##Snippets and Dict {{{2
augroup filetypedetect
  autocmd! BufNewFile,BufRead Gemfile,*.rake,Vagrantfile,Brewfile set filetype=ruby
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
"}}}
" ##keymaps {{{2
" http://avr.paslog.jp/article/2496343.html
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>

"" 挿入モード中に'Ctr-*'でコマンドモードでの移動・削除を可能にする
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <Leader><c-w> :silent ! start chrome %<CR>

"" for perl
inoremap <C-d> $
inoremap <C-a> @
"}}}
" ##Display {{{2
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable " シンタックスカラーリングを設定する
set number " 行番号を表示する
set title " 編集中のファイル名を表示する
set showcmd " 入力中のコマンドを表示する
set ruler " 座標を表示する
set list " タブ、行末等の不可視文字を表示する
set showmatch   " 閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3 " showmatchの表示時間
set listchars=eol:$,tab:>\ ,extends:< " listで表示される文字のフォーマットを指定する
set laststatus=2 " ステータスラインを常に表示する

set cursorline " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
hi CursorLine ctermbg=black guibg=black
nnoremap <Leader>c :<C-u>setlocal cursorline!<CR>

set guifont=RictyForPowerline-Regular
set guifontset=RictyForPowerline-Regular
set guifontwide=RictyForPowerline-Regular
"}}}
"}}}

" #Plug-in {{{1
" ##NeoComplete {{{2
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
function! s:my_cr_func()
  return pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
endfunction
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

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
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,us :<C-u>Unite colorscheme -auto-preview<Cr>
" grep http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"}}}
" ##syntastic {{{2
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}
" ##vim-surround {{{2
let g:surround_custom_mapping = {}
let g:surround_custom_mapping.ruby = {
      \ '-':  "<% \r %>",
      \ '=':  "<%= \r %>",
      \ '#':  "#{\r}",
      \ }
" }}}
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
" ##VimFiler {{{2
let g:vimfiler_as_default_explorer = 1
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=50 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)
"}}}
" ##jekyll{{{2
let g:jekyll_path = "~/Documents/blog"
let g:jekyll_post_published = "false"
let g:jekyll_prompt_tags = "true"
let g:jekyll_post_created = "%Y-%m-%d %H:%M"
let g:jekyll_prompt_categories = "true"
" }}}
" ##memolist {{{2
let g:memolist_path = "~/memo"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_vimfiler = 1
map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
" }}}
" ##lightline {{{2
let g:lightline = {
      \ 'colorscheme': 'solarized',
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
"}}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=1
" vim: foldtext=Foldtext_base()
