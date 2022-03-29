inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 1
let g:lsp_text_edit_enabled = 1

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
"" for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

