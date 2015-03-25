if neobundle#tap('neocomplete.vim')
  let g:acp_enableAtStartup = 0
  let neobundle#hooks.on_source = '~/.vim/plugins.rc.d/neocomplete.rc.vim'
  call neobundle#untap()
endif

if neobundle#tap('neosnippet.vim')
  let neobundle#hooks.on_source = '~/.vim/plugins.rc.d/neosnippet.rc.vim'
  call neobundle#untap()
endif

if neobundle#tap('ctrlp.vim')
  let neobundle#hooks.on_source = '~/.vim/plugins.rc.d/ctrlp.rc.vim'
  call neobundle#untap()
endif

if neobundle#tap('lightline.vim')
  let neobundle#hooks.on_source = '~/.vim/plugins.rc.d/lightline.rc.vim'
  call neobundle#untap()
endif

" quickrun.vim
let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'outputter/buffer/split': ':botright',
      \  'hook/time/enable': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nmap <silent> <Leader>r <Plug>(quickrun)
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

if neobundle#tap('vim-operator-surround')
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)
  call neobundle#untap()
endif

if neobundle#tap('vim-textobj-user')
  omap ab <Plug>(textobj-anyblock-a)
  omap ib <Plug>(textobj-anyblock-i)
  vmap ab <Plug>(textobj-anyblock-a)
  vmap ib <Plug>(textobj-anyblock-i)
  nmap <silent>sab <Plug>(operator-surround-append)<Plug>(textobj-anyblock-a)
  nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
  nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

  omap af <Plug>(textobj-between-a)
  omap if <Plug>(textobj-between-i)
  vmap af <Plug>(textobj-between-a)
  vmap if <Plug>(textobj-between-i)
  nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
  nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

  call neobundle#untap()
endif

if neobundle#tap('gista.vim')
  let g:gista#github_user = 'tacahilo'
  let g:gista#auto_yank_after_save = 0
  let g:gista#auto_yank_after_post = 0
  call neobundle#untap()
endif

"" memolist
let g:memolist_memo_suffix = "md"
let g:memolist_path = "~/memo"
let g:memolist_prompt_tags = 1
let g:memolist_ex_cmd = 'CtrlP'
map ,mn :MemoNew<CR>
map ,ml :MemoList<CR>
map ,mg :MemoGrep<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" switch.vim
nnoremap - :Switch<cr>
