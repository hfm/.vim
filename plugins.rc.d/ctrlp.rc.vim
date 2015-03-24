map ,b :CtrlPBuffer<CR>
map ,t :CtrlPTag<CR>
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|bundle)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
