" vim-rails
let g:rails_default_file='config/database.yml'
let g:rails_level=4
let g:rails_mappings=1
let g:rails_modelines=0
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

" RSpec
let g:RspecKeymap=0
map <D-R> :RunSpec<cr>
map <D-L> :RunSpecLine<cr>

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
