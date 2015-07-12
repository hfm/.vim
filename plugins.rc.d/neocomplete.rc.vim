let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_func()<CR>
function! s:my_cr_func()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><C-e> neocomplete#cancel_popup()

" Dictionary
let $VIMHOME = $HOME . '/.vim'
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'ruby' : $VIMHOME.'/dict/ruby.dict',
      \ 'perl' : $VIMHOME.'/dict/perl.dict',
      \ 'php' : $VIMHOME.'/dict/php.dict'
      \ }
