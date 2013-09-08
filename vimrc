" #NeoBundle {{{1
" ##setup {{{2
" "http://lambdalisue.hatenablog.com/entry/2013/06/23/071344
set nocompatible

let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
  " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
  " 読み込まない
  let s:noplugin = 1
else
  " NeoBundleを'runtimepath'に追加し初期化を行う
  if has('vim_starting')
    execute "set rtp+=" . s:neobundle_root
  endif
  call neobundle#rc(s:bundle_root)

  NeoBundleFetch 'Shougo/neobundle.vim'
  "}}}
  " ##plugin {{{2
  NeoBundle 'Shougo/neocomplcache'
  NeoBundleLazy 'Shougo/unite.vim', { 'autoload' : {'commands' : ['Unite', 'UniteWithBufferDir'] } }
  NeoBundle 'Shougo/vimfiler.vim', {
        \ 'depends': ['Shougo/unite.vim'],
        \ 'autoload': {
        \   'commands': ['VimFilerTab', 'VimFiler', 'VimFilerExplorer'],
        \   'mappings': ['<Plug>(vimfiler_switch)'],
        \   'explorer': 1,
        \ }}
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
        \ }}
  NeoBundleLazy 'Shougo/neosnippet', { 'autoload': {'insert': 1 } }
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'Tacahilo/vim-foldtext'
  NeoBundle 'tpope/vim-markdown.git'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'kana/vim-smartinput'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'Align'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'majutsushi/tagbar', {
        \ 'autload': {
        \   'commands': ['TagbarToggle'],
        \ },
        \ 'build': {
        \   'mac': 'brew install ctags',
        \ } }
  " perl
  NeoBundleLazy 'vim-perl/vim-perl', { 'autoload' : { 'filetypes': ['perl'] } }
  NeoBundleLazy 'hotchpotch/perldoc-vim', { 'autoload': { 'filetype': ['perl'] } }
  " ruby
  NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'tpope/vim-rails', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'skwp/vim-rspec', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } } "RBENV_VERSION=system sudo gem install hpricot
  NeoBundleLazy 'rhysd/unite-ruby-require.vim', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'rhysd/neco-ruby-keyword-args', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  " python
  NeoBundleLazy 'nvie/vim-flake8', {
        \ 'autoload': { 'filetypes': ['python'] },
        \ 'build': {
        \   'mac': ['pip install flake8'],
        \   'unix': ['pip install flake8'],
        \ }}
  " html/css
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'cakebaker/scss-syntax.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  "other
  NeoBundle 'rodjek/vim-puppet',
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'joker1007/vim-ruby-heredoc-syntax'
  NeoBundle 'joker1007/vim-markdown-quote-syntax'
  NeoBundle 'csexton/jekyll.vim'
  NeoBundle 'glidenote/memolist.vim'
  NeoBundle 'fuenor/qfixgrep'

  NeoBundleCheck
endif

filetype plugin indent on
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
" ##Encode {{{2
set encoding=UTF-8 "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする
"}}}
" ##File {{{2
set hidden "ファイル変更中でも他のファイルを開けるようにする
set autoread "ファイル内容が変更されると自動読み込みする
"}}}
" ##Backup {{{2
set backupdir=$HOME/.backup/vim "バックアップディレクトリを指定する
set browsedir=buffer "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=$HOME/.backup/vim "スワップファイルディレクトリを指定する
set history=10000 "履歴保存数
"}}}
" ##Search {{{2
set incsearch "インクリメンタルサーチを行う
set hlsearch "検索結果をハイライトする
set ignorecase "検索時に文字の大小を区別しない
set smartcase "検索時に大文字を含んでいたら大小を区別する
set wrapscan "検索をファイルの先頭へループする
"}}}
" ##Input {{{2
set cindent "C言語のインデントに従って自動インデントを行う
set expandtab "<Tab>の代わりに<Space>を挿入する
set shiftwidth=2 "行頭での<Tab>の幅
set tabstop=2 "行頭以外での<Tab>の幅
set softtabstop=2 "expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed "クリップボードを利用する
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
" ##NeoComplecache {{{2
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion=1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion=1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list=10 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length=3 " シンタックスをキャッシュするときの最小文字長
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"

" 改行、Deleteキーで補完ウィンドウを閉じる
function! s:my_cr_func()
  return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction

inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
""inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
let g:neocomplcache_ctags_arguments_list = {
      \ 'perl' : '-R -h ".pm"'
      \ }
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'perl'    : $HOME . '/.vim/dict/perl.dict',
      \ 'php'     : $HOME . '/.vim/dict/php.dict',
      \ }
"}}}
" ##NeoComplecache_Snippets {{{2
"http://kazuph.hateblo.jp/entry/2013/01/19/193745"
let g:neocomplcache_snippets_dir='~/.vim/snippets' " snippetの配置場所
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
" ##unite.vim {{{2
nnoremap <silent> ,ub :<C-u>Unite buffer<CR> "バッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR> "ファイル一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR> "レジスタ一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR> "最近使用したファイル一覧
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR> "常用セット
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR> "全部乗せ

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
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_zsh_checkers=['zsh']
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
let g:indent_guides_enable_on_vim_startup=1 " vim-indent-guidesの自動有効化
let g:indent_guides_color_change_percent=5 "色の変化の幅（パーセント）
let g:indent_guides_guide_size=1 "インデントの色付け幅
let g:indent_guides_start_level=1
let g:indent_guides_space_guides=1
"}}}
" ##vim-quickrun {{{2
let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'outputter/buffer/split': ':botright',
      \  'hook/time/enable': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {
      \  'command': 'rspec',
      \}
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
" ##vim-smartinput{{{2
"http://studio.tgl.jp/blog/?p=1835 HTML, ERB
call smartinput#map_to_trigger('i', '<', '<', '<')
call smartinput#map_to_trigger('i', '>', '>', '>')
call smartinput#define_rule({
      \   'at': '\%#', 'char': '<', 'input': '<>',
      \   'filetype': ['html', 'eruby'],
      \ })
call smartinput#define_rule({
      \   'at': '<.*\%#>', 'char': '>', 'input': '',
      \   'filetype': ['html', 'eruby'],
      \ })

" ERB
call smartinput#map_to_trigger('i', '%', '%', '%')
call smartinput#define_rule({
      \   'at': '<\%#', 'char': '%', 'input': '%%',
      \   'filetype': ['eruby'],
      \ })
call smartinput#define_rule({
      \   'at': '%.*\%#%', 'char': '%', 'input': '',
      \   'filetype': ['eruby'],
      \ })
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
let g:memolist_qfixgrep = 1
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
" ##other plugins {{{2
let g:unite_source_ruby_require_ruby_command='$HOME/.rbenv/shims/ruby'
nmap <Leader>t :TagbarToggle<CR>
"}}}
"}}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=1
" vim: foldtext=Foldtext_base()
