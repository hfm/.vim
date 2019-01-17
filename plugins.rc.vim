source $HOME/.vim/plugins.rc.d/ctrlp.rc.vim
source $HOME/.vim/plugins.rc.d/lightline.rc.vim
source $HOME/.vim/plugins.rc.d/quickrun.rc.vim
source $HOME/.vim/plugins.rc.d/memolist.rc.vim
source $HOME/.vim/plugins.rc.d/lsp.rc.vim

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

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" switch.vim
nnoremap - :Switch<cr>

" easy-motion
let g:EasyMotion_do_mapping = 0
nmap t <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" indentLine
let g:indentLine_color_term = 232

"" easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

let g:voom_tree_width = 60
let g:voom_default_mode = 'markdown'
let g:indentLine_conceallevel = 0

" vim-racer
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH = "$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"
let g:racer_experimental_completer = 1
