source ~/.vim/plugins.rc.d/neocomplete.rc.vim
source ~/.vim/plugins.rc.d/neosnippet.rc.vim
source ~/.vim/plugins.rc.d/ctrlp.rc.vim
source ~/.vim/plugins.rc.d/lightline.rc.vim

let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'hook/time/enable': '1',
      \  'outputter/buffer/split': ':botright 10sp',
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

nmap <silent> <Leader>r <Plug>(quickrun)

map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

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

let g:memolist_memo_suffix = 'md'
let g:memolist_path = '~/memo'
let g:memolist_prompt_tags = 1
let g:memolist_ex_cmd = 'CtrlP'
map ,mn :MemoNew<CR>
map ,ml :MemoList<CR>
map ,mg :MemoGrep<CR>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" switch.vim
nnoremap - :Switch<cr>

" watchdogs.vim
let g:quickrun_config = {
      \   'watchdogs_checker/_' : {
      \       'outputter/quickfix/open_cmd' : '',
      \   },
      \   'ruby/watchdogs_checker' : {
      \       'type' : 'watchdogs_checker/rubocop'
      \   },
      \}
" let g:quickrun_config["watchdogs_checker/puppet"] = {
"       \ "command" : "puppet-lint",
"       \ "exec"    : '%c %o %s:p',
"       \ }
" let g:quickrun_config["puppet/watchdogs_checker"] = {
"       \ "type" : "watchdogs_checker/puppet",
"       \ }

let g:watchdogs_check_CursorHold_enable = 0
let g:watchdogs_check_BufWritePost_enable = 0
let g:watchdogs_check_BufWritePost_enable_on_wq = 0

" easy-motion
let g:EasyMotion_do_mapping = 0
nmap t <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" indentLine
let g:indentLine_faster = 1
let g:indentLine_color_term = 232

"" easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

let g:voom_tree_width = 60
let g:voom_default_mode = 'markdown'
