map ,b :CtrlPBuffer<CR>
map ,t :CtrlPTag<CR>
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|bundle)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'

" using ag
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup --hidden --ignore .git --ignore .bundle --ignore .DS_Store -g ""'
endif
